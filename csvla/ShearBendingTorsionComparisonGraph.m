
%% Scripting that plots shear, bending, torsion distributions along the wing semi-span 

% SHEAR 
for i = 1:n_Mass
    figure(n_figure) 
    
    hold on; grid on; grid minor; 
    ylim padded; xlim padded; 
    
    plot(y_flipped, Shear_distr_S(:,i)    , 'LineWidth', 1)    
    plot(y_flipped, Shear_distr_A(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_C(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_D(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_S_inv(:,i), 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_G(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_F(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Shear_distr_E(:,i)    , 'LineWidth', 1)
    
    xlabel("Wing semi-span station - $y$ (m)"   , "Interpreter", "latex")
    ylabel("Shear force - $S(y)$ (daN)", "Interpreter", "latex")
    title("Shear force distribution comparison", "Interpreter", "latex")
    
    % SAVING FIGURES
    name_figure = 'ShearComparison';
    filename    = strcat(name_figure, num2str(i));
    saveas(figure(n_figure), filename, 'fig');
    filename    = strcat(name_figure, num2str(i), '.fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure, num2str(i), '.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure, num2str(i), '.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
    n_figure    = n_figure + 1;
end

n_figure = n_figure + 1; 

% BENDING 
for i = 1:n_Mass
    figure(n_figure) 
    
    hold on; grid on; grid minor; 
    ylim padded; xlim padded; 
    
    plot(y_flipped, Bend_mom_distr_S(:,i)    , 'LineWidth', 1)    
    plot(y_flipped, Bend_mom_distr_A(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_C(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_D(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_S_inv(:,i), 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_G(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_F(:,i)    , 'LineWidth', 1) 
    plot(y_flipped, Bend_mom_distr_E(:,i)    , 'LineWidth', 1)
    
    xlabel("Wing semi-span station - $y$ (m)"   , "Interpreter", "latex")
    ylabel("Bending moment - $B(y)$ ($daN\cdot m$)", "Interpreter", "latex")
    title("Bending moment distribution comparison", "Interpreter", "latex")
    
    % SAVING FIGURES
    name_figure = 'BendMomComparison';
    filename    = strcat(name_figure, num2str(i));
    saveas(figure(n_figure), filename, 'fig');
    filename    = strcat(name_figure, num2str(i), '.fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure, num2str(i), '.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure, num2str(i), '.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
    n_figure    = n_figure + 1;
end

n_figure = n_figure + 1; 

for i = 1:n_Mass
    figure(n_figure) 

    hold on; grid on; grid minor; 
    ylim padded; xlim padded; 

    plot(y_flipped, Tors_mom_distr_S(:,i)         , 'LineWidth', 1)    
    plot(y_flipped, Tors_mom_distr_A(:,i)         , 'LineWidth', 1) 
    plot(y_flipped, Tors_mom_distr_C(:,i)         , 'LineWidth', 1) 
    plot(y_flipped, Tors_mom_distr_D(:,i)         , 'LineWidth', 1) 
    plot(y_flipped, abs(Tors_mom_distr_S_inv(:,i)), 'LineWidth', 1) 
    plot(y_flipped, abs(Tors_mom_distr_G(:,i))    , 'LineWidth', 1) 
    plot(y_flipped, abs(Tors_mom_distr_F(:,i))    , 'LineWidth', 1) 
    plot(y_flipped, abs(Tors_mom_distr_E(:,i))    , 'LineWidth', 1)

    xlabel("Wing semi-span station - $y$ (m)"   , "Interpreter", "latex")
    ylabel("Torsion moment - $T(y)$ ($daN\cdot m$)", "Interpreter", "latex")
    title("Torsion moment distribution comparison", "Interpreter", "latex")

    % SAVING FIGURES
    name_figure = 'TorsMomComparison';
    filename    = strcat(name_figure, num2str(i));
    saveas(figure(n_figure), filename, 'fig');
    filename    = strcat(name_figure, num2str(i), '.fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure, num2str(i), '.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure, num2str(i), '.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')

    n_figure    = n_figure + 1;
end  