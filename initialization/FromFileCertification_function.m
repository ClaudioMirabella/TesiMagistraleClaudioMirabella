function Aircraft = FromFileCertification_function(Aircraft,varargin)
%% READ INPUT FILE
%% READING EXCEL
% cd ../_Utilities
fprintf('\n');
fprintf('Input File: ');
if nargin==1
    filename='Aircraft.xlsx';
else
    filename=[varargin{1},'.xlsx'];
end
fprintf(filename);

%reading excel spreadsheet with readtable function with options
opts = spreadsheetImportOptions("NumVariables", 3);
% Specify sheet and range
%opts.Sheet = "Sheet1";
%opts.DataRange = "A2:C25";

% Specify column names and types
opts.VariableNames = ["field", "value", "unit"];
opts.VariableTypes = ["char", "char", "char"];

% Specify variable properties
%opts = setvaropts(opts, ["field", "value", "unit"], "WhitespaceRule", "preserve");
%opts = setvaropts(opts, ["field", "value", "unit"], "EmptyFieldRule", "auto");
Table = readtable(filename, opts, "UseExcel", false);

value=Table(:,2);
unit=Table(:,3);
label=Table{:,1};
fprintf('\n');
% cd ../_PreDesign

VarText={'croot', ...                      % MAIN WING
         'ctip', ...
         'c_kink_one', ...
         'c_kink_two', ...
         'wing_span', ...
         'first_sweep_value', ...
         'second_sweep_value', ...
         'third_sweep_value', ...
         'sweep_location', ...
         'secondary_sweep_location', ...
         'first_dihedral_value', ...
         'second_dihedral_value', ...
         'third_dihedral_value', ...
         'first_airfoil_section', ...
         'second_airfoil_section', ...
         'third_airfoil_section', ...
         'fourth_airfoil_section', ...
         'wing_camber', ...
         'wing_camber_loc', ...
         'wing_thickness', ...
         'first_twist_value', ...
         'second_twist_value', ...
         'third_twist_value', ...
         'fourth_twist_value', ...
         'twist_location', ...
         'panel_span1', ...
         'panel_span2', ...
         'panel_span3', ...
         'wing_weight_flag', ...
         'wing_type', ...                  
         'wing_xle', ...
         'wing_yle', ...
         'wing_zle', ...                   % MAIN WING
         'overall_length', ...             % FUSELAGE
         'overall_width', ...
         'overall_height', ...
         'overall_diameter', ...
         'Non_dim_radius_of_gyration', ...
         'Radius_of_gyration', ...
         'fuselage_id', ...
         'fuselage_type', ...              % FUSELAGE
         'eta_inner_flaps', ...            % FLAPS
         'eta_outer_flaps', ...
         'cf_c_outer_flaps', ...
         'cf_c_inner_flaps', ...           
         'cb_c_inner_flaps', ...
         'cb_c_outer_flaps', ...           % FLAPS
         'eta_inner_ailerons', ...         % AILERONS
         'eta_outer_ailerons', ... 
         'delta_max', ...
         'cf_c_inner_ailerons', ... 
         'cf_c_outer_ailerons', ...       
         'cb_c_inner_ailerons', ...
         'cb_c_outer_ailerons', ...        % AILERONS
         'ht_croot', ...                   % HORIZONTAL TAIL
         'ht_ctip', ...
         'ht_span', ...
         'ht_twist', ...
         'ht_twist_location', ...
         'ht_sweep', ...
         'ht_sweep_location', ...
         'ht_sweep_secondary_location', ...
         'ht_dihedral', ...                
         'ht_camber', ...
         'ht_camber_location', ...
         'ht_thickness_ratio', ...
         'ht_moment_arm', ...
         'ht_delta_max', ...
         'ht_depsilondalfa', ...
         'ht_xloc', ...
         'ht_yloc', ...
         'ht_zloc', ...                    % HORIZONTAL TAIL
         'elevator_eta_inner', ...         % ELEVATOR
         'elevator_eta_outer', ...
         'elevator_flag', ...
         'elevator_cb_c_inner', ...
         'elevator_cb_c_outer', ...
         'elevator_cf_c_inner', ...
         'elevator_cf_c_outer', ...        % ELEVATOR
         'vt_flag', ...                    % VERTICAL TAIL
         'vt_camber', ... 
         'vt_camber_location', ...
         'vt_thickness_ratio', ...
         'vt_twist', ...
         'vt_twist_location', ...
         'vt_xloc', ...
         'vt_yloc', ...
         'vt_zloc', ...
         'vt_span', ...
         'vt_croot', ...
         'vt_ctip', ...
         'vt_sweep', ...
         'vt_sweep_location', ...
         'vt_sweep_secondary_location', ...
         'vt_dihedral', ...                % VERTICAL TAIL 
         'rudder_eta_inner', ...           % RUDDER
         'rudder_eta_outer', ...
         'rudder_cb_c_inner', ...
         'rudder_cb_c_outer', ...
         'rudder_cf_c_inner', ...
         'rudder_cf_c_outer', ...          % RUDDER
         'configuration_flag', ...         % OPEN VSP CASE
         'movable_flag', ...
         'openvsp_altitude', ...
         'openvsp_airspeed', ...
         'openvsp_reynolds', ...
         'openvsp_first_tess', ...
         'openvsp_sec_tess', ...
         'openvsp_third_tess', ...
         'openvsp_total_tess', ...
         'openvsp_alfa_start', ...
         'openvsp_alfa_stop', ...
         'openvsp_delta_alfa', ...
         'openvsp_beta', ...               % OPEN VSP CASE
         'Aircraft_name', ...              % AIRCRAFT INPUTS
         'Aircraft_type', ...
         'Designer', ...
         'Regulation', ...
         'Date', ...
         'Amendment', ...
         'Airloads_flag', ...              
         'nmax', ... 
         'nmin', ...                       % AIRCRAFT INPUTS
         'Interpolation_flag', ...         % AERODYNAMIC MODEL
         'Max_lift_coefficient_clean', ...
         'Max_lift_coefficient_takeoff', ...
         'Max_lift_coefficient_landing', ...
         'Inverted_lift_coefficient', ...
         'wing_body_aoa', ...
         'wing_body_cl', ...
         'wing_body_cm', ...
         'wing_body_cd', ...               % AERODYNAMIC MODEL
         'Max_Takeoff_Mass', ...           % AIRCRAFT MASS 
         'Empty_Mass', ... 
         'Useful_Mass', ...
         'Fuel_Mass', ...
         'Crew_Mass', ...
         'Oil_mass', ...
         'Inertia_moment_Y', ...   
         'n_Mass', ...
         'Max_fwd_cg', ...                 
         'Max_aft_cg', ...                 % AIRCRAFT MASS 
         'sea_level', ...                  % STANDARD ATMOSPHERE
         'operative_ceiling', ... 
         'theoretical_ceiling', ...        % STANDARD ATMOSPHERE
         'gravity_acceleration', ...       % CONSTANT VALUES 
         'gust_speed_cruise', ...
         'gust_speed_dive', ...            % CONSTANT VALUES
         'Min_design_cruise_airspeed', ... % DESIGN AIRSPEED
         'wing_xac', ...                   % AERODYNAMIC CENTRE
         'max_up_bcg', ...                 % bcg = Lift horizontal component moment arm
         'max_down_bcg', ... 
         'lift_horizontal_component_arm', ...
         'max_fwd_ac', ...                 
         'max_aft_ac', ...                 % AERODYNAMIC CENTRE
         'thrust_line', ...                % THRUST AXES
         'max_up_thrust_line', ... 
         'max_down_thrust_line', ...       % THRUST AXES
         'time_step', ...                  % HORIZONTAL TAIL LOADS 
         'time_interval', ... 
         'damping_factor', ...
         'elevator_clalfa', ...
         'elevator_cldelta', ...
         'damping_angle_deltav_VA', ...
         'type_flag', ...                 
         'command_flag', ...               % HORIZONTAL TAIL LOADS
         'CN_deltar', ...                  % VERTICAL TAIL LOADS 
         'CN_beta', ...        
         'rad_of_gyr_vt', ...
         'max_delta_rudder', ...          
         'sideslip_angle', ...             % VERTICAL TAIL LOADS
         };
     VarText = VarText';
