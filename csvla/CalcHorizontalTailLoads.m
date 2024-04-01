
%% CalcHorizTailLoads
% Script to evaluate unsymmetrical load conditions associated with elevator
% deflection.
% =========================================================================
%   DESCRIPTION
%   It is useful to remember the following airworthiness rules: 
%   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%   CS-VLA 421 Balancing loads 
%
%   (a) A horizontal tail balancing load is a load necessary to maintain
%       equilibrium in any specified flight condition with no pitching
%       acceleration.
%
%   (b) Horizontal tail surfaces must be designed for the balancing loads
%       occuring at any point on the limit manoeuvring envelope and in the
%       flap conditions specified in CS - VLA 345. The distribution in
%       figure B6 of Appendix B may be used.
%       
%   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%   CS-VLA 423 Manoeuvring loads
%   Each horizontal tail surface must be designed for manoeuvring loads
%   imposed by one of the following conditions (a) + (b), or (c), or (d):
%
%   (a) A sudden deflection of the elevator control at VA, to 
%       (1) the maximum updward deflection; and 
%       (2) the maximum downward deflection, as limited by the control
%           stops or pilot effort, whichever is critical. 
%       The average loading of B11 of Appendix B and the distribution in
%       figure B7 of Appendix B may be used. 
%
%   (b) A sudden upward deflection of the elevator, at speeds abobe VA,
%       followed by a downward deflection of the elevator, resulting in the
%       following combinations of normal and angular acceleration:
%
%       |Condition | Normal acceleration (n) | Angular acceleration (rad/s^2)
%       |          |                         |
%       |Download  |                         |     (20.1)
%       |          | 1.0                     |  + ------- * n_m * (n_m - 1.5)
%       |          |                         |       V
%       |-------------------------------------------------------------------
%       |          |                         |
%       |Upload    |                         |     (20.1)
%       |          | n_m                     |  - ------- * n_m * (n_m - 1.5)
%       |          |                         |       V
%       |-------------------------------------------------------------------
%       
%       where
%       (1) n_m = positive limit manoeuvring factor used in the design of
%                 the aeroplane; and
%       (2) V   = initial speed in m/s.
%
%        The conditions in this paragraph involve loads corresponding to
%        the loads that may occur in "checked manoeuvre": 
%
%         CHECKED 
%        MANOEUVRE = A manoeuvre in which the pitching control is suddenly
%                    displaced in one direction and then suddenly moved in
%                    the opposite direction.
%
%        The deflections and timing avoiding exceeding the limit
%        manoeuvring loads factor. The total tail load for both down and up
%        load conditions is the sum of the balancing tail loads at V and
%        the specified value of the normal load factor n, plus the
%        manoeuvring load increment due to the specified value of the
%        normal load factor n, plus the manoeuvring increment due to the 
%        specified value of the normal load factor n, plus the manoeuvring
%        load increment due to the specified value of the angular 
%        acceleration. The manoeuvring load increment in figure B2 of
%        Appendix B and the distributions in figure B7 (for down loads) and
%        in figure B8 (for up loads) of Appendix B may be used. 
%
%   (c) A sudden deflection of the elevator, the following cases must be
%       considered:
%       
%       (i)   Speed VA, maximum upward deflection;
%       (ii)  Speed VA, maximum downward deflection;
%       (iii) Speed VD, one-third maximum upward deflection;
%       (iv)  Speed VD, one-third maximum downward deflection.
%
%       The followind assumptions must be made: 
%       
%       (A) The aeroplane is initially in level flight, and its attitude
%           and air speed do not change.
%       (B) The loads are balanced by inertia forces. 
%
%   (d) A sudden deflection of the elevator such as to cause the normal
%       acceleration to change from an initial value to a final value, the
%       following cases being considered (see figure 1):
%       
%      SPEED | INITIAL CONDITION | FINAL CONDITION | LOAD FACTOR INCREMENT
%      --------------------------------------------------------------------
%       VA   |        A1         |        A        |        n1 - 1.0
%            |        A          |        A1       |        1.0 - n1
%            |        A1         |        G        |        n4 - 1.0
%            |        G          |        A1       |        1.0 - n4       
%      --------------------------------------------------------------------
%       VD   |        D1         |        D        |        n2 - 1.0
%            |        D          |        D1       |        1.0 - n2
%            |        D1         |        E        |        n3 - 1.0 
%            |        E          |        D1       |        1.0 - n3
%      --------------------------------------------------------------------
%
%       For the purpose of this calculation the difference in air speed
%       between VA and the value corresponding to point G on the
%       manoeuvring envelope can be ignored. The following assumptions must
%       be made:
%
%       (1) the aeroplane is initially in level flight, and its attitude
%           and airspeed do not change;
%       (2) the loads are balanced by inertia forces;
%       (3) the aerodynamic tail load increment is given by:
%      
%                               / X_cg    S_ht     a_ht           d epsilon       1                                 \                                                  
%       DeltaP = DeltaN * Mg * <  ---- - ------ * ------ * [ 1 - ----------- ] - --- * 0.5 * rho0 * S_ht * a_ht * lt >
%                               \  lt      S        a              d alpha        M                                 /
%
%           where
%
%           DeltaP    = horizontal tail load increment, positive upwards 
%                       (N)
%           DeltaN    = load factor increment 
%           M         = mass of the aeroplane (kg) 
%           g         = acceleration due to gravity (m/s^2) 
%           X_cg      = longitudinal distance of aeroplane c.g. aft of the
%                       aerodynamic centre of the aeroplane less horizontal
%                       tail (m)
%           S_ht      = horizontal tail area (m^2) 
%           
%           d epsilon 
%           --------- = rate of change of downwash angle with angle of
%            d alpha    attack
% 
%           rho0      = density of air at sea-level (kg/m^3) 
%           lt        = tail arm (m)
%           S         = wing area (m^2)
%           a         = slope of wing lift curve per radian
%   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
%   CS - VLA 425 Gust loads 
%   
%   (a) Each horizontal tail surface must be designed for loads resulting
%       from 
%       (1) gust velocities specified in CS - VLA 333 (c) with flaps
%           retracted; and 
%       (2) positive and negative gust of 7.62 m/s nominal intensity at VF
%           corresponding to the flight conditions specified in CS - VLA
%           345 (a) (2).
%                                                                                 
%   (b) The average loading in figure B3 and the distribution of figure B8 
%       may be used to determine the incremental gust loads for the
%       requirements of subparagraph (a) applied as both up and down
%       increments for subparagraph (c).
%
%   (c) When determining the total load on the horizontal tail for the
%       conditions specified in subparagraph (a) of this paragraph, the
%       initial balancing tail loads for steady unaccelerated flight at the
%       pertinent design speeds VF, VC and VD must first be determined. The
%       incremental tail load resulting from the gusts must be added to the
%       initial balancing tail load to obtain the total tail load. 
%
%   (d) In the absence of a more rational analysis, the incremental tail
%       load due to the gust, must be computed as follows:
%       
%                     Kg * U_de * V * a_ht * S_ht          d epsilon
%       Delta L_ht = ----------------------------- * [1 - -----------]
%                              (16) * (3)                   d alpha
%
%       where 
%       Delta L_ht      = incremental horizontal tail load (daN);
%       Kg              = gust alleviation factor defined in CS - VLA 341;
%       U_de            = derived gust velocity (m/s);
%       V               = aeroplane equivalent speed (m/s);
%       a_ht            = slope of horizontal tail lift curve per radian; 
%       S_ht            = area of horizontal tail (m^2); 
%       
%            d epsilon 
%       1 - ----------- = downwash factor.
%             d alpha
%
% =========================================================================

