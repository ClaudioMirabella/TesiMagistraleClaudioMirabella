
%% PLOT RESULTS - METHOD A + B 
% PlotMethodBHorizontalTailLoads

% INITIALIZATION
xcg_bar_envelope = Aircraft.Geometry.General.xcg_bar_envelope.value;

% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% METHOD C - UPWARD - VA

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_loads_at_VA_upward, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method C - Upward case - $V_{A}$"                                , "Interpreter", "latex")

n_figure = n_figure + 1;
    
%% METHOD C - DOWNWARD - VA

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_loads_at_VA_downward, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method C - Downward case - $V_{A}$"                              , "Interpreter", "latex")   

n_figure = n_figure + 1;

%% METHOD C - UPWARD - VD

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_loads_at_VD_upward, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method C - Upward case - $V_{D}$"                                , "Interpreter", "latex")

n_figure = n_figure + 1;
    
%% METHOD C - DOWNWARD - VD

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_loads_at_VD_downward, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method C - Downward case - $V_{D}$"                              , "Interpreter", "latex")   