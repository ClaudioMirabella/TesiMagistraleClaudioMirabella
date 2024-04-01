% -------------------------------------------------------------------------
%% CS-VLA 333 Flight envelope
%  (a) GENERAL. Compliance with the strength requirements of this subpart
%      must be shown at any combination of airspeed and load factor on and
%      within the boundaries of a flight envelope (similar to the one in
%      sub-paragraph(d) of this paragraph) that represents the envelope of
%      the flight loading conditions specified by the manoeuvring and gust
%      criteria of sub-paragraphs(b) and (c) of this paragraph
%      respectively.
%
%  (b) MANOEUVRING ENVELOPE. Except where limited by maximum static lift
%      coefficients, the aeroplane is assumed to be subjected to
%      symmetrical manoeuvres resulting in the following limit load
%      factors: 
%      (1) the positive manoeuvring load factor specified in CS-VLA 337 at
%          speeds up to VD; 
%      (2) the negative manoeuvring load factor specified in CS-VLA 337 at
%          VC; 
%      (3) factors varying linearly with speed from the specified value at
%          VC to 0.0 at VD.
%
%  (c) GUST ENVELOPE.
%      (1) The aeroplane is assumed to be subjected to symmetrical vertical
%          gusts in level flight. The resulting limit load factors must
%          correspond to the conditions determined as follows: 
%          (i) positive (up) and negative (down) gusts of 15.24 m/s at VC
%              must be considered;
%         (ii) positive and negative gusts of 7.62 m/s at VD must be
%              considered.
%      (2) The following assumptions must be made: 
%          (i) the shape of the gust is 
%                  Ude   /          2*pi*S   \
%              U = --- * | 1 - cos( ------ ) |
%                   2    \          25*MGC   /
%              where 
%              S   = distance penetrated into gust (m);
%              MGC = mean geometric chord of wing (m);
%              Ude = derived gust velocity referred to in
%                    sub-paragraph(c)(1) (m/s)
%         (ii) gust load factors vary linearly with speed between VC and
%              VD.
%
%  (d) FLIGHT ENVELOPE. Figure inside the CS-VLA airworthiness
%      requirements. NOTE: point G need not be investigated when the
%      supplementary condition specified in CS-VLA 369 is investigated.

% Class csvla.m 
obj = csvla;

% Number of elements
numb = 1e3;

% Air density
rho0   = Aircraft.Standard_atmosphere.Sea_level.rho.value;
rho_op = Aircraft.Standard_atmosphere.Operative_ceiling.rho.value;
rho_th = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;

% Lift coefficients
CLmax_clean    = Aircraft.Certification.Aerodynamic_data.CL_max_clean.value;
CLmax_inverted = Aircraft.Certification.Aerodynamic_data.CL_max_inverted.value;

% Gravity acceleration
g = Aircraft.Constant_values.g.value;

% Wing surface
S_wing = Aircraft.Geometry.Wing.S.value;

% Mass of the aircraft
Max_Takeoff_Mass = Aircraft.Mass.Max_Takeoff_Mass.value;
Empty_Mass       = Aircraft.Mass.Empty_Mass.value;
Useful_Mass      = Aircraft.Mass.Useful_Mass.value;
Fuel_Mass        = Aircraft.Mass.Fuel_Mass.value;
Crew_Mass        = Aircraft.Mass.Crew_Mass.value;
Oil_mass         = Aircraft.Mass.Oil_mass.value;

% Mass envelope
Min_Takeoff_Mass                               = Empty_Mass + Useful_Mass - ( Oil_mass + 0.8*Fuel_Mass );
Aircraft.Mass.Min_Takeoff_Mass.value           = Min_Takeoff_Mass;
Aircraft.Mass.Min_Takeoff_Mass.Attributes.unit = "kg";
% -------------------------------------------------------------------------
% n_Mass = Number of aircraft mass evaluated; user can change this number to
% --> 2 
% --> 4
% --> 6
% --> 8
% --> 10
% Subplot subroutine accepts only these values.
n_Mass                                      = Aircraft.Mass.Vector_length.value;