%% INITIALIZATION 
nmax = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
nmin = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmin.value;
nA   = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.nA.value;
VA   = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.VA.value;
qA   = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value;
qD   = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.qD.value;
LhtA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.LhtA.value;
VD   = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.VD.value;
LhtD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.LhtD.value;

% Unit load factor quantities
V_unit_load_factor     = Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value;
n_unit_load_factor     = ones(length(V_unit_load_factor), 1);

% Airspeed and load factor vector composition - From Point A to Point D
for i = 1:n_Mass 
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i))
        % CASE 1 
        case "Case 1"
            if max(npos_cruise_sea_level(i,:)) > nmax 
                
                % Airspeed 
                V_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value;
                V_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value;
                V_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value;
                V_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value;
                
                % Load factors
                n_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value;
                n_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value;
                n_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value;
                n_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value;
                
                % Full vectors 
                n_fromAtoD = [n_fromAtoGust1; n_fromGust1toC; n_fromCtoGust2; n_fromGust2toD];
                V_fromAtoD = [V_fromAtoGust1; V_fromGust1toC; V_fromCtoGust2; V_fromGust2toD];
                
            elseif max(npos_cruise_sea_level(i,:)) < nmax
                
                % Airspeed 
                V_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoC.value;
                V_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoD.value;
                
                % Load factors
                n_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoC.value;
                n_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoD.value;
                
                % Full vectors 
                n_fromAtoD = [n_fromAtoC; n_fromCtoD];
                V_fromAtoD = [V_fromAtoC; V_fromCtoD];
                
            end
        case "Case 2"
                
            % Airspeed 
            V_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value;
            V_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value;
            V_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value;
            V_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value;

            % Load factors
            n_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value;
            n_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value;
            n_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value;
            n_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value;

            % Full vectors 
            n_fromAtoD = [n_fromAtoGust1; n_fromGust1toC; n_fromCtoGust2; n_fromGust2toD];
            V_fromAtoD = [V_fromAtoGust1; V_fromGust1toC; V_fromCtoGust2; V_fromGust2toD];
                
    end
end

% Store inside the struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.n_fromAtoD.value = n_fromAtoD;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.V_fromAtoD.value = V_fromAtoD;

% SWITCH TO SELECT CORRECTLY THE HORIZ. CONTROL EFFICIENCY TAU
elevator_flag                                  = Aircraft.Geometry.Elevator.elevator_flag.value;
tau_ht                                         = tau_decision_function(elevator_flag);
Aircraft.Geometry.Elevator.tau.value           = tau_ht;
Aircraft.Geometry.Elevator.tau.Attributes.unit = "Non dimensional";

% GENERAL VARIABLES FOR ALL THE CALCULATIONS
MAC                   = Aircraft.Geometry.Wing.MAC.value;
S_wing                = Aircraft.Geometry.Wing.S.value;
IY                    = Aircraft.Inertia.Iy.value; % <--- Aircraft Moment of Inertia along the pitching mom. axes
l_ht                  = Aircraft.Geometry.Horizontal.l_ht.value;
l_ht_envelope         = Aircraft.Geometry.Horizontal.l_ht_envelope.value;
S_ht                  = Aircraft.Geometry.Horizontal.S.value;
CLalfa_ht_rad         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_rad.value;
CLalfa_ht_deg         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_deg.value;
CLdelta_ht_rad        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_rad.value;
CLdelta_ht_deg        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_deg.value;
time_step             = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_step.value;
time_interval         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_interval.value;
time_vector           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_vector.value;
damping_factor        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_factor.value; 

