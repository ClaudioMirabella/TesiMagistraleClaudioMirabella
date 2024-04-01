
%% PLOT RESULTS - METHOD A + B 
% PlotMethodBHorizontalTailLoads

% INITIALIZATION
xcg_bar_envelope = Aircraft.Geometry.General.xcg_bar_envelope.value;

% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% METHOD A + B - PITCH UP 

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, MethodAplusBtotal_tail_airloads_pitch_up, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method $A + B$ - Pitch up"                                       , "Interpreter", "latex")

n_figure = n_figure + 1;
    
%% METHOD A + B - PITCH DOWN

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, MethodAplusBtotal_tail_airloads_pitch_down, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method $A + B$ - Pitch down"                                     , "Interpreter", "latex")   