% Aircraft mass envelope
Aircraft.Mass.Mass_Envelope.value           = linspace(Min_Takeoff_Mass, Max_Takeoff_Mass, n_Mass)';
Aircraft.Mass.Mass_Envelope.Attributes.unit = "kg";

% Aircraft centre of gravity envelope 
Max_fwd_cg                                                 = Aircraft.Geometry.General.Max_forward_cg.value; 
Max_aft_cg                                                 = Aircraft.Geometry.General.Max_aft_cg.value; 
cg_envelope                                                = linspace(Max_fwd_cg, Max_aft_cg, n_Mass)';
Aircraft.Geometry.General.xcg_bar_envelope.value           = cg_envelope;
Aircraft.Geometry.General.xcg_bar_envelope.Attributes.unit = "MAC percentage";

% Distance between wing and horizontal tail aerodynamic centres 
l_ht          = Aircraft.Geometry.Horizontal.l_ht.value;  
MAC           = Aircraft.Geometry.Wing.MAC.value;
l_ht_envelope = zeros(n_Mass, 1);

% Correct distance between aircraft c.g. and horizontal tail a.c. 
% x_ac is located at 0.25 % MAC
for i = 1:n_Mass
    if cg_envelope(i) < 0.25
        l_ht_envelope(i) = l_ht + cg_envelope(i) * MAC;
    elseif cg_envelope(i) > 0.25 
        l_ht_envelope(i) = l_ht - cg_envelope(i) * MAC;
    end
end
Aircraft.Geometry.Horizontal.l_ht_envelope.value           = l_ht_envelope;
Aircraft.Geometry.Horizontal.l_ht_envelope.Attributes.unit = "m";

% Distance between aircraft c.g. and vertical tail a.c.
% x_ac is located at 0.25 % MAC
l_vt_envelope = zeros(n_Mass, 1);
x_vt          = Aircraft.Geometry.Vertical.xloc.value;
x_wing        = Aircraft.Geometry.Wing.xle.value;
l_vt          = x_vt - x_wing - 0.25 * MAC;

% Correct distance between aircraft c.g. and horizontal tail a.c. 
% x_cg is located ate 0.25 % MAC
for i = 1:n_Mass
    if cg_envelope(i) < 0.25
        l_vt_envelope(i) = l_vt + cg_envelope(i) * MAC;
    elseif cg_envelope(i) > 0.25 
        l_vt_envelope(i) = l_vt - cg_envelope(i) * MAC;
    end
end
Aircraft.Geometry.Vertical.l_vt_envelope.value           = l_vt_envelope;
Aircraft.Geometry.Vertical.l_vt_envelope.Attributes.unit = "m";

% Aircraft aerodynamic centre envelope
Max_fwd_xac                                            = Aircraft.Geometry.General.max_forward_xac.value; 
Max_aft_xac                                            = Aircraft.Geometry.General.max_aft_xac.value; 
ac_envelope                                            = linspace(Max_fwd_xac, Max_aft_xac, n_Mass)';
Aircraft.Geometry.General.xac_envelope.value           = ac_envelope;
Aircraft.Geometry.General.xac_envelope.Attributes.unit = "MAC percentage";

% Thrust line envelope
h_upper_lim                                                 = Aircraft.Geometry.General.max_up_h_thrust.value;
h_bottom_lim                                                = Aircraft.Geometry.General.max_down_h_thrust.value;
h_thrust_envelope                                           = linspace(h_upper_lim, h_bottom_lim, n_Mass)';
Aircraft.Geometry.General.h_thrust_envelope.value           = h_thrust_envelope;
Aircraft.Geometry.General.h_thrust_envelope.Attributes.unit = "m";

% Lift axial component moment arm - bCG envelope
bCG_upper_lim                                          = Aircraft.Geometry.General.max_up_bCG.value; 
bCG_bottom_lim                                         = Aircraft.Geometry.General.max_down_bCG.value; 
bCG_envelope                                           = linspace(bCG_upper_lim, bCG_bottom_lim, n_Mass)';
Aircraft.Geometry.General.bCG_envelope.value           = bCG_envelope;
Aircraft.Geometry.General.bCG_envelope.Attributes.unit = "m";

% Aircraft wing loading range
WS = zeros(n_Mass,1);
for i = 1:n_Mass
   WS(i) =  ( Aircraft.Mass.Mass_Envelope.value(i) * g ) / S_wing;
