
%% GUST ENVELOPE 
% NOTE: It's important to remember that in this version of the code the air
%       density for all the wind gust calculations are referred to the
%       operational altitude of the selected aircraft, whilst the flight
%       envelope is referred to Sea Level, Standard Atmosphere air density.
% Vectors with airspeed values
% Two vectors with airspeed values within following ranges:
% 1st ---> [0, VC] where VC = MaxCruiseSpeed
% 2nd ---> [0, VD] where VD = MaxDiveSpeed

% GRAVITY ACCELERATION
g          = Aircraft.Constant_values.g.value;
% WING LOADING
WS         = Aircraft.Performance.Wing_loading.value;
% AIR DENSITY 
rho0       = Aircraft.Standard_atmosphere.Sea_level.rho.value;
rho_op     = Aircraft.Standard_atmosphere.Operative_ceiling.rho.value;
rho_th     = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;
% LIFT CURVE SLOPE IN 1/RAD
CLalfa_rad = Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value;
% MEAN GEOMETRIC CHORD
MGC        = Aircraft.Geometry.Wing.MGC.value;

% GUST SPEED - CRUISE 
Ude_cruise = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value;
% GUST SPEED - DIVE 
Ude_dive   = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value;

% CRUISE SPEED VECTOR
VC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.VC.value;

% DIVE SPEED VECTOR
VD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.VD.value;

% NUMBER OF ELEMENTS X AND Y
numb   = 1e3;
n_Mass = Aircraft.Mass.Vector_length.value;

% GUST SPEED VECTOR - CRUISE 
V_gust_cruise = ones(numb, n_Mass);

for i = 1:n_Mass 
    V_gust_cruise(:,i) = linspace(0.0, VC(i), numb);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_cruise.value           = V_gust_cruise;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_cruise.Attributes.unit = "m/s";

% GUST SPEED VECTOR - DIVE 
V_gust_dive = ones(numb, n_Mass);