% DAMPING ANGLE 
% The damping angle is defined as 
%
%                    DELTA  v
%    DAMPING ANGLE = --------
%                       VA
%
damping_angle_rad = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_rad.value; 
damping_angle_deg = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_deg.value; 

% RATIO L_TAIL / M.A.C. 
L_RATIO = zeros(n_Mass, 1);
for i = 1:n_Mass
    L_RATIO(i) = l_ht_envelope(i) / MAC;
end
Aircraft.Geometry.Horizontal.length_ratio.value           = L_RATIO;
Aircraft.Geometry.Horizontal.length_ratio.Attributes.unit = "Non dimensional";

% RATIO S_TAIL / S_WING 
S_RATIO = S_ht / S_wing;
Aircraft.Geometry.Horizontal.surface_ratio.value           = S_RATIO; 
Aircraft.Geometry.Horizontal.surface_ratio.Attributes.unit = "Non dimensional"; 

% HORIZONTAL TAIL VOLUME RATIO 
V_ht = zeros(n_Mass, 1);
for i = 1:n_Mass
    V_ht(i) = L_RATIO(i) * S_RATIO; 
end
Aircraft.Geometry.Horizontal.volume_Ratio.value           = V_ht;
Aircraft.Geometry.Horizontal.volume_Ratio.Attributes.unit = "Non dimensional";

%% TOTAL DEFLECTION TIME OF THE HORIZONTAL TAIL MOVABLE SURFACE 
% AMC 23.423 ADVISED TOTAL DEFLECTION TIME INTERVAL 
% BE CAREFUL: AMC 23.423 Suggest the use of various total deflection time
% interval for different aircraft categories (Normal, Utility, Commuter,
% Acrobatic, ...). Pleas, take care of the definition of the time interval.
type_flag                                                        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.type_flag.value;
command_flag                                                     = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.command_flag.value;
[total_deflection_time, unit]                                    = elevator_total_defl_time_decision(type_flag, command_flag);
Aircraft.Geometry.Elevator.total_deflection_time.value           = total_deflection_time;
Aircraft.Geometry.Elevator.total_deflection_time.Attributes.unit = unit;

