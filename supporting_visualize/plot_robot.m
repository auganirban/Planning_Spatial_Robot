function[] =  plot_robot()
    global link1_cylinder1; global link2_cylinder2; global link3_cylinder3;
    global link4_cylinder4; global link5_cylinder5; global link6_cylinder6;
    global link7_cylinder7; global link8_cylinder8; global link9_cylinder9;
    global link10_cylinder10; global n_pts;
    
    %/////////////////////////////////////////////////////////////
    %///////////////////// Plotting //////////////////////////////
    %/////////////////////////////////////////////////////////////
    % Plot the links as cylinders
    link1 = surf(reshape(link1_cylinder1(1, :), [2, n_pts]), reshape(link1_cylinder1(2, :), [2, n_pts]), reshape(link1_cylinder1(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    hold on;
    offset1 = surf(reshape(link2_cylinder2(1, :), [2, n_pts]), reshape(link2_cylinder2(2, :), [2, n_pts]), reshape(link2_cylinder2(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link2 = surf(reshape(link3_cylinder3(1, :), [2, n_pts]), reshape(link3_cylinder3(2, :), [2, n_pts]), reshape(link3_cylinder3(3, :), [2, n_pts]), 'FaceColor', [0.2, 0.2, 0.9], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link3 = surf(reshape(link4_cylinder4(1, :), [2, n_pts]), reshape(link4_cylinder4(2, :), [2, n_pts]), reshape(link4_cylinder4(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    offset2 = surf(reshape(link5_cylinder5(1, :), [2, n_pts]), reshape(link5_cylinder5(2, :), [2, n_pts]), reshape(link5_cylinder5(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link4 = surf(reshape(link6_cylinder6(1, :), [2, n_pts]), reshape(link6_cylinder6(2, :), [2, n_pts]), reshape(link6_cylinder6(3, :), [2, n_pts]), 'FaceColor', [0.2, 0.2, 0.9], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link5 = surf(reshape(link7_cylinder7(1, :), [2, n_pts]), reshape(link7_cylinder7(2, :), [2, n_pts]), reshape(link7_cylinder7(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    offset3 = surf(reshape(link8_cylinder8(1, :), [2, n_pts]), reshape(link8_cylinder8(2, :), [2, n_pts]), reshape(link8_cylinder8(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link6 = surf(reshape(link9_cylinder9(1, :), [2, n_pts]), reshape(link9_cylinder9(2, :), [2, n_pts]), reshape(link9_cylinder9(3, :), [2, n_pts]), 'FaceColor', [0.2, 0.2, 0.9], 'Facealpha', 0.8, 'EdgeColor', 'none');
    link7 = surf(reshape(link10_cylinder10(1, :), [2, n_pts]), reshape(link10_cylinder10(2, :), [2, n_pts]), reshape(link10_cylinder10(3, :), [2, n_pts]), 'FaceColor', [0.9, 0.2, 0.2], 'Facealpha', 0.8, 'EdgeColor', 'none');
     
    drawnow;
    
    % delete drawn objects
    delete(link1); delete(link2); delete(link3); delete(link4); delete(link5);
    delete(link6); delete(link7); delete(offset1); delete(offset2); delete(offset3);
    
end