for i = 1:n_Mass 
    V_gust_dive(:,i) = linspace(0.0, VD(i), numb);
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_dive.value           = V_gust_dive;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_dive.Attributes.unit = "m/s";
% -------------------------------------------------------------------------
%% x = calcmug(obj, Wingloading, MAC, NormalForceCurveSlope, g)
% This function calculates the MASS RATIO for the selected airplane
% following the CS-VLA airworthiness prescriptions. To have a
% complete documentation check the class file csvla.m
% -----------------------------------------------------------------------------------------------------------------------
% SEA LEVEL
% -----------------------------------------------------------------------------------------------------------------------
Mass_ratio_sea_level = ones(n_Mass, 1);
for i = 1:n_Mass
    Mass_ratio_sea_level(i) = calcmug(obj      , ...
                                     WS(i)     , ... % Wing loading in SI units
                                     MGC       , ... % Mean Geometric Chord in meters
                                     CLalfa_rad, ... % Normal force curve slope (practically equal to lift curve slope)
                                     rho0      , ... % Air density
                                     g);             % Gravity acceleration g
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Mass_ratio_sea_level.value           = Mass_ratio_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Mass_ratio_sea_level.Attributes.unit = "Non dimensional";
% -----------------------------------------------------------------------------------------------------------------------
% OPERATIVE ALTITUDE
% -----------------------------------------------------------------------------------------------------------------------
Mass_ratio_operative = ones(n_Mass, 1);
for i = 1:n_Mass
    Mass_ratio_operative(i) = calcmug(obj      , ...
                                     WS(i)     , ... % Wing loading in SI units
                                     MGC       , ... % Mean Geometric Chord in meters
                                     CLalfa_rad, ... % Normal force curve slope (practically equal to lift curve slope)
                                     rho_op    , ... % Air density
                                     g);             % Gravity acceleration g
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Mass_ratio_operative.value           = Mass_ratio_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Mass_ratio_operative.Attributes.unit = "Non dimensional";
%% DENSITY: Sea Level - x = calckg(obj, MassRatio) - GUST ALLEVIATION FACTOR
% This function calculates the GUST ALLEVIATION FACTOR for the
% selected airplane and flight conditions following the CS-VLA
% airworthiness prescriprions. To have a complete documentation
% check the class fil csvla.m
Kg_sea_level = ones(n_Mass, 1);
for i = 1:n_Mass 
    Kg_sea_level(i) = calckg(obj, Mass_ratio_sea_level(i));
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Kg_sea_level.value           = Kg_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Kg_sea_level.Attributes.unit = "Non dimensional";
% -------------------------------------------------------------------------
%% DENSITY: Operative altitude - x = calckg(obj, MassRatio) - GUST ALLEVIATION FACTOR
% This function calculates the GUST ALLEVIATION FACTOR for the
% selected airplane and flight conditions following the CS-VLA
% airworthiness prescriprions. To have a complete documentation
% check the class fil csvla.m
Kg_operative = ones(n_Mass, 1);
for i = 1:n_Mass 
    Kg_operative(i) = calckg(obj, Mass_ratio_operative(i));
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Kg_operative.value           = Kg_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Kg_operative.Attributes.unit = "Non dimensional";
% -------------------------------------------------------------------------
%% GUST AIRLOADS CALCULATIONS - SEA LEVEL 
% Gust airloads flag
%         --> 'positive_cruise'
%         --> 'negative_cruise'
%         --> 'positive_dive'
%         --> 'negative_dive'
% This function is able to calculates in any possible case a vector
% which contains gust load factors value, following CS-VLA
% airworthiness prescription. To have a complete documentation
% check the class file csvla.m
% POSITIVE CRUISE
% -------------------------------------------------------------------------
npos_cruise_sea_level   = ones(numb, n_Mass);
airload_flag_pos_cruise = 'positive_cruise';
for i = 1:n_Mass
    npos_cruise_sea_level(:,i) = calcngust(obj, rho0, ...                       % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_sea_level(i), ...            % Gust alleviation factor KG
                                                Ude_cruise, ...                 % Gust speed at cruise VC
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_pos_cruise)); % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_cruise_sea_level.value           = npos_cruise_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_cruise_sea_level.Attributes.unit = "g";
% NEGATIVE CRUISE
% -------------------------------------------------------------------------
nneg_cruise_sea_level   = ones(numb, n_Mass);
airload_flag_neg_cruise = 'negative_cruise';
for i = 1:n_Mass
    nneg_cruise_sea_level(:,i) = calcngust(obj, rho0, ...                       % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_sea_level(i), ...            % Gust alleviation factor KG
                                                Ude_cruise, ...                 % Gust speed at cruise VC
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_neg_cruise)); % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_cruise_sea_level.value           = nneg_cruise_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_cruise_sea_level.Attributes.unit = "g";
% POSITIVE DIVE
% -------------------------------------------------------------------------
npos_dive_sea_level   = ones(numb, n_Mass);
airload_flag_pos_dive = 'positive_dive';
for i = 1:n_Mass
    npos_dive_sea_level(:,i) = calcngust(obj,   rho0, ...                       % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_sea_level(i), ...            % Gust alleviation factor KG
                                                Ude_dive, ...                   % Gust speed at dive VD
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_pos_dive));   % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_dive_sea_level.value           = npos_dive_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_dive_sea_level.Attributes.unit = "g";
% NEGATIVE DIVE
% -------------------------------------------------------------------------
nneg_dive_sea_level   = ones(numb, n_Mass);
airload_flag_neg_dive = 'negative_dive';
for i = 1:n_Mass
    nneg_dive_sea_level(:,i) = calcngust(obj,   rho0, ...                       % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_sea_level(i), ...            % Gust alleviation factor KG
                                                Ude_dive, ...                   % Gust speed at dive VD
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_neg_dive));   % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_dive_sea_level.value           = nneg_dive_sea_level;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_dive_sea_level.Attributes.unit = "g";
% -------------------------------------------------------------------------
%% GUST AIRLOADS CALCULATIONS - OPERATIVE CEILING 
% Gust airloads flag
%         --> 'positive_cruise'
%         --> 'negative_cruise'
%         --> 'positive_dive'
%         --> 'negative_dive'
% This function is able to calculates in any possible case a vector
% which contains gust load factors value, following CS-VLA
% airworthiness prescription. To have a complete documentation
% check the class file csvla.m
% POSITIVE CRUISE
% -------------------------------------------------------------------------
npos_cruise_operative   = ones(numb, n_Mass);
for i = 1:n_Mass
    npos_cruise_operative(:,i) = calcngust(obj, rho_op, ...                     % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_operative(i), ...            % Gust alleviation factor KG
                                                Ude_cruise, ...                 % Gust speed at cruise VC
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_pos_cruise)); % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_cruise_operative.value           = npos_cruise_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_cruise_operative.Attributes.unit = "g";
% NEGATIVE CRUISE
% -------------------------------------------------------------------------
nneg_cruise_operative   = ones(numb, n_Mass);
for i = 1:n_Mass
    nneg_cruise_operative(:,i) = calcngust(obj, rho_op, ...                     % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_operative(i), ...            % Gust alleviation factor KG
                                                Ude_cruise, ...                 % Gust speed at cruise VC
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_neg_cruise)); % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_cruise_operative.value           = nneg_cruise_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_cruise_operative.Attributes.unit = "g";
% POSITIVE DIVE
% -------------------------------------------------------------------------
npos_dive_operative   = ones(numb, n_Mass);
for i = 1:n_Mass
    npos_dive_operative(:,i) = calcngust(obj,   rho_op, ...                     % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_operative(i), ...            % Gust alleviation factor KG
                                                Ude_dive, ...                   % Gust speed at dive VD
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_pos_dive));   % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_dive_operative.value           = npos_dive_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_dive_operative.Attributes.unit = "g";
% NEGATIVE DIVE
% -------------------------------------------------------------------------
nneg_dive_operative   = ones(numb, n_Mass);
airload_flag_neg_dive = 'negative_dive';
for i = 1:n_Mass
    nneg_dive_operative(:,i) = calcngust(obj,   rho_op, ...                     % Standard atmosphere density
                                                CLalfa_rad, ...                 % Normal force curve slope [1/rad]
                                                Kg_operative(i), ...            % Gust alleviation factor KG
                                                Ude_dive, ...                   % Gust speed at dive VD
                                                WS(i), ...                      % Wing loading in SI units
                                                VC(i), ...                      % Cruise speed from the V - n diagram 
                                                VD(i), ...                      % Dive speed from the V - n diagram
                                                char(airload_flag_neg_dive));   % A conveniently defined case switch
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_dive_operative.value           = nneg_dive_operative;
Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_dive_operative.Attributes.unit = "g";
% -------------------------------------------------------------------------
%% GUST ENVELOPE DIAGRAM 
Reg        = Aircraft.Certification.Regulation.value;