%% SOLVING THE DIFFERENTIAL EQUATION - METHOD A - PITCH DOWN CASE 
% 
%     d^2 theta   (q * S_tail * a_tail * d)   /           delta_v     \
%     --------- = ------------------------- *| omega*dt - ------- * DF|
%       dt^2                 IY               \             VA        /
%
delta_elevator_max     = Aircraft.Geometry.Horizontal.ht_delta_max.value;
omega_deg              = (delta_elevator_max * tau_ht)*(1/total_deflection_time);
omega_rad              = deg2rad(omega_deg);
A0                     = ones(n_Mass, 1);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qA(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad  = omega_rad * time_vector;
alpha_prime_horiz_deg  = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
for i = 1:n_Mass
    [d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
end
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                    = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_deg.Attributes.unit = "deg";

% LIMIT HORIZONTAL TAIL LOAD 
DeltaLimitLTail_pitch_down = zeros(length(time_vector), n_Mass);
for i = 1:n_Mass
    for j = 1:length(time_vector)
        DeltaLimitLTail_pitch_down(j,i) = alpha_new_horiz_deg(j,i) * CLalfa_ht_deg * S_ht * qA(i,1) *(1e-1);
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.DeltaLimitLTail.value           = DeltaLimitLTail_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.DeltaLimitLTail.Attributes.unit = "daN";

% TOTAL LOAD APPLIED - PITCH DOWN CASE
TotalLoad = zeros(n_Mass, 1);
for i = 1:n_Mass
    TotalLoad(i,1) = LhtA(i) + DeltaLimitLTail_pitch_down(end,i);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.TotalLoad.value           = TotalLoad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.TotalLoad.Attributes.unit = "daN";

%% PLOT RESULTS - METHOD A - PITCH DOWN CASE
% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    plot(time_vector, DeltaLimitLTail_pitch_down(:,i), '-r', 'LineWidth', 0.8)
    ylim padded 
    xlim padded 
    
    xlabel("Time - $t$ ($s$)"                                               , "Interpreter", "latex")
    ylabel("Horiz. tail manoeuvring loads increment - $\Delta L_{ht}$ (daN)", "Interpreter", "latex")
    title("Method A - Pitch down"                                           , "Interpreter", "latex")
    
    n_figure = n_figure + 1;
    
end

%% SOLVING THE DIFFERENTIAL EQUATION - METHOD A - PITCH UP CASE
omega_deg             = (-0.8 * delta_elevator_max * tau_ht )*(1/ total_deflection_time );
omega_rad             = deg2rad(omega_deg);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qA(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad = omega_rad * time_vector;
alpha_prime_horiz_deg = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
[d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                  = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_deg.Attributes.unit = "deg";

% LIMIT HORIZONTAL TAIL LOAD 
DeltaLimitLTail_pitch_up = zeros(length(time_vector), n_Mass);
for i = 1:n_Mass
    for j = 1:length(time_vector)
        DeltaLimitLTail_pitch_up(j,i) = alpha_new_horiz_deg(j,i) * CLalfa_ht_deg * S_ht * qA(i,1) *(1e-1);
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.value           = DeltaLimitLTail_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.Attributes.unit = "daN";

% TOTAL LOAD APPLIED - PITCH UP CASE
TotalLoad = zeros(n_Mass, 1);
for i = 1:n_Mass
    TotalLoad(i,1) = LhtA(i) + DeltaLimitLTail_pitch_up(end,i);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.TotalLoad.value           = TotalLoad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.TotalLoad.Attributes.unit = "daN";

%% PLOT RESULTS - METHOD A - PITCH UP CASE
% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    plot(time_vector, DeltaLimitLTail_pitch_up(:,i), '-r', 'LineWidth', 0.8)
    ylim padded 
    xlim padded 
    
    xlabel("Time - $t$ ($s$)"                                               , "Interpreter", "latex")
    ylabel("Horiz. tail manoeuvring loads increment - $\Delta L_{ht}$ (daN)", "Interpreter", "latex")
    title("Method A - Pitch up"                                             , "Interpreter", "latex")
    
    n_figure = n_figure + 1;
    
end

%% PLOT OVERALL RESULTS - METHOD A 
PlotMethodAHorizontalTailLoads

%% METHOD B - PITCH UP CASE 
% ANGULAR ACCELERATION CALCULATIONS 
angular_acceleration_pitch_up = zeros(length(V_fromAtoD(:,1)), n_Mass);
for j = 1:n_Mass
    for i = 1:length(V_fromAtoD(:,1))
        lm                                 = (- 20.1 / V_fromAtoD(i,j) ) * n_fromAtoD(i,j) * ( n_fromAtoD(i,j) - 1.5 );
        angular_acceleration_pitch_up(i,j) = lm;
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.ang_acc.value           = angular_acceleration_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.ang_acc.Attributes.unit = "rad/s^2";

% MOMENT MY
MY_pitch_up = zeros(length(V_fromAtoD(:,1)), n_Mass);

for j = 1:n_Mass
    for i = 1:length(V_fromAtoD(:,1))
        MY_pitch_up(i,j) = ( IY ) * ( angular_acceleration_pitch_up(i,j) );
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.MY.value           = MY_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.MY.Attributes.unit = "N*m";

% DELTA TAIL AIRLOADS
delta_tail_airloads_pitch_up = zeros(length(V_fromAtoD(:,1)), n_Mass);

for j = 1:n_Mass
    for i = 1:length(V_fromAtoD(:,1))
        delta_tail_airloads_pitch_up(i,j) = (1e-1)*( MY_pitch_up(i,j) ) / ( l_ht_envelope(j));
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.delta_tail_airloads.value           = delta_tail_airloads_pitch_up; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.delta_tail_airloads.Attributes.unit = "daN";

% UNIT LOAD FACTOR CALCULATION   
for i = 1:n_Mass
    V_unit_load_factor(1,i) = VS(i); 
                for k = 2:length(V_fromAtoD(:,1))
                    V_unit_load_factor(k,i) = V_unit_load_factor(k-1,i) + (VD(i) - VS(i))*(1/length(V_fromAtoD(:,1)));
                end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.V_unit_load_factor.value           = V_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.V_unit_load_factor.Attributes.unit = "m/s";
         
CL_unit_load_factor     = zeros(length(V_fromAtoD(:,1)), n_Mass); 
alfa_unit_load_factor   = zeros(length(V_fromAtoD(:,1)), n_Mass); 
CD_unit_load_factor     = zeros(length(V_fromAtoD(:,1)), n_Mass);
q_unit_load_factor      = zeros(length(V_fromAtoD(:,1)), n_Mass);
CM_CL_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass);
CM_CD_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass);
CM_CT_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass);
CM_CG_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass); 
CL_ht_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass);
CL_new_unit_load_factor = zeros(length(V_fromAtoD(:,1)), n_Mass);
L_wb_unit_load_factor   = zeros(length(V_fromAtoD(:,1)), n_Mass);
L_new_unit_load_factor  = zeros(length(V_fromAtoD(:,1)), n_Mass);
L_ht_unit_load_factor   = zeros(length(V_fromAtoD(:,1)), n_Mass);