end
Aircraft.Performance.Wing_loading.value           = WS;
Aircraft.Performance.Wing_loading.Attributes.unit = "N/m^2";

% Aircraft load factors 
nmax = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
npos = calcn(obj, nmax);
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.npos_values.value           = npos;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.npos_values.Attributes.unit = "g";
nmin = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmin.value;
nneg = calcn(obj, nmin);
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.nneg_values.value           = npos;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.nneg_values.Attributes.unit = "g";

% Minimum design cruise airspeed
min_design_VC = Aircraft.Performance.Min_design_cruise_airspeed.value;

%% STALL SPEED CALCULATIONS 
% x = calcvs(obj, rho, WingLoading, MaxLiftCoeff, PositiveLoadFactors)
% This function defines a vector with stall airspeed for the chosen
% aircraft, within the precribed range of load factors. Check the
% class file csvla.m to have a complete documentation.
% Positive stall speed 
VSpos = zeros(length(npos), n_Mass);
for i = 1:n_Mass
    for j = 1:length(npos)
        VSpos(j,i) = calcvs(obj, rho0, WS(i), CLmax_clean, npos(j)); 
    end
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.VSpos.value           = VSpos;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.VSpos.Attributes.unit = "m/s";

VSneg = zeros(length(nneg), n_Mass);
for i = 1:n_Mass
    for j = 1:length(npos)
        VSneg(j,i) = calcvs(obj, rho0, WS(i), CLmax_inverted, nneg(j));
    end
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.VSneg.value           = VSneg;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.VSneg.Attributes.unit = "m/s";

%% CALCULATION OF THE CRUISE SPEED 
% x = calcvc(obj, WingLoading, MaxContinuousPowerSpeedVH)
% This function identifies (following CS-VLA airworthiness reg.)
% maximum cruise speed (Point C) for flight envelope calculations. 
% To have a complete documentation check the class file csvla.m
% VH design speed for max continous power: this airspeed is not available
% but must be known. From CS - VLA Airworthiness rules

cruise_speed = zeros(n_Mass, 1);
for i = 1:n_Mass
    cruise_speed(i) = calcvc(obj, WS(i)); 
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Cruise_Speed.value           = cruise_speed; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Cruise_Speed.Attributes.unit = "m/s";

%% CALCULATION OF THE DIVE SPEED 
% x = calcvd(obj, MinDesignCruiseSpeed, CruiseSpeedVC)
% This function identifies (following CS-VLA airworthiness reg.)
% the maximum dive speed (Point D) for flight envelope
% calculations. To have a complete documentation check the class
% file csvla.m

% Minimum design cruise airspeed
VC_min_design = Aircraft.Performance.Min_design_cruise_airspeed.value;

% Dive airspeed calculations
VD = zeros(n_Mass, 1);
VE = zeros(n_Mass, 1);
for i = 1:n_Mass
    VD(i) = calcvd(obj, VC_min_design, cruise_speed(i));  
    VE(i) = VD(i);
end
nD = nmax;
nE = nmin;

% Cruise speed from previous calculations
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Dive_Speed_VD.value           = VD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Dive_Speed_VD.Attributes.unit = "m/s";

% INVERTED FLIGHT DIVE SPEED 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Dive_Speed_VE.value           = VE; % Speed at points E and D are equal 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Dive_Speed_VE.Attributes.unit = "m/s";

%% POINT 0 and POINT S - STRAIGHT STALL 
% Point 0 - Load factor
n0 = 0.0;

% Point S
nS = 1.0; 
VS = zeros(n_Mass, 1);
for i = 1:n_Mass
    VS(i) = Vstall(WS(i), rho0, CLmax_clean, nS);
end

% Point 0 - Speed
V0 = VS; 

% Store inside the structured variable
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Positive_Stall_speed_VS.value           = VS;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Positive_Stall_speed_VS.Attributes.unit = "m/s";

% Flight envelope - From 0 to S
n_from0toS = zeros(numb, n_Mass);
V_from0toS = zeros(numb, n_Mass);
for i = 1:length(VS)
        n_from0toS(:, i) = linspace(0, nS, numb);
        V_from0toS(:, i) = ones(numb, 1) * VS(i);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS.value           = n_from0toS;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS.value           = V_from0toS;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS.Attributes.unit = "m/s";

