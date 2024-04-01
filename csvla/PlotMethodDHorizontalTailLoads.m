
%% PLOT RESULTS - METHOD D 

% INITIALIZATION
xcg_bar_envelope      = Aircraft.Geometry.General.xcg_bar_envelope.value;

Crit_Load_at_VA_case1 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_Total_Load.value;
Crit_Load_at_VA_case2 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_Total_Load.value;
Crit_Load_at_VA_case3 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_Total_Load.value;
Crit_Load_at_VA_case4 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_Total_Load.value;

Crit_Load_at_VD_case1 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_Total_Load.value;
Crit_Load_at_VD_case2 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_Total_Load.value;
Crit_Load_at_VD_case3 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_Total_Load.value;
Crit_Load_at_VD_case4 = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_Total_Load.value;

% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% METHOD D - VA

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Crit_Load_at_VA_case1, '.r', 'MarkerSize', 18, 'DisplayName','Case 1')
plot(xcg_bar_envelope, Crit_Load_at_VA_case2, '.b', 'MarkerSize', 18, 'DisplayName','Case 2')
plot(xcg_bar_envelope, Crit_Load_at_VA_case3, '.k', 'MarkerSize', 18, 'DisplayName','Case 3')
plot(xcg_bar_envelope, Crit_Load_at_VA_case4, '.g', 'MarkerSize', 18, 'DisplayName','Case 4')

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method D - $V_{A}$"                                              , "Interpreter", "latex")

legend('Location', 'best')

n_figure = n_figure + 1;
    
%% METHOD D - VD

figure(n_figure)

hold on; grid on; grid minor;

plot(xcg_bar_envelope, Crit_Load_at_VD_case1, '.r', 'MarkerSize', 18, 'DisplayName','Case 1')
plot(xcg_bar_envelope, Crit_Load_at_VD_case2, '.b', 'MarkerSize', 18, 'DisplayName','Case 2')
plot(xcg_bar_envelope, Crit_Load_at_VD_case3, '.k', 'MarkerSize', 18, 'DisplayName','Case 3')
plot(xcg_bar_envelope, Crit_Load_at_VD_case4, '.g', 'MarkerSize', 18, 'DisplayName','Case 4')

ylim padded 
xlim padded 

xlabel("Non dimensional C.G. position - $x_{cg}$ ($MAC\,\%$)"           , "Interpreter", "latex")
ylabel("Total loads - $L_{ht}$ (daN)"                                   , "Interpreter", "latex")
title("Method D - $V_{D}$"                                              , "Interpreter", "latex")

legend('Location', 'best')