% -----------------------------
% label = label(2:end,1);
% unit  = unit(2:end,1);
% value = value(2:end,1);
Debugvartext = VarText';
% VarText = VarText';
% -----------------------------
Index=zeros(1,length(VarText));
for i=1:length(VarText)
    x = find(~cellfun(@isempty, strfind(label,VarText{i})));
    if length(x) > 1
        x = x(1);
        Index(i) = x;
    elseif length(x) == 1
        Index(i) = x;
    end
%     Index(i) = find(~cellfun(@isempty, strfind(label,VarText{i})));
%     Index(i) = find(~cellfun(@isempty, strfind(label,Debugvartext{i})));
end
LengthIndex = nnz(Index);
if LengthIndex==length(VarText)
    % ---------------------------------------------------------------------
    % MAIN WING
    % ---------------------------------------------------------------------
    p = strcmp('croot', label);
    Aircraft.Geometry.Wing.croot.value = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.croot.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ctip', label);
    Aircraft.Geometry.Wing.ctip.value = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.ctip.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('c_kink_one', label);
    Aircraft.Geometry.Wing.chord_kink_one.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.chord_kink_one.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('c_kink_two', label);
    Aircraft.Geometry.Wing.chord_kink_two.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.chord_kink_two.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    croot      = Aircraft.Geometry.Wing.croot.value;
    c_kink_one = Aircraft.Geometry.Wing.chord_kink_one.value;
    c_kink_two = Aircraft.Geometry.Wing.chord_kink_two.value;
    ctip       = Aircraft.Geometry.Wing.ctip.value;
    Aircraft.Geometry.Wing.taper_ratio_panel1.value = c_kink_one / croot;
    Aircraft.Geometry.Wing.taper_ratio_panel1.Attributes.unit = "Non dimensional";
    Aircraft.Geometry.Wing.taper_ratio_panel2.value = c_kink_two / c_kink_one;
    Aircraft.Geometry.Wing.taper_ratio_panel2.Attributes.unit = "Non dimensional";
    Aircraft.Geometry.Wing.taper_ratio_panel3.value = ctip / c_kink_two;
    Aircraft.Geometry.Wing.taper_ratio_panel3.Attributes.unit = "Non dimensional";    
    % ---------------------------------------------------------------------
    p = strcmp('wing_span', label);
    Aircraft.Geometry.Wing.b.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.b.Attributes.unit = char(table2array(unit(p==1,1)));
    b_wing = Aircraft.Geometry.Wing.b.value; 
    S_wing = (croot + ctip) * b_wing * 0.5;
    Aircraft.Geometry.Wing.S.value = S_wing; 
    Aircraft.Geometry.Wing.S.Attributes.unit = "m^2";    
    Aircraft.Geometry.Wing.AR.value = ( b_wing^2 ) / S_wing;
    Aircraft.Geometry.Wing.AR.Attributes.unit = "Non dimensional";
    Aircraft.Geometry.Wing.MGC.value = S_wing / b_wing;
    Aircraft.Geometry.Wing.MGC.Attributes.unit = "m";
    % ---------------------------------------------------------------------
    p = strcmp('first_sweep_value', label); 
    Aircraft.Geometry.Wing.sweep_first.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.sweep_first.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('second_sweep_value', label); 
    Aircraft.Geometry.Wing.sweep_second.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.sweep_second.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('third_sweep_value', label); 
    Aircraft.Geometry.Wing.sweep_third.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.sweep_third.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('sweep_location', label); 
    Aircraft.Geometry.Wing.sweep_location.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.sweep_location.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('secondary_sweep_location', label); 
    Aircraft.Geometry.Wing.secondary_sweep_location.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.secondary_sweep_location.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('first_dihedral_value', label);
    Aircraft.Geometry.Wing.dihedral_first.value = str2double(table2array(value(p==1, 1))); % geometric dihedral angle at c/4 in deg.
    Aircraft.Geometry.Wing.dihedral_first.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('second_dihedral_value', label);
    Aircraft.Geometry.Wing.dihedral_second.value = str2double(table2array(value(p==1, 1))); % geometric dihedral angle at c/4 in deg.
    Aircraft.Geometry.Wing.dihedral_second.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('third_dihedral_value', label);
    Aircraft.Geometry.Wing.dihedral_third.value = str2double(table2array(value(p==1, 1))); % geometric dihedral angle at c/4 in deg.
    Aircraft.Geometry.Wing.dihedral_third.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('first_airfoil_section', label);
    Aircraft.Certification.Aerodynamic_data.airfoil_first_panel.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.airfoil_first_panel.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('second_airfoil_section', label);
    Aircraft.Certification.Aerodynamic_data.airfoil_second_panel.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.airfoil_second_panel.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('third_airfoil_section', label);
    Aircraft.Certification.Aerodynamic_data.airfoil_third_panel.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.airfoil_third_panel.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('fourth_airfoil_section', label);
    Aircraft.Certification.Aerodynamic_data.airfoil_fourth_panel.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.airfoil_fourth_panel.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_camber', label);
    Aircraft.Geometry.Wing.camber.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.camber.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_camber_loc', label);
    Aircraft.Geometry.Wing.camberloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.camberloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_thickness', label);
    Aircraft.Geometry.Wing.thickchord.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.thickchord.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('first_twist_value', label);
    Aircraft.Geometry.Wing.twist_angle_first.value = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.twist_angle_first.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('second_twist_value', label);
    Aircraft.Geometry.Wing.twist_angle_second.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.twist_angle_second.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('third_twist_value', label);
    Aircraft.Geometry.Wing.twist_angle_third.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.twist_angle_third.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('fourth_twist_value', label);
    Aircraft.Geometry.Wing.twist_angle_fourth.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.twist_angle_fourth.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('twist_location', label);
    Aircraft.Geometry.Wing.twist_location.value = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.twist_location.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('panel_span1', label);
    Aircraft.Geometry.Wing.panel_span1.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.panel_span1.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('panel_span2', label);
    Aircraft.Geometry.Wing.panel_span2.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.panel_span2.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('panel_span3', label);
    Aircraft.Geometry.Wing.panel_span3.value = str2double(table2array(value(p==1, 1))); 
    Aircraft.Geometry.Wing.panel_span3.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_weight_flag', label);
    Aircraft.Geometry.Wing.wing_weight_flag.value = char(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.wing_weight_flag.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_type', label);
    Aircraft.Geometry.Wing.type.value = char(table2array(value(p==1,1)));
    Aircraft.Geometry.Wing.type.Attributes.unit = char(table2array(unit(p==1,1))); 
    p = strcmp('wing_xle', label); 
    Aircraft.Geometry.Wing.xle.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.xle.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_yle', label); 
    Aircraft.Geometry.Wing.yle.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.yle.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('wing_zle', label); 
    Aircraft.Geometry.Wing.zle.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Wing.zle.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % MAIN WING
    % ---------------------------------------------------------------------  
    % ---------------------------------------------------------------------
    % FUSELAGE
    % ---------------------------------------------------------------------  
    p = strcmp('overall_length', label); 
    Aircraft.Geometry.Fuselage.length.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.length.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('overall_width', label);
    Aircraft.Geometry.Fuselage.width.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.width.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('overall_height', label);
    Aircraft.Geometry.Fuselage.height.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.height.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('overall_diameter', label);
    Aircraft.Geometry.Fuselage.diameter.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.diameter.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('Non_dim_radius_of_gyration', label);
    Aircraft.Geometry.Fuselage.Non_dim_radius_of_gyration.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.Non_dim_radius_of_gyration.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('Radius_of_gyration', label);
    Aircraft.Geometry.Fuselage.Radius_of_gyration.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Fuselage.Radius_of_gyration.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('fuselage_id', label);
    Aircraft.Geometry.Fuselage.id = char(table2array(value(p==1,1)));
%    Aircraft.Geometry.Fuselage.id.type = char(table2array(unit(p==1,1)));
    p = strcmp('fuselage_type', label);
    Aircraft.Geometry.Fuselage.type = char(table2array(value(p==1,1)));
%    Aircraft.Geometry.Fuselage.type.flag = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % FUSELAGE
    % --------------------------------------------------------------------- 
    % ---------------------------------------------------------------------
    % FLAPS
    % ---------------------------------------------------------------------
    p = strcmp('eta_inner_flaps', label);
    Aircraft.Geometry.Flaps.eta_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.eta_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    eta_inner_flap                                    = Aircraft.Geometry.Flaps.eta_inner.value;
    Aircraft.Geometry.Flaps.y_inner.value             = 0.5 * b_wing * eta_inner_flap;
    Aircraft.Geometry.Flaps.y_inner.Attributes. unit  = "m";
    p = strcmp('eta_outer_flaps', label);
    Aircraft.Geometry.Flaps.eta_outer.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.eta_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    eta_outer_flap                                    = Aircraft.Geometry.Flaps.eta_inner.value;
    Aircraft.Geometry.Flaps.y_outer.value             = 0.5 * b_wing * eta_outer_flap;
    Aircraft.Geometry.Flaps.y_outer.Attributes. unit  = "m";
    p = strcmp('cf_c_inner_flaps', label);
    Aircraft.Geometry.Flaps.cf_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.cf_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cf_c_outer_flaps', label);
    Aircraft.Geometry.Flaps.cf_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.cf_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cb_c_inner_flaps', label);
    Aircraft.Geometry.Flaps.cb_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.cb_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cb_c_outer_flaps', label);
    Aircraft.Geometry.Flaps.cb_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Flaps.cb_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % FLAPS
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % AILERONS
    % ---------------------------------------------------------------------
    p = strcmp('eta_inner_ailerons', label); 
    Aircraft.Geometry.Aileron.eta_inner.value           = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Aileron.eta_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    eta_inner                                           = Aircraft.Geometry.Aileron.eta_inner.value;
    Aircraft.Geometry.Aileron.y_inner.value             = 0.5 * eta_inner * b_wing;
    Aircraft.Geometry.Aileron.y_inner.Attributes.unit   = "m";
    p = strcmp('eta_outer_ailerons', label);
    Aircraft.Geometry.Aileron.eta_outer.value           = str2double(table2array(value(p==1,1)));
    Aircraft.Geometry.Aileron.eta_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    eta_outer                                           = Aircraft.Geometry.Aileron.eta_outer.value;
    Aircraft.Geometry.Aileron.y_outer.value             = 0.5 * eta_outer * b_wing;
    Aircraft.Geometry.Aileron.y_outer.Attributes.unit   = "m";
    p = strcmp('delta_max', label);
    Aircraft.Geometry.Aileron.delta_max.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Aileron.delta_max.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cf_c_inner_ailerons', label);
    Aircraft.Geometry.Aileron.cf_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Aileron.cf_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cf_c_inner_ailerons', label);
    Aircraft.Geometry.Aileron.cf_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Aileron.cf_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cb_c_inner_ailerons', label);
    Aircraft.Geometry.Aileron.cb_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Aileron.cb_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('cb_c_outer_ailerons', label);
    Aircraft.Geometry.Aileron.cb_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Aileron.cb_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % AILERONS
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % HORIZONTAL TAIL 
    % ---------------------------------------------------------------------
    p = strcmp('ht_croot', label);
    Aircraft.Geometry.Horizontal.croot.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.croot.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_ctip', label);
    Aircraft.Geometry.Horizontal.ctip.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.ctip.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_span', label);
    Aircraft.Geometry.Horizontal.b.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.b.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_twist', label);
    Aircraft.Geometry.Horizontal.twist.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.twist.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_twist_location', label);
    Aircraft.Geometry.Horizontal.twistloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.twistloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_sweep', label);
    Aircraft.Geometry.Horizontal.sweep.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.sweep.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_sweep_location', label); 
    Aircraft.Geometry.Horizontal.sweeploc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.sweeploc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_sweep_secondary_location', label);
    Aircraft.Geometry.Horizontal.secsweeploc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.secsweeploc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_dihedral', label);
    Aircraft.Geometry.Horizontal.dihedral.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.dihedral.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_camber', label); 
    Aircraft.Geometry.Horizontal.camber.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.camber.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_camber_location', label); 
    Aircraft.Geometry.Horizontal.camber_location.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.camber_location.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_thickness_ratio', label); 
    Aircraft.Geometry.Horizontal.thickness_ratio.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.thickness_ratio.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_moment_arm', label); 
    Aircraft.Geometry.Horizontal.l_ht.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.l_ht.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_delta_max', label); 
    Aircraft.Geometry.Horizontal.ht_delta_max.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.ht_delta_max.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_depsilondalfa', label); 
    Aircraft.Certification.Aerodynamic_data.Horizontal.ht_depsilondalfa.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.Horizontal.ht_depsilondalfa.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_xloc', label); 
    Aircraft.Geometry.Horizontal.xloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.xloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_yloc', label); 
    Aircraft.Geometry.Horizontal.yloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.yloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('ht_zloc', label); 
    Aircraft.Geometry.Horizontal.zloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Horizontal.zloc.Attributes.unit = char(table2array(unit(p==1,1)));
    % Horizontal tail surface 
    ht_croot = Aircraft.Geometry.Horizontal.croot.value;
    ht_ctip  = Aircraft.Geometry.Horizontal.ctip.value;
    Aircraft.Geometry.Horizontal.taper_ratio.value           = ht_ctip / ht_croot;
    Aircraft.Geometry.Horizontal.taper_ratio.Attributes.unit = "Non dimensional";
    ht_span  = Aircraft.Geometry.Horizontal.b.value;
    ht_Surf  = ( ht_croot + ht_ctip ) * ht_span * 0.5; 
    Aircraft.Geometry.Horizontal.S.value             = ht_Surf; 
    Aircraft.Geometry.Horizontal.S.Attributes.unit   = "m^2"; 
    Aircraft.Geometry.Horizontal.MGC.value           = ht_Surf / ht_span; 
    Aircraft.Geometry.Horizontal.MGC.Attributes.unit = "m"; 
    Aircraft.Geometry.Horizontal.AR.value            = (ht_span^2) / (ht_Surf);
    Aircraft.Geometry.Horizontal.AR.Attributes.unit  = "Non dimensional";
    % ---------------------------------------------------------------------
    % HORIZONTAL TAIL 
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % ELEVATOR 
    % ---------------------------------------------------------------------
    p = strcmp('elevator_eta_inner', label);
    Aircraft.Geometry.Elevator.eta_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.eta_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_eta_outer', label);
    Aircraft.Geometry.Elevator.eta_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.eta_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_flag', label);
    elevator_flag                                            = char(table2array(value(p==1,1)));
    Aircraft.Geometry.Elevator.elevator_flag.value           = convertCharsToStrings(elevator_flag);
    Aircraft.Geometry.Elevator.elevator_flag.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_cb_c_inner', label); 
    Aircraft.Geometry.Elevator.cb_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.cb_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_cb_c_outer', label);
    Aircraft.Geometry.Elevator.cb_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.cb_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_cf_c_inner', label); 
    Aircraft.Geometry.Elevator.cf_c_inner.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.cf_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('elevator_cf_c_outer', label);
    Aircraft.Geometry.Elevator.cf_c_outer.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Elevator.cf_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % ELEVATOR 
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % VERTICAL TAIL 
    % ---------------------------------------------------------------------
    p = strcmp('vt_flag', label); 
    Aircraft.Geometry.Vertical.empennage_flag.value = char(table2array(value(p==1,1)));
    p = strcmp('vt_camber', label);
    Aircraft.Geometry.Vertical.camber.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.camber.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_camber_location', label);
    Aircraft.Geometry.Vertical.camber_location.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.camber_location.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_thickness_ratio', label);
    Aircraft.Geometry.Vertical.thickness_ratio.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.thickness_ratio.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_twist', label);
    Aircraft.Geometry.Vertical.twist.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.twist.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_twist_location', label);
    Aircraft.Geometry.Vertical.twistloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.twistloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_xloc', label);
    Aircraft.Geometry.Vertical.xloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.xloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_yloc', label);
    Aircraft.Geometry.Vertical.yloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.yloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_zloc', label);
    Aircraft.Geometry.Vertical.zloc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.zloc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_span', label);
    Aircraft.Geometry.Vertical.b.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.b.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_croot', label);
    Aircraft.Geometry.Vertical.croot.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.croot.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_ctip', label);
    Aircraft.Geometry.Vertical.ctip.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.ctip.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_sweep', label);
    Aircraft.Geometry.Vertical.sweep.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.sweep.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_sweep_location', label);
    Aircraft.Geometry.Vertical.sweeploc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.sweeploc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_sweep_secondary_location', label);
    Aircraft.Geometry.Vertical.secsweeploc.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.secsweeploc.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('vt_dihedral', label);
    Aircraft.Geometry.Vertical.dihedral.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Vertical.dihedral.Attributes.unit = char(table2array(unit(p==1,1)));
    % Vertical tail surface 
    vt_croot = Aircraft.Geometry.Vertical.croot.value;
    vt_ctip  = Aircraft.Geometry.Vertical.ctip.value;
    Aircraft.Geometry.Vertical.taper_ratio.value = vt_ctip / vt_croot;
    Aircraft.Geometry.Vertical.taper_ratio.Attributes.unit = "Non dimensional";
    vt_span  = Aircraft.Geometry.Vertical.b.value;
    vt_Surf  = ( vt_croot + vt_ctip ) * vt_span * 0.5; 
    Aircraft.Geometry.Vertical.S.value             = vt_Surf;   % Single fin surface     
    Aircraft.Geometry.Vertical.S.Attributes.unit   = "m^2"; 
    Aircraft.Geometry.Vertical.MGC.value           = vt_Surf / vt_span; 
    Aircraft.Geometry.Vertical.MGC.Attributes.unit = "m"; 
    Aircraft.Geometry.Vertical.AR.value            = (vt_span^2) / (vt_Surf);
    Aircraft.Geometry.Vertical.AR.Attributes.unit  = "Non dimensional";
    % CALCULATION OF THE LIFT CURVE SLOPE OF THE VERTICAL TAIL PLANE
    AR_vt    = Aircraft.Geometry.Vertical.AR.value; 
    a_vt_rad = vertical_tail_lift_slope_rad(AR_vt);
    Aircraft.Geometry.Vertical.a_vt_rad.value           = a_vt_rad;
    Aircraft.Geometry.Vertical.a_vt_rad.Attributes.unit = "1/rad";
    Aircraft.Geometry.Vertical.a_vt_deg.value           = a_vt_rad / rad2deg(1);
    Aircraft.Geometry.Vertical.a_vt_deg.Attributes.unit = "1/deg";

    % ---------------------------------------------------------------------
    % VERTICAL TAIL 
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % RUDDER
    % ---------------------------------------------------------------------
    p = strcmp('rudder_eta_inner', label);
    Aircraft.Geometry.Rudder.eta_inner.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.eta_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('rudder_eta_outer', label); 
    Aircraft.Geometry.Rudder.eta_outer.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.eta_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('rudder_cb_c_inner', label); 
    Aircraft.Geometry.Rudder.cb_c_inner.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.cb_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('rudder_cb_c_outer', label); 
    Aircraft.Geometry.Rudder.cb_c_outer.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.cb_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('rudder_cf_c_inner', label); 
    Aircraft.Geometry.Rudder.cf_c_inner.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.cf_c_inner.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('rudder_cf_c_outer', label); 
    Aircraft.Geometry.Rudder.cf_c_outer.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.Rudder.cf_c_outer.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % RUDDER
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % OPEN VSP
    % ---------------------------------------------------------------------
    p = strcmp('configuration_flag', label); 
    Aircraft.OpenVSP.input.configuration_flag.value = char(table2array(value(p==1,1)));
    Aircraft.OpenVSP.input.configuration_flag.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('movable_flag', label); 
    Aircraft.OpenVSP.input.movable_flag.value = char(table2array(value(p==1,1)));
    Aircraft.OpenVSP.input.movable_flag.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_altitude', label); 
    Aircraft.OpenVSP.input.altitude.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.altitude.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_airspeed', label); 
    Aircraft.OpenVSP.input.V.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.V.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_reynolds', label); 
    Aircraft.OpenVSP.input.Re.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.Re.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_first_tess', label); 
    Aircraft.OpenVSP.input.openvsp_first_tess.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.openvsp_first_tess.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_sec_tess', label); 
    Aircraft.OpenVSP.input.openvsp_sec_tess.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.openvsp_sec_tess.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_third_tess', label); 
    Aircraft.OpenVSP.input.openvsp_third_tess.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.openvsp_third_tess.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_total_tess', label); 
    Aircraft.OpenVSP.input.openvsp_total_tess.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.openvsp_total_tess.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_alfa_start', label); 
    Aircraft.OpenVSP.input.alfa_start.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.alfa_start.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_alfa_stop', label); 
    Aircraft.OpenVSP.input.alfa_stop.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.alfa_stop.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_delta_alfa', label); 
    Aircraft.OpenVSP.input.delta_alfa.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.delta_alfa.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('openvsp_beta', label); 
    Aircraft.OpenVSP.input.beta.value = str2double(table2array(value(p==1, 1)));
    Aircraft.OpenVSP.input.beta.Attributes.unit = char(table2array(unit(p==1,1)));
    % ---------------------------------------------------------------------
    % OPEN VSP
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % AIRCRAFT INPUTS
    % ---------------------------------------------------------------------
    p = strcmp('Aircraft_name', label);
    Aircraft.Certification.Aircraft_Name.value = char(table2array(value(p==1,1)));
    Aircraft.Certification.Aircraft_Name.Attributes.unit = char(table2array(unit(p==1,1)));
    p = strcmp('Aircraft_type', label);
    Aircraft.Certification.Aircraft_Name.Attributes.type = char(table2array(value(p==1,1)));
    p = strcmp('Designer', label);
    Aircraft.Certification.Aircraft_Name.Attributes.designer = char(table2array(value(p==1,1)));
    p = strcmp('Regulation',label);
    Aircraft.Certification.Regulation.value = char(table2array(value(p==1,1)));
    p = strcmp('Date',label);
    Aircraft.Certification.Regulation.Attributes.date = char(table2array(value(p==1,1)));
    p = strcmp('Amendment',label);
    Aircraft.Certification.Regulation.Attributes.amendment = char(table2array(value(p==1,1)));
    p = strcmp('Airloads_flag', label);
    Aircraft.Certification.Attributes.airload_case.value = char(table2array(value(p==1,1)));
    p = strcmp('nmax', label); 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('nmin', label); 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.nmin.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.Flightloads.nmin.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % AIRCRAFT INPUTS
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % AERODYNAMIC MODEL 
    % ---------------------------------------------------------------------
    p = strcmp('Interpolation_flag', label); 
    Aircraft.Certification.Aerodynamic_data.Interpolation_flag.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.Interpolation_flag.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Max_lift_coefficient_clean', label); 
    Aircraft.Certification.Aerodynamic_data.CL_max_clean.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CL_max_clean.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Max_lift_coefficient_takeoff', label); 
    Aircraft.Certification.Aerodynamic_data.CL_max_takeoff.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CL_max_takeoff.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Max_lift_coefficient_landing', label); 
    Aircraft.Certification.Aerodynamic_data.CL_max_landing.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CL_max_landing.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Inverted_lift_coefficient', label); 
    Aircraft.Certification.Aerodynamic_data.CL_max_inverted.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CL_max_inverted.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('CLstar_lift_coefficient', label); 
    Aircraft.Certification.Aerodynamic_data.CL_star.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CL_star.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('CM_landing_gear', label);
    Aircraft.Certification.Aerodynamic_data.CM_landing_gear.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.CM_landing_gear.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('wing_body_aoa', label);
    Aircraft.Certification.Aerodynamic_data.alfa_wb.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.alfa_wb.value = str2num(Aircraft.Certification.Aerodynamic_data.alfa_wb.value);
    Aircraft.Certification.Aerodynamic_data.alfa_wb.Attributes.unit = char(table2array(unit(p==1,1)));   
    p = strcmp('wing_body_cl', label);
    Aircraft.Certification.Aerodynamic_data.cl_wb.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.cl_wb.value = str2num(Aircraft.Certification.Aerodynamic_data.cl_wb.value);
    Aircraft.Certification.Aerodynamic_data.cl_wb.Attributes.unit = char(table2array(unit(p==1,1)));   
    p = strcmp('wing_body_cm', label);
    Aircraft.Certification.Aerodynamic_data.cm_wb.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.cm_wb.value = str2num(Aircraft.Certification.Aerodynamic_data.cm_wb.value);
    Aircraft.Certification.Aerodynamic_data.cm_wb.Attributes.unit = char(table2array(unit(p==1,1)));   
    p = strcmp('wing_body_cd', label);
    Aircraft.Certification.Aerodynamic_data.cd_wb.value = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Aerodynamic_data.cd_wb.value = str2num(Aircraft.Certification.Aerodynamic_data.cd_wb.value);
    Aircraft.Certification.Aerodynamic_data.cd_wb.Attributes.unit = char(table2array(unit(p==1,1)));   
    % ---------------------------------------------------------------------
    % AERODYNAMIC MODEL 
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % AIRCRAFT MASS
    % ---------------------------------------------------------------------
    p = strcmp('Max_Takeoff_Mass', label); 
    Aircraft.Mass.Max_Takeoff_Mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Max_Takeoff_Mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Empty_Mass', label); 
    Aircraft.Mass.Empty_Mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Empty_Mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Useful_Mass', label); 
    Aircraft.Mass.Useful_Mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Useful_Mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Fuel_Mass', label); 
    Aircraft.Mass.Fuel_Mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Fuel_Mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Crew_Mass', label); 
    Aircraft.Mass.Crew_Mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Crew_Mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Oil_mass', label); 
    Aircraft.Mass.Oil_mass.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Oil_mass.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Inertia_moment_Y', label); 
    Aircraft.Inertia.Iy.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Inertia.Iy.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('n_Mass', label);
    Aircraft.Mass.Vector_length.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Mass.Vector_length.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Max_fwd_cg', label); 
    Aircraft.Geometry.General.Max_forward_cg.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.Max_forward_cg.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('Max_aft_cg', label); 
    Aircraft.Geometry.General.Max_aft_cg.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.Max_aft_cg.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('wing_xac', label); 
    Aircraft.Geometry.General.xac.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.xac.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_up_bcg', label); 
    Aircraft.Geometry.General.max_up_bCG.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_up_bCG.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_down_bcg', label); 
    Aircraft.Geometry.General.max_down_bCG.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_down_bCG.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('lift_horizontal_component_arm', label); 
    Aircraft.Geometry.General.bCG.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.bCG.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_fwd_ac', label); 
    Aircraft.Geometry.General.max_forward_xac.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_forward_xac.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_aft_ac', label); 
    Aircraft.Geometry.General.max_aft_xac.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_aft_xac.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('thrust_line', label); 
    Aircraft.Geometry.General.h_thrust.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.h_thrust.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_up_thrust_line', label); 
    Aircraft.Geometry.General.max_up_h_thrust.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_up_h_thrust.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_down_thrust_line', label); 
    Aircraft.Geometry.General.max_down_h_thrust.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Geometry.General.max_down_h_thrust.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % AIRCRAFT MASS
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % STANDARD ATMOSPHERE
    % ---------------------------------------------------------------------
    p = strcmp('sea_level', label); 
    Aircraft.Standard_atmosphere.Sea_level.h.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Standard_atmosphere.Sea_level.h.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('operative_ceiling', label); 
    Aircraft.Standard_atmosphere.Operative_ceiling.h.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Standard_atmosphere.Operative_ceiling.h.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('theoretical_ceiling', label); 
    Aircraft.Standard_atmosphere.Theoretical_ceiling.h.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Standard_atmosphere.Theoretical_ceiling.h.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % STANDARD ATMOSPHERE
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % CONSTANT VALUES
    % ---------------------------------------------------------------------
    p = strcmp('gravity_acceleration', label);
    Aircraft.Constant_values.g.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Constant_values.g.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('gust_speed_cruise', label);
    Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('gust_speed_dive', label);
    Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % CONSTANT VALUES
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % DESIGN AIRSPEED
    % ---------------------------------------------------------------------
    p = strcmp('Min_design_cruise_airspeed', label);
    Aircraft.Performance.Min_design_cruise_airspeed.value = str2double(table2array(value(p==1, 1)));
    Aircraft.Performance.Min_design_cruise_airspeed.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % DESIGN AIRSPEED
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % HORIZONTAL TAIL LOADS 
    % ---------------------------------------------------------------------
    p = strcmp('time_step', label);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_step.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_step.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('time_interval', label);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_interval.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_interval.Attributes.unit = char(table2array(unit(p==1, 1)));
    
    % DEFINE A TIME VECTOR
    time_step     = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_step.value;
    time_interval = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_interval.value;
    t_in          = 0.0;
    t_fin         = time_interval * time_step;
    time_vector   = linspace(t_in, t_fin, time_interval)';
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_vector.value           = time_vector; 
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.time_vector.Attributes.unit = "s";
    
    p = strcmp('damping_factor', label);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_factor.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_factor.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('elevator_clalfa', label); 
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_rad.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_rad.Attributes.unit = char(table2array(unit(p==1, 1)));
    elevator_clalfa_rad = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_rad.value;
    elevator_clalfa_deg = elevator_clalfa_rad / rad2deg(1);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_deg.value           = elevator_clalfa_deg;
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_deg.Attributes.unit = "1/deg";
    p = strcmp('elevator_cldelta', label); 
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_rad.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_rad.Attributes.unit = char(table2array(unit(p==1, 1)));
    elevator_cldelta_rad = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_clalfa_rad.value;
    elevator_cldelta_deg = elevator_cldelta_rad / rad2deg(1);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_deg.value           = elevator_cldelta_deg;
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.elevator_cldelta_deg.Attributes.unit = "1/deg";
    p = strcmp('damping_angle_deltav_VA', label);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_rad.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_rad.Attributes.unit = char(table2array(unit(p==1, 1)));
    damping_angle_rad = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_rad.value;
    damping_angle_deg = rad2deg(damping_angle_rad);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_deg.value           = damping_angle_deg;
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Aerodynamic_data.damping_angle_deg.Attributes.unit = "deg";
    p = strcmp('type_flag', label); 
    type_flag = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.type_flag.value           = convertCharsToStrings(type_flag);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.type_flag.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('command_flag', label); 
    command_flag = char(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.command_flag.value           = convertCharsToStrings(command_flag);
    Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.command_flag.Attributes.unit = char(table2array(unit(p==1, 1)));
    % ---------------------------------------------------------------------
    % HORIZONTAL TAIL LOADS
    % ---------------------------------------------------------------------
    % ---------------------------------------------------------------------
    % VERTICAL TAIL LOADS 
    % ---------------------------------------------------------------------
    p = strcmp('CN_deltar', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_deltar.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_deltar.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('CN_beta', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_beta.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_beta.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('rad_of_gyr_vt', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.radius_of_gyration.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.radius_of_gyration.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_delta_rudder', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_delta_rudder.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_delta_rudder.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('max_yaw_angle', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_yaw_angle.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_yaw_angle.Attributes.unit = char(table2array(unit(p==1, 1)));
    p = strcmp('sideslip_angle', label); 
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.sideslip_angle.value           = str2double(table2array(value(p==1, 1)));
    Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.sideslip_angle.Attributes.unit = char(table2array(unit(p==1, 1)));
end

% % CHECKING AERODYNAMIC VALUES
% if  Aircraft.Certification.Aerodynamic_data.alfa_wb.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'alfa_wb');
% end  
% if  Aircraft.Certification.Aerodynamic_data.cl_wb.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'cl_wb');
% end  
% if  Aircraft.Certification.Aerodynamic_data.cm_wb.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'cm_wb');
% end  
% if  Aircraft.Certification.Aerodynamic_data.cd_wb.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'cd_wb');
% end  
% if  Aircraft.Certification.Aerodynamic_data.CL_max_clean.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'CL_max_clean');
% end  
% if  Aircraft.Certification.Aerodynamic_data.CL_max_takeoff.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'CL_max_takeoff');
% end  
% if  Aircraft.Certification.Aerodynamic_data.CL_max_landing.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'CL_max_landing');
% end  
% if  Aircraft.Certification.Aerodynamic_data.CL_star.value == 0
%     Aircraft.Certification.Aerodynamic_data = rmfield(Aircraft.Certification.Aerodynamic_data,'CL_star');
% end  