%% POINT 0 and S INVERTED - INVERTED FLIGHT STALL 
% Point 0 inverted - Load factor
n0_inv = 0.0;

nS_inv = -1.0; 
VS_inv = zeros(n_Mass, 1);
for i = 1:n_Mass
    VS_inv(i) = Vstall(WS(i), rho0, CLmax_inverted, nS_inv);
end

% POINT 0 inverted - Speed
V0_inv = VS_inv;

% Store inside the structured variable
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Negative_Stall_speed_VS.value           = VS_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Negative_Stall_speed_VS.Attributes.unit = "m/s";

% Flight envelope - From 0_inv to S_inv
n_from0toS_inv = zeros(numb, n_Mass);
V_from0toS_inv = zeros(numb, n_Mass);
for i = 1:n_Mass
        n_from0toS_inv(:, i) = linspace(0, nS_inv, numb);
        V_from0toS_inv(:, i) = ones(numb, 1) * VS_inv(i);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS_inv.value           = n_from0toS_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS_inv.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS_inv.value           = V_from0toS_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS_inv.Attributes.unit = "m/s";

%% POINT A - MANOEUVRING POINT IN STRAIGHT FLIGHT
nA = nmax; 
VA = zeros(n_Mass, 1);
for i = 1:n_Mass
    VA(i) = Vstall(WS(i), rho0, CLmax_clean, nA);
end

% Store inside the structured variable
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Positive_man_speed_VA.value           = VA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Positive_man_speed_VA.Attributes.unit = "m/s";

% Flight envelope - From S to A
n_fromStoA = zeros(numb, n_Mass);
V_fromStoA = zeros(numb, n_Mass);
for i = 1:n_Mass
        n_fromStoA(:, i) = linspace(nS, nA, numb);
        V_fromStoA(:, i) = Vstall(WS(i), rho0, CLmax_clean, n_fromStoA(:,i));
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromStoA.value           = n_fromStoA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromStoA.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromStoA.value           = V_fromStoA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromStoA.Attributes.unit = "m/s";

%% POINT G - MANOEUVRING POINT IN INVERTED FLIGHT
nG = nmin; 
VG = zeros(n_Mass, 1);
for i = 1:n_Mass
    VG(i) = Vstall(WS(i), rho0, CLmax_inverted, nG);
end

% Store inside the structured variable
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Negative_man_speed_VG.value           = VG;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.Negative_man_speed_VG.Attributes.unit = "m/s";

% Flight envelope - From S inverted to G
n_fromS_invtoG = zeros(numb, n_Mass);
V_fromS_invtoG = zeros(numb, n_Mass);
for i = 1:n_Mass
        n_fromS_invtoG(:, i) = linspace(nS_inv, nG, numb);
        V_fromS_invtoG(:, i) = Vstall(WS(i), rho0, CLmax_inverted, n_fromS_invtoG(:,i));
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromS_invtoG.value           = n_fromS_invtoG;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromS_invtoG.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromS_invtoG.value           = V_fromS_invtoG;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromS_invtoG.Attributes.unit = "m/s";

%% FROM A TO C 
n_fromAtoC = zeros(numb, n_Mass);
V_fromAtoC = zeros(numb, n_Mass);
for i = 1:n_Mass
   n_fromAtoC(:, i) = ones(numb, 1) * nmax;
   V_fromAtoC(:, i) = linspace(VA(i), cruise_speed(i), numb);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromAtoC.value           = n_fromAtoC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromAtoC.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromAtoC.value           = V_fromAtoC;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromAtoC.Attributes.unit = "m/s";

%% FROM C TO D 
n_fromCtoD = zeros(numb, n_Mass);
V_fromCtoD = zeros(numb, n_Mass);
for i = 1:n_Mass
   n_fromCtoD(:, i) = ones(numb, 1) * nmax;
   V_fromCtoD(:, i) = linspace(cruise_speed(i), VD(i), numb);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromCtoD.value           = n_fromCtoD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromCtoD.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromCtoD.value           = V_fromCtoD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromCtoD.Attributes.unit = "m/s";