n_from0toS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS.value;
V_from0toS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS.value;
n_fromStoA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromStoA.value;
V_fromStoA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromStoA.value;
n_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromAtoC.value;
V_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromAtoC.value;
n_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromCtoD.value;
V_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromCtoD.value;
n_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromDto0.value;
V_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromDto0.value;

n_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_from0toS_inv.value;
V_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_from0toS_inv.value;
n_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromS_invtoG.value;
V_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromS_invtoG.value;
n_fromGtoF     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromGtoF.value;
V_fromGtoF     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromGtoF.value;
n_fromFto0     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.n_fromFto0.value;
V_fromFto0     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.V_fromFto0.value;
nE             = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.nE.value;
VE             = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.VE.value;

for i = 1:n_Mass
    gust_envelope_diagram = GustEnvelope(n_from0toS(:,i), n_fromStoA(:,i), n_fromAtoC(:,i), n_fromCtoD(:,i), n_fromDto0(:,i), ...
                                         n_from0toS_inv(:,i), n_fromS_invtoG(:,i), n_fromGtoF(:,i), n_fromFto0(:,i), nE, ...
                                         V_from0toS(:,i), V_fromStoA(:,i), V_fromAtoC(:,i), V_fromCtoD(:,i), V_fromDto0(:,i), ...
                                         V_from0toS_inv(:,i), V_fromS_invtoG(:,i), V_fromGtoF(:,i), V_fromFto0(:,i), VE(i), ...
                                         V_gust_cruise(:,i), V_gust_dive(:,i), ...
                                         npos_cruise_sea_level(:,i), nneg_cruise_sea_level(:,i), ...
                                         npos_dive_sea_level(:,i), nneg_dive_sea_level(:,i), ...
                                         Reg);
    
    filename = strcat('GustEnvelope', num2str(i),'.fig');
    saveas(gust_envelope_diagram, filename, 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat('GustEnvelope', num2str(i),'.pdf');
    exportgraphics(gust_envelope_diagram, filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat('GustEnvelope', num2str(i),'.png');
    exportgraphics(gust_envelope_diagram, filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
end

% SUBPLOTS FOR THE GUST ENVELOPE
GustEnvelopeSubplots