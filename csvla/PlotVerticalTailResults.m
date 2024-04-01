%% PLOT RESULTS - VERTICAL TAIL LOADS 
% PlotVerticalTailResults

% INITIALIZATION
xcg_bar_envelope = Aircraft.Geometry.General.xcg_bar_envelope.value;
Total_force_vc   = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.value;
Total_moment_vc  = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.value;
Total_force_vd   = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.value;
Total_moment_vd  = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.value;

% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% CRITICAL CONDITIONS AT VC

% FORCES ON THE VERTICAL TAIL AT VC
figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_force_vc, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)" , "Interpreter", "latex")
ylabel("Total loads - $L_{vt}$ (daN)"                         , "Interpreter", "latex")
title("Vertical tail critical forces - $V_{C}$"               , "Interpreter", "latex")

n_figure = n_figure + 1;
    
% MOMENTS ON THE VERTICAL TAIL AT VC
figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_moment_vc, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)" , "Interpreter", "latex")
ylabel("Total loads - $M_{vt}$ (daN)"                         , "Interpreter", "latex")
title("Vertical tail critical moments - $V_{C}$"              , "Interpreter", "latex")

n_figure = n_figure + 1;

%% CRITICAL CONDITIONS AT VD

% FORCES ON THE VERTICAL TAIL AT VD
figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_force_vd, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)" , "Interpreter", "latex")
ylabel("Total loads - $L_{vt}$ (daN)"                         , "Interpreter", "latex")
title("Vertical tail critical forces - $V_{D}$"               , "Interpreter", "latex")

n_figure = n_figure + 1;
    
% MOMENTS ON THE VERTICAL TAIL AT VD
figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Total_moment_vd, '.r', 'MarkerSize', 18)

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)" , "Interpreter", "latex")
ylabel("Total loads - $M_{vt}$ (daN)"                         , "Interpreter", "latex")
title("Vertical tail critical moments - $V_{D}$"              , "Interpreter", "latex") 