
%% SCHRENK METHOD - CALCULATIONS 

% Initialization
b_wing         = Aircraft.Geometry.Wing.b.value;
S_wing         = Aircraft.Geometry.Wing.S.value;
N              = Aircraft.OpenVSP.input.openvsp_total_tess.value;
c_root         = Aircraft.Geometry.Wing.chord_distribution.value(1);
c_tip          = Aircraft.Geometry.Wing.chord_distribution.value(end);
chord_distr    = Aircraft.Geometry.Wing.chord_distribution.value;
half_span      = Aircraft.Geometry.Wing.half_span_stations.value;

Schrenk_out    = Schrenk_load_distr(b_wing, S_wing, chord_distr, half_span); % Schrenk_out = [eta, Ellipse, Schrenk_cCl, Unit_Cl]

% Results 
eta                                                     = Schrenk_out(:,1); 
Aircraft.Geometry.Wing.eta_half_span.value              = eta; 
Aircraft.Geometry.Wing.eta_half_span.Attributes.unit    = "Non dimensional";
Elliptical_load                                         = Schrenk_out(:,2); 
Aircraft.Schrenk.output.Elliptical_load.value           = Elliptical_load;
Aircraft.Schrenk.output.Elliptical_load.Attributes.unit = "Non dimensional";
Schrenk_cCl                                             = Schrenk_out(:,3); 
Aircraft.Schrenk.output.Schrenk_cCl.value               = Schrenk_cCl;
Aircraft.Schrenk.output.Schrenk_cCl.Attributes.unit     = "m";
Unit_Cl                                                 = Schrenk_out(:,4); 
Aircraft.Schrenk.output.Unit_Cl.value                   = Unit_Cl;
Aircraft.Schrenk.output.Unit_Cl.Attributes.unit         = "Non dimensional";

%% PLOT RESULTS 

% Figure number 
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

figure(n_figure) 

hold on; grid on; grid minor; 

ylim padded
xlim padded

plot(half_span, chord_distr,     '-k', 'LineWidth', 0.5)
plot(half_span, Elliptical_load, '-b', 'LineWidth', 0.5)
plot(half_span, Unit_Cl,         '-r', 'LineWidth', 1.0)

ylabel("Lift coeff. distribution - $C_l = C_{l}(y)$" , "Interpreter", "latex")
xlabel("Half-span stations - $y$ ($m$)"              , "Interpreter", "latex")
title("Schrenk Method results"                       , "Interpreter", "latex")

n_figure = n_figure + 1; 

%% DERIVED DISTRIBUTION ALONG THE WING SPAN 

cd                                                 = polyval(p_CD_wb1, Unit_Cl);
Aircraft.Schrenk.output.cd.value                   = cd;
Aircraft.Schrenk.output.cd.Attributes.unit         = "Non dimensional";
cm                                                 = polyval(p_CM_wb , Unit_Cl);
Aircraft.Schrenk.output.cm.value                   = cm;
Aircraft.Schrenk.output.cm.Attributes.unit         = "Non dimensional";

%% PLOT DRAG AND PITCHING MOMENT DISTRIBUTIONS 

% Drag distribution
figure(n_figure) 

hold on; grid on; grid minor; 

ylim padded 
xlim padded 

plot(half_span, cd,         '-r', 'LineWidth', 1.0)

ylabel("Drag coeff. distribution - $C_d = C_{d}(y)$" , "Interpreter", "latex")
xlabel("Half-span stations - $y$ ($m$)"              , "Interpreter", "latex")
title("Schrenk Method results"                       , "Interpreter", "latex")

n_figure = n_figure + 1;

% Pitching moment distribution 
figure(n_figure) 

hold on; grid on; grid minor; 

ylim padded 
xlim padded 

plot(half_span, cm,         '-r', 'LineWidth', 1.0)

ylabel("Pitching moment coeff. distribution - $C_m = C_{m}(y)$" , "Interpreter", "latex")
xlabel("Half-span stations - $y$ ($m$)"                         , "Interpreter", "latex")
title("Schrenk Method results"                                  , "Interpreter", "latex")
