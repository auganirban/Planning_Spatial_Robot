clc;
clear;
close all;

addpath("supporting_quatlib");      addpath("supporting_kinlib");
addpath("supporting_visualize");    addpath("pathmexa64");             
addpath("supporting_colli_models");  

% Set convergence parameters
count = 1; reach_dist = 1e-4; rot_dist = 0.02;
prev_position_err = 100; prev_rotation_err = 100;

% Set SclERP parameter
beta = 0.02; Tau = 0.5; h = 0.01;

% Define initial joint configuration
theta_initial = [0.0947, -1.3848, -0.3447, 2.2595, 0.1863, -0.8544, -0.0747]';
[g_initial, ~] = FK_RealBaxter(theta_initial);
A = Mat2DQ(g_initial);

% Define goal pose of end-effector
theta_final = [-1.3061, -0.5065, 0.4091, 0.9871, -0.4022, -0.4525, 0.0855]';
[g_final, ~] = FK_RealBaxter(theta_final);
R_g_final = g_final(1:3, 1:3);
B = Mat2DQ(g_final);

% Plot local start and goal
g_init = DQ2Mat(A); g_finl = DQ2Mat(B);
pt_ls = scatter3(g_init(1, 4), g_init(2, 4), g_init(3, 4), 'k', 'filled');
hold on;
pt_lg = scatter3(g_finl(1, 4), g_finl(2, 4), g_finl(3, 4), 'k', 'filled');

% Main loop of iterative motion plan using PATH solver
q_o = theta_initial; 
currentDQ = A;
finalDQ = B;
[g, ~, ~, ~, g_intermediate] = FK_RealBaxter(q_o);
not_reached_flag = true;
theta_SCLERP = [];
theta_SCLERP(:, count) = q_o;
    
while not_reached_flag
    % Compute g_tau and DQ tau    
    [~, ResDQ] = Screw_Lin(currentDQ, finalDQ, Tau);

    % Move end effector to g_tau by approximating joint angles   
    J_st = JS_RealBaxter(q_o);
    [link_cylinder_array] = arm_cylinder_model(g_intermediate);
    [theta_next, v_ts2js] = theta_next_step2(J_st, g, ResDQ, q_o, beta);
    q_o = theta_next;

    % Check if q_o is within joint limits
    if ~check_jlimits(q_o)
        fprintf("Joint limit violated. \n");
        break;
    end
    [g, ~, ~, ~, g_intermediate] = FK_RealBaxter(q_o);
    currentDQ = Mat2DQ(g);
    count = count+1;
    theta_SCLERP(:, count) = q_o;

    % Check how far from goal
    [rotation_err, position_err] = distDQ(B, currentDQ);

    if position_err < reach_dist && rotation_err < rot_dist
        not_reached_flag = false;
        fprintf("goal reached according to given tolerance. \n");
    end
    
    if position_err < 100*reach_dist
        Tau = Tau*1.2;
    end

    %/////////////// Plot the motion ///////////////
    plot_robot();
end