% BALANCING TAIL AIRLOADS
for i = 1:n_Mass
    for j = 1:length(V_fromAtoD(:,1))
        [CL_unit_load_factor(j,i), alfa_unit_load_factor(j,i), CD_unit_load_factor(j,i), q_unit_load_factor(j,i), ...
         CM_CL_unit_load_factor(j,i), CM_CD_unit_load_factor(j,i), CM_CT_unit_load_factor(j,i), ...
         CM_CG_unit_load_factor(j,i), CL_ht_unit_load_factor(j,i), CL_new_unit_load_factor(j,i), ...
         L_wb_unit_load_factor(j,i), L_new_unit_load_factor(j,i), L_ht_unit_load_factor(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                   rho0, V_unit_load_factor(j,i) , WS(i), 1, ...
                                                                                   CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                   CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                   MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
    end
end

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.n_unit_load_factor.value                  = ones(length(V_unit_load_factor), n_Mass);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.n_unit_load_factor.Attributes.unit        = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_unit_load_factor.value                 = CL_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_unit_load_factor.Attributes.unit       = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.alfa_unit_load_factor_deg.value           = alfa_unit_load_factor; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.alfa_unit_load_factor_deg.Attributes.unit = "deg";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.alfa_unit_load_factor_rad.value           = deg2rad(alfa_unit_load_factor); 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.alfa_unit_load_factor_rad.Attributes.unit = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CD_unit_load_factor.value                 = CD_unit_load_factor; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CD_unit_load_factor.Attributes.unit       = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.q_unit_load_factor.value                  = q_unit_load_factor; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.q_unit_load_factor.Attributes.unit        = "Pa";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CL_unit_load_factor.value              = CM_CL_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CL_unit_load_factor.Attributes.unit    = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CD_unit_load_factor.value              = CM_CD_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CD_unit_load_factor.Attributes.unit    = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CT_unit_load_factor.value              = CM_CT_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CT_unit_load_factor.Attributes.unit    = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CG_unit_load_factor.value              = CM_CG_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CM_CG_unit_load_factor.Attributes.unit    = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_ht_unit_load_factor.value              = CL_ht_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_ht_unit_load_factor.Attributes.unit    = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_new_unit_load_factor.value             = CL_new_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.CL_new_unit_load_factor.Attributes.unit   = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_wb_unit_load_factor.value               = L_wb_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_wb_unit_load_factor.Attributes.unit     = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_new_unit_load_factor.value              = L_new_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_new_funit_load_factor.Attributes.unit   = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_ht_unit_load_factor.value               = L_ht_unit_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Balancingloads.L_ht_unit_load_factor.Attributes.unit     = "daN";

% BALANCING TAIL AIRLOADS AT VA
balancing_tail_airloads_pitch_up = zeros(length(L_ht_unit_load_factor(:,1)), n_Mass);
index_va                         = zeros(n_Mass,1);
for j = 1:n_Mass
    index_va(j)                           = dsearchn(V_unit_load_factor(:,j), VA(j));
    balancing_tail_airloads_pitch_up(:,j) = linspace(L_ht_unit_load_factor(index_va(j),j), L_ht_unit_load_factor(end,j), length(V_fromAtoD(:,j)))';
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.balancing_tail_airloads.value           = balancing_tail_airloads_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.balancing_tail_airloads.Attributes.unit = "daN";

% TOTAL AIRLOADS ASSOCIATED WITH THE PITCH UP MANOEUVRE
total_tail_airloads_pitch_up                                                                                         = delta_tail_airloads_pitch_up + ...
                                                                                                                       balancing_tail_airloads_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.total_tail_airloads.value           = total_tail_airloads_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.total_tail_airloads.Attributes.unit = "daN";

% CRITICAL TAIL AIRLOADS VALUE 
critical_tail_airloads_pitch_up                                                                                         = -max(abs(total_tail_airloads_pitch_up))'; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.critical_tail_airloads.value           = critical_tail_airloads_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_up.critical_tail_airloads.Attributes.unit = "daN";

%% METHOD B - PITCH DOWN CASE 
% ANGULAR ACCELERATION PITCH DOWN 
angular_acceleration_pitch_down                                                                            = -angular_acceleration_pitch_up; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.ang_acc.value           = angular_acceleration_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.ang_acc.Attributes.unit = "rad/s^2";

% MOMENT MY
MY_pitch_down = zeros(length(V_fromAtoD(:,1)), n_Mass);

for j = 1:n_Mass
    for i = 1:length(V_fromAtoD(:,1))
        MY_pitch_down(i,j) = ( IY ) * ( angular_acceleration_pitch_down(i,j) );
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.MY.value           = MY_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.MY.Attributes.unit = "N*m";

% DELTA TAIL AIRLOADS
delta_tail_airloads_pitch_down = zeros(length(V_fromAtoD(:,1)), n_Mass);
for j = 1:n_Mass
    for i = 1:length(V_fromAtoD(:,1))
        delta_tail_airloads_pitch_down(i,j) = ( 1e-1 )*( MY_pitch_down(i,j) )/( l_ht_envelope(j) );
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.delta_tail_airloads.value           = delta_tail_airloads_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.delta_tail_airloads.Attributes.unit = "daN";

% TOTAL AIRLOADS ASSOCIATED WITH THE PITCH UP MANOEUVRE
balancing_tail_airloads_pitch_down = balancing_tail_airloads_pitch_up;
total_tail_airloads_pitch_down     = delta_tail_airloads_pitch_down + balancing_tail_airloads_pitch_down;

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.total_tail_airloads.value           = total_tail_airloads_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.total_tail_airloads.Attributes.unit = "daN";

% CRITICAL TAIL AIRLOADS VALUE 
critical_tail_airloads_pitch_down = max(abs(total_tail_airloads_pitch_down))'; 

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.critical_tail_airloads.value           = critical_tail_airloads_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.critical_tail_airloads.Attributes.unit = "daN";

%% PLOT RESULTS - METHOD B 
PlotMethodBHorizontalTailLoads

%% CS - VLA 423 METHOD A + B 
% PITCH DOWN CASE 
max_delta_method_b_pitch_down   = max(abs(delta_tail_airloads_pitch_down))';
DeltaLimMethodAplusB_pitch_down = ( max(DeltaLimitLTail_pitch_down)' ) + max_delta_method_b_pitch_down;

% PITCH DOWN CASE - TOTAL DELTA AIRLOADS 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_down.delta_tail_airloads.value           = DeltaLimMethodAplusB_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_down.delta_tail_airloads.Attributes.unit = "daN";

% PITCH DOWN CASE - TOTAL AIRLOADS
MethodAplusBtotal_tail_airloads_pitch_down  = ( -max(abs(balancing_tail_airloads_pitch_down))' ) + DeltaLimMethodAplusB_pitch_down;

% PITCH DOWN CASE - TOTAL AIRLOADS 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_down.total_tail_airloads.value           = MethodAplusBtotal_tail_airloads_pitch_down;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_down.total_tail_airloads.Attributes.unit = "daN";

% -------------------------------------------------------------------------------------------------------------------------------------------------------------

% PITCH UP CASE
max_delta_method_b_pitch_up     = -max(abs(delta_tail_airloads_pitch_up))';
DeltaLimMethodAplusB_pitch_up   = ( -max(abs(DeltaLimitLTail_pitch_up))' ) + max_delta_method_b_pitch_up;

% PITCH UP CASE - TOTAL DELTA AIRLOADS 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_up.delta_tail_airloads.value           = DeltaLimMethodAplusB_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_up.delta_tail_airloads.Attributes.unit = "daN";

% PITCH UP CASE - TOTAL AIRLOADS
MethodAplusBtotal_tail_airloads_pitch_up    = ( -max(abs(balancing_tail_airloads_pitch_down))' ) + DeltaLimMethodAplusB_pitch_up;

% PITCH UP CASE - TOTAL AIRLOADS 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_up.total_tail_airloads.value           = MethodAplusBtotal_tail_airloads_pitch_up;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a_plus_b.pitch_up.total_tail_airloads.Attributes.unit = "daN";

%% PLOT RESULTS - METHOD A + B 
PlotMethodAplusBHorizontalTailLoads

%% CS - VLA 423 - METHOD C - UPWARD DEFLECTION - VA 
% Initialization
LHT_at_VA_unit_load = zeros(n_Mass, 1);
tol                 = 1e-2;

for j = 1:n_Mass
    for i = 1:length(CL_ht_unit_load_factor(:,1))   
        V = V_unit_load_factor(i,j);
        if abs(VA(j) - V) < tol
             LHT_at_VA_unit_load(j) = (0.5) * (V^2) * ( S ) * ( rho0 ) * (CL_ht_unit_load_factor(i,j))*(1e-1);   
        end
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.LHT_at_VA_unit_load.value           = LHT_at_VA_unit_load;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.LHT_at_VA_unit_load.Attributes.unit = "daN";

% SOLUTION SCHEME - UPWARD DEFLECTION
omega_deg             = (-0.8 * delta_elevator_max * tau_ht )*(1/ total_deflection_time );
omega_rad             = deg2rad(omega_deg);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qA(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad = omega_rad * time_vector;
alpha_prime_horiz_deg = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
[d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                        = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.alpha_new_horiz_deg.Attributes.unit = "deg";

% CALCULATION OF THE CRITICAL HORIZONTAL TAIL AIRLOADS AS 
% L_BALANC AT VA + CRITICAL TAIL AIRLOADS DUE TO MANOEUVRE AT VA 
% FIRSE WE NEED THE CRITICAL TAIL AIRLOADS 
% LIMIT HORIZONTAL TAIL LOAD 
DeltaLHorizoTail_at_VA_upward = zeros(n_Mass, 1);
for j = 1:n_Mass
    DeltaLHorizoTail_at_VA_upward(j) = alpha_new_horiz_deg(end, j)* CLalfa_ht_deg * S_ht * qA(j) * (1e-1);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.DeltaLHorizoTail.value           = DeltaLHorizoTail_at_VA_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.DeltaLHorizoTail.Attributes.unit = "daN";

% TOTAL AIRLOADS ACTING ON THE HORIZONTAL 
Total_loads_at_VA_upward = LHT_at_VA_unit_load + DeltaLHorizoTail_at_VA_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.TotalLoads.value           = Total_loads_at_VA_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.TotalLoads.Attributes.unit = "daN";

%% CS - VLA 423 - METHOD C - DOWNWARD DEFLECTION - VA 
% SOLUTION SCHEME - UPWARD DEFLECTION
omega_deg             = ( delta_elevator_max * tau_ht )*(1/ total_deflection_time );
omega_rad             = deg2rad(omega_deg);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qA(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad = omega_rad * time_vector;
alpha_prime_horiz_deg = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
[d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                          = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.alpha_new_horiz_deg.Attributes.unit = "deg";

% CALCULATION OF THE CRITICAL HORIZONTAL TAIL AIRLOADS AS 
% L_BALANC AT VA + CRITICAL TAIL AIRLOADS DUE TO MANOEUVRE AT VA 
% FIRSE WE NEED THE CRITICAL TAIL AIRLOADS 
% LIMIT HORIZONTAL TAIL LOAD 
DeltaLHorizoTail_at_VA_downward = zeros(n_Mass, 1);
for j = 1:n_Mass
    DeltaLHorizoTail_at_VA_downward(j) = alpha_new_horiz_deg(end, j)* CLalfa_ht_deg * S_ht * qA(j) * (1e-1);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.DeltaLHorizoTail.value           = DeltaLHorizoTail_at_VA_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.DeltaLHorizoTail.Attributes.unit = "daN";

% TOTAL AIRLOADS ACTING ON THE HORIZONTAL 
Total_loads_at_VA_downward = LHT_at_VA_unit_load + DeltaLHorizoTail_at_VA_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.TotalLoads.value           = Total_loads_at_VA_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.TotalLoads.Attributes.unit = "daN";

%% CS - VLA 423 - METHOD C - UPWARD DEFLECTION - VD 
% Initialization
LHT_at_VD_unit_load = zeros(n_Mass, 1);
tol                 = 1e-2;

for j = 1:n_Mass
    for i = 1:length(CL_ht_unit_load_factor(:,1))   
        V = V_unit_load_factor(i,j);
        if abs(VD(j) - V) < tol
             LHT_at_VD_unit_load(j) = (0.5) * (V^2) * ( S ) * ( rho0 ) * (CL_ht_unit_load_factor(i,j))*(1e-1);   
        end
    end
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.LHT_at_VD_unit_load.value           = LHT_at_VD_unit_load;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.LHT_at_VD_unit_load.Attributes.unit = "daN";

% SOLUTION SCHEME - UPWARD DEFLECTION
omega_deg             = ( ( - ( 1/3 ) * delta_elevator_max ) ) * (1 / total_deflection_time );
omega_rad             = deg2rad(omega_deg);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qD(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad = omega_rad * time_vector;
alpha_prime_horiz_deg = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.upward_defl.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
[d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                        = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.alpha_new_horiz_deg.Attributes.unit = "deg";

% CALCULATION OF THE CRITICAL HORIZONTAL TAIL AIRLOADS AS 
% L_BALANC AT VA + CRITICAL TAIL AIRLOADS DUE TO MANOEUVRE AT VA 
% FIRSE WE NEED THE CRITICAL TAIL AIRLOADS 
% LIMIT HORIZONTAL TAIL LOAD 
DeltaLHorizoTail_at_VD_upward = zeros(n_Mass, 1);
for j = 1:n_Mass
    DeltaLHorizoTail_at_VD_upward(j) = alpha_new_horiz_deg(end, j)* CLalfa_ht_deg * S_ht * qD(j) * (1e-1);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.DeltaLHorizoTail.value           = DeltaLHorizoTail_at_VD_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.DeltaLHorizoTail.Attributes.unit = "daN";

% TOTAL AIRLOADS ACTING ON THE HORIZONTAL 
Total_loads_at_VD_upward = LHT_at_VD_unit_load + DeltaLHorizoTail_at_VD_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.TotalLoads.value           = Total_loads_at_VD_upward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.upward_defl.TotalLoads.Attributes.unit = "daN";

%% CS - VLA 423 - METHOD C - UPWARD DEFLECTION - VD

% SOLUTION SCHEME - UPWARD DEFLECTION
omega_deg             = ( ( ( 1/3 ) * delta_elevator_max ) ) * (1 / total_deflection_time );
omega_rad             = deg2rad(omega_deg);
for i = 1:n_Mass
    A0(i) = (1/IY) * CLalfa_ht_rad * qD(i) * l_ht_envelope(i) * S_ht;
end
alpha_prime_horiz_rad = omega_rad * time_vector;
alpha_prime_horiz_deg = rad2deg(alpha_prime_horiz_rad);

Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.omega.value                           = omega_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.omega.Attributes.unit                 = "deg/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.omega_rad.value                       = omega_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.omega_rad.Attributes.unit             = "rad/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.A0.value                              = A0;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.va.downward_defl.A0.Attributes.unit                    = "1/(rad * m * s^2)";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_prime_horiz.value               = alpha_prime_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_prime_horiz.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_prime_horiz_deg.value           = alpha_prime_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_prime_horiz_deg.Attributes.unit = "deg";

% Applying the solution scheme
[d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht_envelope, damping_factor, VA);
% Store inside the Aircraft struct variable
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.d2thetadt2.value                    = d2thetadt2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.d2thetadt2.Attributes.unit          = "rad/s^2";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.dthetadt.value                      = dthetadt;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.dthetadt.Attributes.unit            = "rad/s"; 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.delta_v.value                       = delta_v;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.delta_v.Attributes.unit             = "m/s";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.delta_theta_rad.value               = delta_theta_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.delta_theta_rad.Attributes.unit     = "rad";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_new_horiz_rad.value           = alpha_new_horiz_rad;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_new_horiz_rad.Attributes.unit = "rad";
alpha_new_horiz_deg                                                                                                          = rad2deg(alpha_new_horiz_rad);
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_new_horiz_deg.value           = alpha_new_horiz_deg;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.alpha_new_horiz_deg.Attributes.unit = "deg";

% CALCULATION OF THE CRITICAL HORIZONTAL TAIL AIRLOADS AS 
% L_BALANC AT VA + CRITICAL TAIL AIRLOADS DUE TO MANOEUVRE AT VA 
% FIRSE WE NEED THE CRITICAL TAIL AIRLOADS 
% LIMIT HORIZONTAL TAIL LOAD 
DeltaLHorizoTail_at_VD_downward = zeros(n_Mass, 1);
for j = 1:n_Mass
    DeltaLHorizoTail_at_VD_downward(j) = alpha_new_horiz_deg(end, j)* CLalfa_ht_deg * S_ht * qD(j) * (1e-1);
end
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.DeltaLHorizoTail.value           = DeltaLHorizoTail_at_VD_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.DeltaLHorizoTail.Attributes.unit = "daN";

% TOTAL AIRLOADS ACTING ON THE HORIZONTAL 
Total_loads_at_VD_downward = LHT_at_VD_unit_load + DeltaLHorizoTail_at_VD_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.TotalLoads.value           = Total_loads_at_VD_downward;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_c.vd.downward_defl.TotalLoads.Attributes.unit = "daN";

%% PLOT RESULTS - METHOD C
PlotMethodCHorizontalTailLoads

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VA - POINT A OF FLIGHT ENVELOPE - CASE 1 

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
Mass_Envelope    = Aircraft.Mass.Mass_Envelope.value;
g                = Aircraft.Constant_values.g.value;
xcg_bar_envelope = Aircraft.Geometry.General.xcg_bar_envelope.value;
DepsilonDalfa    = Aircraft.Certification.Aerodynamic_data.Horizontal.ht_depsilondalfa.value;
Downwash_factor  = 1.0 - DepsilonDalfa;
S_ratio          = S_ht / S_wing;
CLalfa_rad       = Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value;
a_ratio          = CLalfa_ht_rad / CLalfa_rad;
% -------------------------------------------------------------------------
Delta_load_factor   = nA - 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor(i);
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);

end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VA_case1 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VA_case1(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VA_case1               = LHT_at_VA_unit_load + Method_d_Load_Increment_at_VA_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VA_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_Total_Load.value                        = Crit_Load_at_VA_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_one.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VA - POINT A OF FLIGHT ENVELOPE - CASE 2 

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = -nA + 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor(i);
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VA_case2 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VA_case2(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VA_case2               = LHT_at_VA_unit_load + Method_d_Load_Increment_at_VA_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VA_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_Total_Load.value                        = Crit_Load_at_VA_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_two.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VA - POINT G OF THE FLIGHT ENVELOPE - CASE 3

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = nmin - 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% Evaluation of Delta N applied
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VA_case3 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VA_case3(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VA_case3               = LHT_at_VA_unit_load + Method_d_Load_Increment_at_VA_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VA_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_Total_Load.value                        = Crit_Load_at_VA_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_three.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VA - POINT G OF THE FLIGHT ENVELOPE - CASE 4

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = -nmin + 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% Evaluation of Delta N applied
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VA_case4 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VA_case4(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VA_case4               = LHT_at_VA_unit_load + Method_d_Load_Increment_at_VA_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VA_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_Total_Load.value                        = Crit_Load_at_VA_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.va.case_four.Manoeuvring_Total_Load.Attributes.unit              = "daN";

% -------------------------------------------------------------------------------------------------------------------------------------------------------------------
% VD - CASO DIVING 
% -------------------------------------------------------------------------------------------------------------------------------------------------------------------

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VD - POINT A OF FLIGHT ENVELOPE - CASE 1 

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = nmax - 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);

end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VD_case1 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VD_case1(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VD_case1               = LHT_at_VD_unit_load + Method_d_Load_Increment_at_VD_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VD_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_Total_Load.value                        = Crit_Load_at_VD_case1;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_one.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VD - POINT A OF FLIGHT ENVELOPE - CASE 2 

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = -nmax + 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VD_case2 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VD_case2(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VD_case2               = LHT_at_VD_unit_load + Method_d_Load_Increment_at_VD_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VD_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_Total_Load.value                        = Crit_Load_at_VD_case2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_two.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VD - POINT G OF THE FLIGHT ENVELOPE - CASE 3

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = nmin - 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% Evaluation of Delta N applied
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VD_case3 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VD_case3(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VD_case3               = LHT_at_VD_unit_load + Method_d_Load_Increment_at_VD_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VD_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_Total_Load.value                        = Crit_Load_at_VD_case3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_three.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% CS - VLA 423 - METHOD D - MANOEUVRING AIRSPEED VD - POINT G OF THE FLIGHT ENVELOPE - CASE 4

% SOME CONSTANTS INVOLVED IN THE FOLLOWING CALCULATIONS
% -------------------------------------------------------------------------
Delta_load_factor   = -nmin + 1.0;
DeltaN_times_Weight = zeros(n_Mass, 1);
Xcg_l_ht_ratio      = zeros(n_Mass, 1);
for i = 1:n_Mass
    DeltaN_times_Weight(i) = Mass_Envelope(i) * g * Delta_load_factor;
    Xcg_l_ht_ratio(i)      = xcg_bar_envelope(i) / l_ht_envelope(i);
end

% PRODUCT 2: (surface ratio) x (lift curve slope ratio) x (downwash factor)
product2    = S_ratio * a_ratio * Downwash_factor;
product3    = zeros(n_Mass, 1);
parenthesis = zeros(n_Mass, 1);
for i = 1:n_Mass
    % Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
    product3(i)    = ( 1 / Mass_Envelope(i) ) * 0.5 * rho0 * l_ht_envelope(i) * S_ht * CLalfa_ht_rad;
    
    % Evaluating the parenthesis 
    parenthesis(i) = Xcg_l_ht_ratio(i) - product2 - product3(i);
end

% Evaluation of Delta N applied
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.DeltaN.value                           = Delta_load_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.DeltaN.Attributes.unit                 = "g";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_weight.value               = DeltaN_times_Weight;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_weight.Attributes.unit     = "N";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.X_cg_lt_ratio.value                    = Xcg_l_ht_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.X_cg_lt_ratio.Attributes.unit          = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Downwash_factor.value                  = Downwash_factor;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Downwash_factor.Attributes.unit        = "Non dimensional";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Lift_curve_slope_ratio.value           = a_ratio;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Lift_curve_slope_ratio.Attributes.unit = "Non dimensional";

% Defining the product (surface ratio) x (lift curve slope ratio) x (downwash factor) - Second term
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Second_term.value           = product2;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Second_term.Attributes.unit = "Non dimensional";

% Defining the product 0.5 * (1/M) * rho0 * lt * S_ht * a_ht
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Third_term.value           = product3;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Third_term.Attributes.unit = "Non dimensional";

% Evaluating the parenthesis 
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.parenthesis.value           = parenthesis;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.parenthesis.Attributes.unit = "Non dimensional";

% +++ CRITICAL LOAD - CASE ONE +++ 
Method_d_Load_Increment_at_VD_case4 = zeros(n_Mass, 1);
for i = 1:n_Mass
    Method_d_Load_Increment_at_VD_case4(i) = DeltaN_times_Weight(i) * parenthesis(i) * (1e-1);
end 
Crit_Load_at_VD_case4               = LHT_at_VD_unit_load + Method_d_Load_Increment_at_VD_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_Critical_Load_Increment.value           = Method_d_Load_Increment_at_VD_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_Critical_Load_Increment.Attributes.unit = "daN";
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_Total_Load.value                        = Crit_Load_at_VD_case4;
Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_d.vd.case_four.Manoeuvring_Total_Load.Attributes.unit              = "daN";

%% PLOT RESULTS - METHOD D
PlotMethodDHorizontalTailLoads
