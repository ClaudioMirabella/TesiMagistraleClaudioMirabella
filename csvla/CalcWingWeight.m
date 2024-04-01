
%% WING MASS CALCULATIONS
MTOW                        = Aircraft.Mass.Max_Takeoff_Mass.value;
S_wing                      = Aircraft.Geometry.Wing.S.value;
nmax                        = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
AR                          = Aircraft.Geometry.Wing.AR.value;
wing_type_flag              = Aircraft.Geometry.Wing.wing_weight_flag.value;

switch(Aircraft.Geometry.Wing.type.value)
    case 'Rectangular'
        Sweep_angle         = Aircraft.Geometry.Wing.sweep_first.value;
    case 'With_kinks'
         Sweep_angle         = Aircraft.Geometry.Wing.sweep_quarter_line.value;
end

taper_ratio                 = Aircraft.Geometry.Wing.ctip.value / Aircraft.Geometry.Wing.croot.value;
max_thickness_ratio         = Aircraft.Geometry.Wing.thickchord.value;
max_level_speed_at_sealevel = Aircraft.Performance.Min_design_cruise_airspeed.value;


 W_wing1 = WingWeightCESSNA(MTOW, S_wing, nmax, AR, wing_type_flag);
 W_wing2 = WingWeightUSAF(MTOW, nmax, AR, Sweep_angle, S_wing, ...
                                 taper_ratio, max_thickness_ratio, ... 
                                 max_level_speed_at_sealevel);
                             
if W_wing1 > W_wing2 
    W_wing = W_wing1; 
elseif W_wing1 < W_wing2
    W_wing = W_wing2;
end

Aircraft.Mass.Wing.value           = W_wing;
Aircraft.Mass.Wing.Attributes.unit = "kg";

Aircraft.Mass.Half_wing_mass.value           = W_wing * 0.5; 
Aircraft.Mass.Half_wing_mass.Attributes.unit = "kg";

%% Evaluation of mass distribution along the wing semi-span