%% FROM D TO 0 
n_fromDto0 = zeros(numb, n_Mass);
V_fromDto0 = zeros(numb, n_Mass);
for i = 1:n_Mass
   n_fromDto0(:, i) = linspace(nmax, 0, numb);
   V_fromDto0(:, i) = ones(numb, 1) * VD(i);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromDto0.value           = n_fromDto0;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromDto0.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromDto0.value           = V_fromDto0;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromDto0.Attributes.unit = "m/s";

%% FROM G TO F 
n_fromGtoF = zeros(numb, n_Mass);
V_fromGtoF = zeros(numb, n_Mass);
for i = 1:n_Mass
   n_fromGtoF(:, i) = ones(numb, 1) * nmin;
   V_fromGtoF(:, i) = linspace(VG(i), cruise_speed(i), numb);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromGtoF.value           = n_fromGtoF;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromGtoF.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromGtoF.value           = V_fromGtoF;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromGtoF.Attributes.unit = "m/s";

%% FROM F TO 0 
n_fromFto0 = zeros(numb, n_Mass);
V_fromFto0 = zeros(numb, n_Mass);
nF         = nmin;
for i = 1:n_Mass
   V_fromFto0(:, i) = linspace(cruise_speed(i), VE(i), numb);
   p_fromFto0       = polyfit([cruise_speed(i) VE(i)], [nF 0.0], 1);
   n_fromFto0(:, i) = polyval(p_fromFto0, V_fromFto0(:,i));
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromFto0.value           = n_fromFto0;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromFto0.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromFto0.value           = V_fromFto0;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromFto0.Attributes.unit = "m/s";

%% STORE INSIDE THE STRUCTURED VARIABLE

% STRAIGHT FLIGHT
% Point S 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS.nS.value           = nS;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS.nS.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS.VS.value           = VS;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS.VS.Attributes.unit = "g";
% Point A 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.nA.value           = nA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.nA.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.VA.value           = VA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.VA.Attributes.unit = "g";
% Point C 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.nC.value           = nmax;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.nC.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.VC.value           = cruise_speed;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.VC.Attributes.unit = "g";
% Point D 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.nD.value           = nD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.nD.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.VD.value           = VD;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.VD.Attributes.unit = "g";

% INVERTED FLIGHT
% Point S inverted
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.nS_inv.value           = nS_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.nS_inv.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.VS_inv.value           = VS_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.VS_inv.Attributes.unit = "g";
% Point G 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.nG.value           = nG;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.nG.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.VG.value           = VG;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.VG.Attributes.unit = "g";
% Point F 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.nF.value           = nmin;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.nF.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.VF.value           = cruise_speed;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.VF.Attributes.unit = "g";
% Point E 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.nE.value           = nE;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.nE.Attributes.unit = "g";
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.VE.value           = VE;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.VE.Attributes.unit = "g";

%% PLOT RESULTS 
Reg                     = Aircraft.Certification.Regulation.value;

for i = 1:n_Mass
    flight_envelope_diagram = FlightEnvelope(n_from0toS(:,i), n_fromStoA(:,i), n_fromAtoC(:,i), n_fromCtoD(:,i), n_fromDto0(:,i), ...
                                         n_from0toS_inv(:,i), n_fromS_invtoG(:,i), n_fromGtoF(:,i), n_fromFto0(:,i), nE, ...
                                         V_from0toS(:,i), V_fromStoA(:,i), V_fromAtoC(:,i), V_fromCtoD(:,i), V_fromDto0(:,i), ...
                                         V_from0toS_inv(:,i), V_fromS_invtoG(:,i), V_fromGtoF(:,i), V_fromFto0(:,i), VE(i), ...
                                         Reg);
    filename = strcat('FlightEnvelope', num2str(i),'.fig');
    saveas(flight_envelope_diagram, filename, 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat('FlightEnvelope', num2str(i),'.pdf');
    exportgraphics(flight_envelope_diagram, filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat('FlightEnvelope', num2str(i),'.png');
    exportgraphics(flight_envelope_diagram, filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
end

% SUBPLOTS FOR THE FLIGHT ENVELOPE
FlightEnvelopeSubplots
