
%% CLASS aero_model CALLING
obj1 = aero_model;

%% Initialization - STRAIGHT FLIGHT

            % FROM 0 TO S
            CL_from0toS     = ones(numb, n_Mass);
            alfa_from0toS   = ones(numb, n_Mass); 
            CD_from0toS     = ones(numb, n_Mass); 
            q_from0toS      = ones(numb, n_Mass); 
            CM_CL_from0toS  = ones(numb, n_Mass);
            CM_CD_from0toS  = ones(numb, n_Mass);
            CM_CT_from0toS  = ones(numb, n_Mass);
            CM_CG_from0toS  = ones(numb, n_Mass);
            CL_ht_from0toS  = ones(numb, n_Mass);
            CL_new_from0toS = ones(numb, n_Mass);
            L_wb_from0toS   = ones(numb, n_Mass);
            L_new_from0toS  = ones(numb, n_Mass);
            L_ht_from0toS   = ones(numb, n_Mass);
            
            % FROM S TO A
            CL_fromStoA     = ones(numb, n_Mass);
            alfa_fromStoA   = ones(numb, n_Mass); 
            CD_fromStoA     = ones(numb, n_Mass); 
            q_fromStoA      = ones(numb, n_Mass); 
            CM_CL_fromStoA  = ones(numb, n_Mass);
            CM_CD_fromStoA  = ones(numb, n_Mass);
            CM_CT_fromStoA  = ones(numb, n_Mass);
            CM_CG_fromStoA  = ones(numb, n_Mass);
            CL_ht_fromStoA  = ones(numb, n_Mass);
            CL_new_fromStoA = ones(numb, n_Mass);
            L_wb_fromStoA   = ones(numb, n_Mass);
            L_new_fromStoA  = ones(numb, n_Mass);
            L_ht_fromStoA   = ones(numb, n_Mass);
            
            % FROM A TO GUST1
            CL_fromAtoGust1     = ones(numb, n_Mass);
            alfa_fromAtoGust1   = ones(numb, n_Mass); 
            CD_fromAtoGust1     = ones(numb, n_Mass); 
            q_fromAtoGust1      = ones(numb, n_Mass); 
            CM_CL_fromAtoGust1  = ones(numb, n_Mass);
            CM_CD_fromAtoGust1  = ones(numb, n_Mass);
            CM_CT_fromAtoGust1  = ones(numb, n_Mass);
            CM_CG_fromAtoGust1  = ones(numb, n_Mass);
            CL_ht_fromAtoGust1  = ones(numb, n_Mass);
            CL_new_fromAtoGust1 = ones(numb, n_Mass);
            L_wb_fromAtoGust1   = ones(numb, n_Mass);
            L_new_fromAtoGust1  = ones(numb, n_Mass);
            L_ht_fromAtoGust1   = ones(numb, n_Mass);
            
            % FROM GUST1 TO C
            CL_fromGust1toC     = ones(numb, n_Mass);
            alfa_fromGust1toC   = ones(numb, n_Mass); 
            CD_fromGust1toC     = ones(numb, n_Mass); 
            q_fromGust1toC      = ones(numb, n_Mass); 
            CM_CL_fromGust1toC  = ones(numb, n_Mass);
            CM_CD_fromGust1toC  = ones(numb, n_Mass);
            CM_CT_fromGust1toC  = ones(numb, n_Mass);
            CM_CG_fromGust1toC  = ones(numb, n_Mass);
            CL_ht_fromGust1toC  = ones(numb, n_Mass);
            CL_new_fromGust1toC = ones(numb, n_Mass);
            L_wb_fromGust1toC   = ones(numb, n_Mass);
            L_new_fromGust1toC  = ones(numb, n_Mass);
            L_ht_fromGust1toC   = ones(numb, n_Mass);

            % FROM C TO GUST2
            CL_fromCtoGust2     = ones(numb, n_Mass);
            alfa_fromCtoGust2   = ones(numb, n_Mass); 
            CD_fromCtoGust2     = ones(numb, n_Mass); 
            q_fromCtoGust2      = ones(numb, n_Mass); 
            CM_CL_fromCtoGust2  = ones(numb, n_Mass);
            CM_CD_fromCtoGust2  = ones(numb, n_Mass);
            CM_CT_fromCtoGust2  = ones(numb, n_Mass);
            CM_CG_fromCtoGust2  = ones(numb, n_Mass);
            CL_ht_fromCtoGust2  = ones(numb, n_Mass);
            CL_new_fromCtoGust2 = ones(numb, n_Mass);
            L_wb_fromCtoGust2   = ones(numb, n_Mass);
            L_new_fromCtoGust2  = ones(numb, n_Mass);
            L_ht_fromCtoGust2   = ones(numb, n_Mass);
            
            % FROM GUST2 TO D
            CL_fromGust2toD     = ones(numb, n_Mass);
            alfa_fromGust2toD   = ones(numb, n_Mass); 
            CD_fromGust2toD     = ones(numb, n_Mass); 
            q_fromGust2toD      = ones(numb, n_Mass); 
            CM_CL_fromGust2toD  = ones(numb, n_Mass);
            CM_CD_fromGust2toD  = ones(numb, n_Mass);
            CM_CT_fromGust2toD  = ones(numb, n_Mass);
            CM_CG_fromGust2toD  = ones(numb, n_Mass);
            CL_ht_fromGust2toD  = ones(numb, n_Mass);
            CL_new_fromGust2toD = ones(numb, n_Mass);
            L_wb_fromGust2toD   = ones(numb, n_Mass);
            L_new_fromGust2toD  = ones(numb, n_Mass);
            L_ht_fromGust2toD   = ones(numb, n_Mass);
            
            % FROM D TO 0 
            CL_fromDto0     = ones(numb, n_Mass);
            alfa_fromDto0   = ones(numb, n_Mass); 
            CD_fromDto0     = ones(numb, n_Mass); 
            q_fromDto0      = ones(numb, n_Mass); 
            CM_CL_fromDto0  = ones(numb, n_Mass);
            CM_CD_fromDto0  = ones(numb, n_Mass);
            CM_CT_fromDto0  = ones(numb, n_Mass);
            CM_CG_fromDto0  = ones(numb, n_Mass);
            CL_ht_fromDto0  = ones(numb, n_Mass);
            CL_new_fromDto0 = ones(numb, n_Mass);
            L_wb_fromDto0   = ones(numb, n_Mass);
            L_new_fromDto0  = ones(numb, n_Mass);
            L_ht_fromDto0   = ones(numb, n_Mass);
            
            % FROM C TO D 
            CL_fromCtoD     = ones(numb, n_Mass);
            alfa_fromCtoD   = ones(numb, n_Mass); 
            CD_fromCtoD     = ones(numb, n_Mass); 
            q_fromCtoD      = ones(numb, n_Mass); 
            CM_CL_fromCtoD  = ones(numb, n_Mass);
            CM_CD_fromCtoD  = ones(numb, n_Mass);
            CM_CT_fromCtoD  = ones(numb, n_Mass);
            CM_CG_fromCtoD  = ones(numb, n_Mass);
            CL_ht_fromCtoD  = ones(numb, n_Mass);
            CL_new_fromCtoD = ones(numb, n_Mass);
            L_wb_fromCtoD   = ones(numb, n_Mass);
            L_new_fromCtoD  = ones(numb, n_Mass);
            L_ht_fromCtoD   = ones(numb, n_Mass);
            
            % FROM A TO C 
            CL_fromAtoC     = ones(numb, n_Mass);
            alfa_fromAtoC   = ones(numb, n_Mass); 
            CD_fromAtoC     = ones(numb, n_Mass); 
            q_fromAtoC      = ones(numb, n_Mass); 
            CM_CL_fromAtoC  = ones(numb, n_Mass);
            CM_CD_fromAtoC  = ones(numb, n_Mass);
            CM_CT_fromAtoC  = ones(numb, n_Mass);
            CM_CG_fromAtoC  = ones(numb, n_Mass);
            CL_ht_fromAtoC  = ones(numb, n_Mass);
            CL_new_fromAtoC = ones(numb, n_Mass);
            L_wb_fromAtoC   = ones(numb, n_Mass);
            L_new_fromAtoC  = ones(numb, n_Mass);
            L_ht_fromAtoC   = ones(numb, n_Mass);
            
            % UNIT LOAD FACTOR 
            V_unit_load_factor      = ones(numb, n_Mass);
            CL_unit_load_factor     = ones(numb, n_Mass);
            alfa_unit_load_factor   = ones(numb, n_Mass);
            CD_unit_load_factor     = ones(numb, n_Mass);
            q_unit_load_factor      = ones(numb, n_Mass);
            CM_CL_unit_load_factor  = ones(numb, n_Mass);
            CM_CD_unit_load_factor  = ones(numb, n_Mass);
            CM_CT_unit_load_factor  = ones(numb, n_Mass);
            CM_CG_unit_load_factor  = ones(numb, n_Mass);
            CL_ht_unit_load_factor  = ones(numb, n_Mass);
            CL_new_unit_load_factor = ones(numb, n_Mass);
            L_wb_unit_load_factor   = ones(numb, n_Mass);
            L_new_unit_load_factor  = ones(numb, n_Mass);
            L_ht_unit_load_factor   = ones(numb, n_Mass);

rho0              = Aircraft.Standard_atmosphere.Sea_level.rho.value;
WS                = Aircraft.Performance.Wing_loading.value;
CLmax_aero_model  = Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.value;
CL_max_inv        = Aircraft.Certification.Aerodynamic_data.CL_max_inverted.value;
CL0               = Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.value;
CM0               = Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.value;
CL_star           = Aircraft.Certification.Aerodynamic_data.CL_star.value;
CMCL              = Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.value;
p_CD              = Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.value;
CLalfa            = Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.value;
a2                = Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value(1);
b2                = Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value(2);
c2                = Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value(3);
alfa0l            = Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.value;
CM_slope          = Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.value;
S                 = Aircraft.Geometry.Wing.S.value;
S_ht              = Aircraft.Geometry.Horizontal.S.value; 
l_ht              = Aircraft.Geometry.Horizontal.l_ht.value;
l_ht_envelope     = Aircraft.Geometry.Horizontal.l_ht_envelope.value;
h_thrust_max_up   = Aircraft.Geometry.General.max_up_h_thrust.value;
h_thrust_max_down = Aircraft.Geometry.General.max_down_h_thrust.value;
h_thrust          = linspace(h_thrust_max_down, h_thrust_max_up, n_Mass)';
max_forward_xac   = Aircraft.Geometry.General.max_forward_xac.value;
max_aft_xac       = Aircraft.Geometry.General.max_aft_xac.value;
XAC               = linspace(max_forward_xac, max_aft_xac, n_Mass)';
Max_forward_cg    = Aircraft.Geometry.General.Max_forward_cg.value;
Max_aft_cg        = Aircraft.Geometry.General.Max_aft_cg.value;
XCG               = linspace(Max_forward_cg, Max_aft_cg, n_Mass)';
bCG_max_up        = Aircraft.Geometry.General.max_up_bCG.value;
bCG_max_down      = Aircraft.Geometry.General.max_down_bCG.value;
bCG               = linspace(bCG_max_up, bCG_max_down, n_Mass)';
MAC               = Aircraft.Geometry.Wing.MAC.value;
CM_landing_gear   = Aircraft.Certification.Aerodynamic_data.CM_landing_gear.value;
CL_max            = Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.value;
p_CD_wb1          = Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.value;

%% Positive straight flight
for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i))
        case "Case 1"
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM 0 TO S
            V_from0toS      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.value;
            n_from0toS      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.value;
            
            for j = 1:numb
                [CL_from0toS(j,i), alfa_from0toS(j,i), CD_from0toS(j,i), q_from0toS(j,i), ...
                 CM_CL_from0toS(j,i), CM_CD_from0toS(j,i), CM_CT_from0toS(j,i), ...
                 CM_CG_from0toS(j,i), CL_ht_from0toS(j,i), CL_new_from0toS(j,i), ...
                 L_wb_from0toS(j,i), L_new_from0toS(j,i), L_ht_from0toS(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_from0toS(j,i) , WS(i), n_from0toS(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM S TO A
            V_fromStoA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.value;
            n_fromStoA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.value;
            
            for j = 1:numb
                [CL_fromStoA(j,i), alfa_fromStoA(j,i), CD_fromStoA(j,i), q_fromStoA(j,i), ...
                 CM_CL_from0toS(j,i), CM_CD_fromStoA(j,i), CM_CT_fromStoA(j,i), ...
                 CM_CG_fromStoA(j,i), CL_ht_fromStoA(j,i), CL_new_fromStoA(j,i), ...
                 L_wb_fromStoA(j,i), L_new_fromStoA(j,i), L_ht_fromStoA(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromStoA(j,i) , WS(i), n_fromStoA(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            
            if max(npos_cruise_sea_level(:,i)) > nmax
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM A TO GUST1
                V_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value;
                n_fromAtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value;
                
                for j = 1:numb
                    [CL_fromAtoGust1(j,i), alfa_fromAtoGust1(j,i), CD_fromAtoGust1(j,i), q_fromAtoGust1(j,i), ...
                     CM_CL_fromAtoGust1(j,i), CM_CD_fromAtoGust1(j,i), CM_CT_fromAtoGust1(j,i), ...
                     CM_CG_fromAtoGust1(j,i), CL_ht_fromAtoGust1(j,i), CL_new_fromAtoGust1(j,i), ...
                     L_wb_fromAtoGust1(j,i), L_new_fromAtoGust1(j,i), L_ht_fromAtoGust1(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromAtoGust1(j,i) , WS(i), n_fromAtoGust1(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM GUST1 TO C
                V_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value;
                n_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value;
                
                for j = 1:numb
                    [CL_fromGust1toC(j,i), alfa_fromGust1toC(j,i), CD_fromGust1toC(j,i), q_fromGust1toC(j,i), ...
                     CM_CL_fromGust1toC(j,i), CM_CD_fromGust1toC(j,i), CM_CT_fromGust1toC(j,i), ...
                     CM_CG_fromGust1toC(j,i), CL_ht_fromGust1toC(j,i), CL_new_fromGust1toC(j,i), ...
                     L_wb_fromGust1toC(j,i), L_new_fromGust1toC(j,i), L_ht_fromGust1toC(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGust1toC(j,i) , WS(i), n_fromGust1toC(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM C TO GUST2
                V_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value;
                n_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value;
                
                for j = 1:numb
                    [CL_fromCtoGust2(j,i), alfa_fromCtoGust2(j,i), CD_fromCtoGust2(j,i), q_fromCtoGust2(j,i), ...
                     CM_CL_fromCtoGust2(j,i), CM_CD_fromCtoGust2(j,i), CM_CT_fromCtoGust2(j,i), ...
                     CM_CG_fromCtoGust2(j,i), CL_ht_fromCtoGust2(j,i), CL_new_fromCtoGust2(j,i), ...
                     L_wb_fromCtoGust2(j,i), L_new_fromCtoGust2(j,i), L_ht_fromCtoGust2(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromCtoGust2(j,i) , WS(i), n_fromCtoGust2(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM GUST2 TO D
                V_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value;
                n_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value;
                
                for j = 1:numb
                    [CL_fromGust2toD(j,i), alfa_fromGust2toD(j,i), CD_fromGust2toD(j,i), q_fromGust2toD(j,i), ...
                     CM_CL_fromGust2toD(j,i), CM_CD_fromGust2toD(j,i), CM_CT_fromGust2toD(j,i), ...
                     CM_CG_fromGust2toD(j,i), CL_ht_fromGust2toD(j,i), CL_new_fromGust2toD(j,i), ...
                     L_wb_fromGust2toD(j,i), L_new_fromGust2toD(j,i), L_ht_fromGust2toD(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGust2toD(j,i) , WS(i), n_fromGust2toD(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM D TO 0
                V_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value;
                n_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value;
                
                for j = 1:numb
                    [CL_fromDto0(j,i), alfa_fromDto0(j,i), CD_fromDto0(j,i), q_fromDto0(j,i), ...
                     CM_CL_fromDto0(j,i), CM_CD_fromDto0(j,i), CM_CT_fromDto0(j,i), ...
                     CM_CG_fromDto0(j,i), CL_ht_fromDto0(j,i), CL_new_fromDto0(j,i), ...
                     L_wb_fromDto0(j,i), L_new_fromDto0(j,i), L_ht_fromDto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromDto0(j,i) , WS(i), n_fromDto0(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % UNIT LOAD FACTOR CALCULATION 
                V_unit_load_factor(1,i) = VS(i); 
                for k = 2:length(V_unit_load_factor(:,i))
                    V_unit_load_factor(k,i) = V_unit_load_factor(k-1,i) + (VD(i) - VS(i))*(1/length(V_unit_load_factor(:,i)));
                end
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value           = V_unit_load_factor;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.Attributes.unit = "m/s";

                % BALANCIG AT UNIT LOAD FACTOR
                for j = 1:numb
                    [CL_unit_load_factor(j,i), alfa_unit_load_factor(j,i), CD_unit_load_factor(j,i), q_unit_load_factor(j,i), ...
                     CM_CL_unit_load_factor(j,i), CM_CD_unit_load_factor(j,i), CM_CT_unit_load_factor(j,i), ...
                     CM_CG_unit_load_factor(j,i), CL_ht_unit_load_factor(j,i), CL_new_unit_load_factor(j,i), ...
                     L_wb_unit_load_factor(j,i), L_new_unit_load_factor(j,i), L_ht_unit_load_factor(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_unit_load_factor(j,i) , WS(i), 1, ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
            
            
            elseif max(npos_cruise_sea_level(:,i)) < nmax 
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM A TO C
                V_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoC.value;
                n_fromAtoC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoC.value;
                
                for j = 1:numb
                    [CL_fromAtoC(j,i), alfa_fromAtoC(j,i), CD_fromAtoC(j,i), q_fromAtoC(j,i), ...
                     CM_CL_fromAtoC(j,i), CM_CD_fromAtoC(j,i), CM_CT_fromAtoC(j,i), ...
                     CM_CG_fromAtoC(j,i), CL_ht_fromAtoC(j,i), CL_new_fromAtoC(j,i), ...
                     L_wb_fromAtoC(j,i), L_new_fromAtoC(j,i), L_ht_fromAtoC(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromAtoC(j,i) , WS(i), n_fromAtoC(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM C TO D
                V_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoD.value;
                n_fromCtoD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoD.value;
                
                for j = 1:numb
                    [CL_fromCtoD(j,i), alfa_fromCtoD(j,i), CD_fromCtoD(j,i), q_fromCtoD(j,i), ...
                     CM_CL_fromCtoD(j,i), CM_CD_fromCtoD(j,i), CM_CT_fromCtoD(j,i), ...
                     CM_CG_fromCtoD(j,i), CL_ht_fromCtoD(j,i), CL_new_fromCtoD(j,i), ...
                     L_wb_fromCtoD(j,i), L_new_fromCtoD(j,i), L_ht_fromCtoD(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromCtoD(j,i) , WS(i), n_fromCtoD(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM D TO 0
                V_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value;
                n_fromDto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value;
                
                for j = 1:numb
                    [CL_fromDto0(j,i), alfa_fromDto0(j,i), CD_fromDto0(j,i), q_fromDto0(j,i), ...
                     CM_CL_fromDto0(j,i), CM_CD_fromDto0(j,i), CM_CT_fromDto0(j,i), ...
                     CM_CG_fromDto0(j,i), CL_ht_fromDto0(j,i), CL_new_fromDto0(j,i), ...
                     L_wb_fromDto0(j,i), L_new_fromDto0(j,i), L_ht_fromDto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromDto0(j,i) , WS(i), n_fromDto0(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % UNIT LOAD FACTOR CALCULATION 
                V_unit_load_factor(1,i) = VS(i); 
                for k = 2:length(V_unit_load_factor(:,i))
                    V_unit_load_factor(k,i) = V_unit_load_factor(k-1,i) + (VD(i) - VS(i))*(1/length(V_unit_load_factor(:,i)));
                end
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value           = V_unit_load_factor;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.Attributes.unit = "m/s";

                % BALANCIG AT UNIT LOAD FACTOR
                for j = 1:numb
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
            
        case "Case 2"
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM 0 TO S
            V_from0toS      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.value;
            n_from0toS      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.value;
            
            for j = 1:numb
                [CL_from0toS(j,i), alfa_from0toS(j,i), CD_from0toS(j,i), q_from0toS(j,i), ...
                 CM_CL_from0toS(j,i), CM_CD_from0toS(j,i), CM_CT_from0toS(j,i), ...
                 CM_CG_from0toS(j,i), CL_ht_from0toS(j,i), CL_new_from0toS(j,i), ...
                 L_wb_from0toS(j,i), L_new_from0toS(j,i), L_ht_from0toS(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_from0toS(j,i) , WS(i), n_from0toS(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM S TO A
            V_fromStoA      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.value;
            n_fromStoA      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.value;
            
            for j = 1:numb
                [CL_fromStoA(j,i), alfa_fromStoA(j,i), CD_fromStoA(j,i), q_fromStoA(j,i), ...
                 CM_CL_fromStoA(j,i), CM_CD_fromStoA(j,i), CM_CT_fromStoA(j,i), ...
                 CM_CG_fromStoA(j,i), CL_ht_fromStoA(j,i), CL_new_fromStoA(j,i), ...
                 L_wb_fromStoA(j,i), L_new_fromStoA(j,i), L_ht_fromStoA(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromStoA(j,i) , WS(i), n_fromStoA(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM A TO GUST1
            V_fromAtoGust1      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value;
            n_fromAtoGust1      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value;
            
            for j = 1:numb
                [CL_fromAtoGust1(j,i), alfa_fromAtoGust1(j,i), CD_fromAtoGust1(j,i), q_fromAtoGust1(j,i), ...
                 CM_CL_fromAtoGust1(j,i), CM_CD_fromAtoGust1(j,i), CM_CT_fromAtoGust1(j,i), ...
                 CM_CG_fromAtoGust1(j,i), CL_ht_fromAtoGust1(j,i), CL_new_fromAtoGust1(j,i), ...
                 L_wb_fromAtoGust1(j,i), L_new_fromAtoGust1(j,i), L_ht_fromAtoGust1(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromAtoGust1(j,i) , WS(i), n_fromAtoGust1(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM GUST1 TO C
            V_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value;
            n_fromGust1toC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value;
            
            for j = 1:numb
                [CL_fromGust1toC(j,i), alfa_fromGust1toC(j,i), CD_fromGust1toC(j,i), q_fromGust1toC(j,i), ...
                 CM_CL_fromGust1toC(j,i), CM_CD_fromGust1toC(j,i), CM_CT_fromGust1toC(j,i), ...
                 CM_CG_fromGust1toC(j,i), CL_ht_fromGust1toC(j,i), CL_new_fromGust1toC(j,i), ...
                 L_wb_fromGust1toC(j,i), L_new_fromGust1toC(j,i), L_ht_fromGust1toC(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromGust1toC(j,i) , WS(i), n_fromGust1toC(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM C TO GUST2
            V_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value;
            n_fromCtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value;
            
            for j = 1:numb
                [CL_fromCtoGust2(j,i), alfa_fromCtoGust2(j,i), CD_fromCtoGust2(j,i), q_fromCtoGust2(j,i), ...
                 CM_CL_fromCtoGust2(j,i), CM_CD_fromCtoGust2(j,i), CM_CT_fromCtoGust2(j,i), ...
                 CM_CG_fromCtoGust2(j,i), CL_ht_fromCtoGust2(j,i), CL_new_fromCtoGust2(j,i), ...
                 L_wb_fromCtoGust2(j,i), L_new_fromCtoGust2(j,i), L_ht_fromCtoGust2(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromCtoGust2(j,i) , WS(i), n_fromCtoGust2(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM GUST2 TO D
            V_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value;
            n_fromGust2toD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value;
            
            for j = 1:numb
                [CL_fromGust2toD(j,i), alfa_fromGust2toD(j,i), CD_fromGust2toD(j,i), q_fromGust2toD(j,i), ...
                 CM_CL_fromGust2toD(j,i), CM_CD_fromGust2toD(j,i), CM_CT_fromGust2toD(j,i), ...
                 CM_CG_fromGust2toD(j,i), CL_ht_fromGust2toD(j,i), CL_new_fromGust2toD(j,i), ...
                 L_wb_fromGust2toD(j,i), L_new_fromGust2toD(j,i), L_ht_fromGust2toD(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromGust2toD(j,i) , WS(i), n_fromGust2toD(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % FROM D TO 0
            V_fromDto0      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value;
            n_fromDto0      = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value;
            
            for j = 1:numb
                [CL_fromDto0(j,i), alfa_fromDto0(j,i), CD_fromDto0(j,i), q_fromDto0(j,i), ...
                 CM_CL_fromDto0(j,i), CM_CD_fromDto0(j,i), CM_CT_fromDto0(j,i), ...
                 CM_CG_fromDto0(j,i), CL_ht_fromDto0(j,i), CL_new_fromDto0(j,i), ...
                 L_wb_fromDto0(j,i), L_new_fromDto0(j,i), L_ht_fromDto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromDto0(j,i) , WS(i), n_fromDto0(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            % UNIT LOAD FACTOR CALCULATION 
            V_unit_load_factor(1,i) = VS(i); 
            for k = 2:numb
                V_unit_load_factor(k,i) = V_unit_load_factor(k-1,i) + (VD(i) - VS(i))*(1/numb);
            end
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value           = V_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.Attributes.unit = "m/s";
            
            % BALANCIG AT UNIT LOAD FACTOR
            for j = 1:numb
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
end

%% STORE INSIDE THE STRUCT VARIABLE
for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i))
        case "Case 1"
            % FROM 0 TO S 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS.value                 = CL_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_deg.value           = alfa_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_rad.value           = deg2rad(alfa_from0toS); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS.value                 = CD_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS.value                  = q_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS.value              = CM_CL_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS.value              = CM_CD_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS.value              = CM_CT_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS.value              = CM_CG_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS.value              = CL_ht_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS.value             = CL_new_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS.value               = L_wb_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS.value              = L_new_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS.value               = L_ht_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS.Attributes.unit     = "daN";
            
            % FROM S TO A 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromStoA.value                 = CL_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromStoA.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_deg.value           = alfa_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_rad.value           = deg2rad(alfa_fromStoA); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromStoA.value                 = CD_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromStoA.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromStoA.value                  = q_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromStoA.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromStoA.value              = CM_CL_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromStoA.value              = CM_CD_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromStoA.value              = CM_CT_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromStoA.value              = CM_CG_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromStoA.value              = CL_ht_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromStoA.value             = CL_new_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromStoA.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromStoA.value               = L_wb_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromStoA.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromStoA.value              = L_new_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromStoA.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromStoA.value               = L_ht_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromStoA.Attributes.unit     = "daN";
            
            % FROM A TO GUST1 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromAtoGust1.value                 = CL_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromAtoGust1.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_deg.value           = alfa_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_rad.value           = deg2rad(alfa_fromAtoGust1); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromAtoGust1.value                 = CD_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromAtoGust1.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromAtoGust1.value                  = q_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromAtoGust1.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromAtoGust1.value              = CM_CL_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromAtoGust1.value              = CM_CD_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromAtoGust1.value              = CM_CT_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromAtoGust1.value              = CM_CG_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromAtoGust1.value              = CL_ht_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromAtoGust1.value             = CL_new_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromAtoGust1.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromAtoGust1.value               = L_wb_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromAtoGust1.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromAtoGust1.value              = L_new_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromAtoGust1.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromAtoGust1.value               = L_ht_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromAtoGust1.Attributes.unit     = "daN";
            
            % FROM GUST1 TO C
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toC.value                 = CL_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toC.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_deg.value           = alfa_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_rad.value           = deg2rad(alfa_fromGust1toC); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toC.value                 = CD_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toC.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toC.value                  = q_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toC.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toC.value              = CM_CL_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toC.value              = CM_CD_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toC.value              = CM_CT_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toC.value              = CM_CG_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toC.value              = CL_ht_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toC.value             = CL_new_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toC.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toC.value               = L_wb_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toC.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toC.value              = L_new_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toC.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toC.value               = L_ht_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toC.Attributes.unit     = "daN";
            
            % FROM C TO GUST2
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromCtoGust2.value                 = CL_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromCtoGust2.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_deg.value           = alfa_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_rad.value           = deg2rad(alfa_fromCtoGust2); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromCtoGust2.value                 = CD_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromCtoGust2.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromCtoGust2.value                  = q_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromCtoGust2.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromCtoGust2.value              = CM_CL_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromCtoGust2.value              = CM_CD_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromCtoGust2.value              = CM_CT_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromCtoGust2.value              = CM_CG_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromCtoGust2.value              = CL_ht_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromCtoGust2.value             = CL_new_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromCtoGust2.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromCtoGust2.value               = L_wb_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromCtoGust2.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromCtoGust2.value              = L_new_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromCtoGust2.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromCtoGust2.value               = L_ht_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromCtoGust2.Attributes.unit     = "daN";
            
            % FROM GUST2 TO D
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toD.value                 = CL_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toD.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_deg.value           = alfa_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_rad.value           = deg2rad(alfa_fromGust2toD); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toD.value                 = CD_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toD.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toD.value                  = q_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toD.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toD.value              = CM_CL_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toD.value              = CM_CD_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toD.value              = CM_CT_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toD.value              = CM_CG_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toD.value              = CL_ht_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toD.value             = CL_new_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toD.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toD.value               = L_wb_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toD.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toD.value              = L_new_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toD.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toD.value               = L_ht_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toD.Attributes.unit     = "daN";
            
            % FROM D TO 0
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromDto0.value                 = CL_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromDto0.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_deg.value           = alfa_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_rad.value           = deg2rad(alfa_fromDto0); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromDto0.value                 = CD_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromDto0.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromDto0.value                  = q_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromDto0.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromDto0.value              = CM_CL_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromDto0.value              = CM_CD_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromDto0.value              = CM_CT_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromDto0.value              = CM_CG_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromDto0.value              = CL_ht_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromDto0.value             = CL_new_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromDto0.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromDto0.value               = L_wb_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromDto0.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromDto0.value              = L_new_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromDto0.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromDto0.value               = L_ht_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromDto0.Attributes.unit     = "daN";
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            
            % UNIT LOAD FACTOR
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value                  = V_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.Attributes.unit        = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.n_unit_load_factor.value                  = ones(length(V_unit_load_factor), n_Mass);
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.n_unit_load_factor.Attributes.unit        = "g";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_unit_load_factor.value                 = CL_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_unit_load_factor.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_deg.value           = alfa_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_rad.value           = deg2rad(alfa_unit_load_factor); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_unit_load_factor.value                 = CD_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_unit_load_factor.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_unit_load_factor.value                  = q_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_unit_load_factor.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_unit_load_factor.value              = CM_CL_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_unit_load_factor.value              = CM_CD_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_unit_load_factor.value              = CM_CT_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_unit_load_factor.value              = CM_CG_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_unit_load_factor.value              = CL_ht_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_unit_load_factor.value             = CL_new_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_unit_load_factor.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_unit_load_factor.value               = L_wb_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_unit_load_factor.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_unit_load_factor.value              = L_new_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_funit_load_factor.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_unit_load_factor.value               = L_ht_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_unit_load_factor.Attributes.unit     = "daN";
            % ----------------------------------------------------------------------------------------------------------------------------------------------
        case "Case 2"
            % FROM 0 TO S 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS.value                 = CL_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_deg.value           = alfa_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_rad.value           = deg2rad(alfa_from0toS); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS.value                 = CD_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS.value                  = q_from0toS; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS.value              = CM_CL_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS.value              = CM_CD_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS.value              = CM_CT_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS.value              = CM_CG_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS.value              = CL_ht_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS.value             = CL_new_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS.value               = L_wb_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS.value              = L_new_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS.value               = L_ht_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS.Attributes.unit     = "daN";
            
            % FROM S TO A 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromStoA.value                 = CL_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromStoA.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_deg.value           = alfa_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_rad.value           = deg2rad(alfa_fromStoA); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromStoA_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromStoA.value                 = CD_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromStoA.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromStoA.value                  = q_fromStoA; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromStoA.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromStoA.value              = CM_CL_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromStoA.value              = CM_CD_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromStoA.value              = CM_CT_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromStoA.value              = CM_CG_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromStoA.value              = CL_ht_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromStoA.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromStoA.value             = CL_new_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromStoA.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromStoA.value               = L_wb_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromStoA.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromStoA.value              = L_new_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromStoA.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromStoA.value               = L_ht_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromStoA.Attributes.unit     = "daN";
            
            % FROM A TO GUST1 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromAtoGust1.value                 = CL_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromAtoGust1.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_deg.value           = alfa_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_rad.value           = deg2rad(alfa_fromAtoGust1); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromAtoGust1_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromAtoGust1.value                 = CD_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromAtoGust1.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromAtoGust1.value                  = q_fromAtoGust1; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromAtoGust1.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromAtoGust1.value              = CM_CL_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromAtoGust1.value              = CM_CD_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromAtoGust1.value              = CM_CT_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromAtoGust1.value              = CM_CG_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromAtoGust1.value              = CL_ht_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromAtoGust1.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromAtoGust1.value             = CL_new_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromAtoGust1.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromAtoGust1.value               = L_wb_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromAtoGust1.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromAtoGust1.value              = L_new_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromAtoGust1.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromAtoGust1.value               = L_ht_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromAtoGust1.Attributes.unit     = "daN";
            
            % FROM GUST1 TO C
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toC.value                 = CL_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toC.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_deg.value           = alfa_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_rad.value           = deg2rad(alfa_fromGust1toC); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toC_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toC.value                 = CD_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toC.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toC.value                  = q_fromGust1toC; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toC.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toC.value              = CM_CL_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toC.value              = CM_CD_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toC.value              = CM_CT_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toC.value              = CM_CG_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toC.value              = CL_ht_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toC.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toC.value             = CL_new_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toC.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toC.value               = L_wb_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toC.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toC.value              = L_new_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toC.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toC.value               = L_ht_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toC.Attributes.unit     = "daN";
            
            % FROM C TO GUST2
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromCtoGust2.value                 = CL_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromCtoGust2.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_deg.value           = alfa_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_rad.value           = deg2rad(alfa_fromCtoGust2); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromCtoGust2_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromCtoGust2.value                 = CD_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromCtoGust2.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromCtoGust2.value                  = q_fromCtoGust2; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromCtoGust2.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromCtoGust2.value              = CM_CL_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromCtoGust2.value              = CM_CD_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromCtoGust2.value              = CM_CT_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromCtoGust2.value              = CM_CG_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromCtoGust2.value              = CL_ht_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromCtoGust2.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromCtoGust2.value             = CL_new_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromCtoGust2.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromCtoGust2.value               = L_wb_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromCtoGust2.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromCtoGust2.value              = L_new_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromCtoGust2.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromCtoGust2.value               = L_ht_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromCtoGust2.Attributes.unit     = "daN";
            
            % FROM GUST2 TO D
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toD.value                 = CL_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toD.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_deg.value           = alfa_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_rad.value           = deg2rad(alfa_fromGust2toD); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toD_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toD.value                 = CD_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toD.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toD.value                  = q_fromGust2toD; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toD.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toD.value              = CM_CL_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toD.value              = CM_CD_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toD.value              = CM_CT_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toD.value              = CM_CG_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toD.value              = CL_ht_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toD.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toD.value             = CL_new_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toD.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toD.value               = L_wb_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toD.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toD.value              = L_new_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toD.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toD.value               = L_ht_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toD.Attributes.unit     = "daN";
            
            % FROM D TO 0
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromDto0.value                 = CL_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromDto0.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_deg.value           = alfa_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_rad.value           = deg2rad(alfa_fromDto0); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromDto0_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromDto0.value                 = CD_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromDto0.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromDto0.value                  = q_fromDto0; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromDto0.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromDto0.value              = CM_CL_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromDto0.value              = CM_CD_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromDto0.value              = CM_CT_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromDto0.value              = CM_CG_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromDto0.value              = CL_ht_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromDto0.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromDto0.value             = CL_new_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromDto0.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromDto0.value               = L_wb_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromDto0.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromDto0.value              = L_new_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromDto0.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromDto0.value               = L_ht_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromDto0.Attributes.unit     = "daN";
            % ----------------------------------------------------------------------------------------------------------------------------------------------
            
            % UNIT LOAD FACTOR
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.value                  = V_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.V_unit_load_factor.Attributes.unit        = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.n_unit_load_factor.value                  = ones(length(V_unit_load_factor), n_Mass);
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.n_unit_load_factor.Attributes.unit        = "g";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_unit_load_factor.value                 = CL_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_unit_load_factor.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_deg.value           = alfa_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_deg.Attributes.unit = "deg";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_rad.value           = deg2rad(alfa_unit_load_factor); 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_unit_load_factor_rad.Attributes.unit = "rad";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_unit_load_factor.value                 = CD_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_unit_load_factor.Attributes.unit       = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_unit_load_factor.value                  = q_unit_load_factor; 
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_unit_load_factor.Attributes.unit        = "Pa";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_unit_load_factor.value              = CM_CL_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_unit_load_factor.value              = CM_CD_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_unit_load_factor.value              = CM_CT_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_unit_load_factor.value              = CM_CG_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_unit_load_factor.value              = CL_ht_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_unit_load_factor.Attributes.unit    = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_unit_load_factor.value             = CL_new_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_unit_load_factor.Attributes.unit   = "Non dimensional";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_unit_load_factor.value               = L_wb_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_unit_load_factor.Attributes.unit     = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_unit_load_factor.value              = L_new_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_funit_load_factor.Attributes.unit    = "daN";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_unit_load_factor.value               = L_ht_unit_load_factor;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_unit_load_factor.Attributes.unit     = "daN";
            % ----------------------------------------------------------------------------------------------------------------------------------------------
    end
end

%% Initialization - INVERTED FLIGHT

            % FROM 0 TO S INVERTED
            CL_from0toS_inv     = ones(numb, n_Mass);
            alfa_from0toS_inv   = ones(numb, n_Mass); 
            CD_from0toS_inv     = ones(numb, n_Mass); 
            q_from0toS_inv      = ones(numb, n_Mass); 
            CM_CL_from0toS_inv  = ones(numb, n_Mass);
            CM_CD_from0toS_inv  = ones(numb, n_Mass);
            CM_CT_from0toS_inv  = ones(numb, n_Mass);
            CM_CG_from0toS_inv  = ones(numb, n_Mass);
            CL_ht_from0toS_inv  = ones(numb, n_Mass);
            CL_new_from0toS_inv = ones(numb, n_Mass);
            L_wb_from0toS_inv   = ones(numb, n_Mass);
            L_new_from0toS_inv  = ones(numb, n_Mass);
            L_ht_from0toS_inv   = ones(numb, n_Mass);
            
            % FROM S INVERTED TO G
            CL_fromS_invtoG     = ones(numb, n_Mass);
            alfa_fromS_invtoG   = ones(numb, n_Mass); 
            CD_fromS_invtoG     = ones(numb, n_Mass); 
            q_fromS_invtoG      = ones(numb, n_Mass); 
            CM_CL_fromS_invtoG  = ones(numb, n_Mass);
            CM_CD_fromS_invtoG  = ones(numb, n_Mass);
            CM_CT_fromS_invtoG  = ones(numb, n_Mass);
            CM_CG_fromS_invtoG  = ones(numb, n_Mass);
            CL_ht_fromS_invtoG  = ones(numb, n_Mass);
            CL_new_fromS_invtoG = ones(numb, n_Mass);
            L_wb_fromS_invtoG   = ones(numb, n_Mass);
            L_new_fromS_invtoG  = ones(numb, n_Mass);
            L_ht_fromS_invtoG   = ones(numb, n_Mass);
            
            % FROM G TO GUST1
            CL_fromGtoGust1     = ones(numb, n_Mass);
            alfa_fromGtoGust1   = ones(numb, n_Mass); 
            CD_fromGtoGust1     = ones(numb, n_Mass); 
            q_fromGtoGust1      = ones(numb, n_Mass); 
            CM_CL_fromGtoGust1  = ones(numb, n_Mass);
            CM_CD_fromGtoGust1  = ones(numb, n_Mass);
            CM_CT_fromGtoGust1  = ones(numb, n_Mass);
            CM_CG_fromGtoGust1  = ones(numb, n_Mass);
            CL_ht_fromGtoGust1  = ones(numb, n_Mass);
            CL_new_fromGtoGust1 = ones(numb, n_Mass);
            L_wb_fromGtoGust1   = ones(numb, n_Mass);
            L_new_fromGtoGust1  = ones(numb, n_Mass);
            L_ht_fromGtoGust1   = ones(numb, n_Mass);
            
            % FROM GUST1 TO F
            CL_fromGust1toF     = ones(numb, n_Mass);
            alfa_fromGust1toF   = ones(numb, n_Mass); 
            CD_fromGust1toF     = ones(numb, n_Mass); 
            q_fromGust1toF      = ones(numb, n_Mass); 
            CM_CL_fromGust1toF  = ones(numb, n_Mass);
            CM_CD_fromGust1toF  = ones(numb, n_Mass);
            CM_CT_fromGust1toF  = ones(numb, n_Mass);
            CM_CG_fromGust1toF  = ones(numb, n_Mass);
            CL_ht_fromGust1toF  = ones(numb, n_Mass);
            CL_new_fromGust1toF = ones(numb, n_Mass);
            L_wb_fromGust1toF   = ones(numb, n_Mass);
            L_new_fromGust1toF  = ones(numb, n_Mass);
            L_ht_fromGust1toF   = ones(numb, n_Mass);

            % FROM F TO GUST2
            CL_fromFtoGust2     = ones(numb, n_Mass);
            alfa_fromFtoGust2   = ones(numb, n_Mass); 
            CD_fromFtoGust2     = ones(numb, n_Mass); 
            q_fromFtoGust2      = ones(numb, n_Mass); 
            CM_CL_fromFtoGust2  = ones(numb, n_Mass);
            CM_CD_fromFtoGust2  = ones(numb, n_Mass);
            CM_CT_fromFtoGust2  = ones(numb, n_Mass);
            CM_CG_fromFtoGust2  = ones(numb, n_Mass);
            CL_ht_fromFtoGust2  = ones(numb, n_Mass);
            CL_new_fromFtoGust2 = ones(numb, n_Mass);
            L_wb_fromFtoGust2   = ones(numb, n_Mass);
            L_new_fromFtoGust2  = ones(numb, n_Mass);
            L_ht_fromFtoGust2   = ones(numb, n_Mass);
            
            % FROM GUST2 TO E
            CL_fromGust2toE     = ones(numb, n_Mass);
            alfa_fromGust2toE   = ones(numb, n_Mass); 
            CD_fromGust2toE     = ones(numb, n_Mass); 
            q_fromGust2toE      = ones(numb, n_Mass); 
            CM_CL_fromGust2toE  = ones(numb, n_Mass);
            CM_CD_fromGust2toE  = ones(numb, n_Mass);
            CM_CT_fromGust2toE  = ones(numb, n_Mass);
            CM_CG_fromGust2toE  = ones(numb, n_Mass);
            CL_ht_fromGust2toE  = ones(numb, n_Mass);
            CL_new_fromGust2toE = ones(numb, n_Mass);
            L_wb_fromGust2toE   = ones(numb, n_Mass);
            L_new_fromGust2toE  = ones(numb, n_Mass);
            L_ht_fromGust2toE   = ones(numb, n_Mass);
            
            % FROM E TO 0 
            CL_fromEto0     = ones(numb, n_Mass);
            alfa_fromEto0   = ones(numb, n_Mass); 
            CD_fromEto0     = ones(numb, n_Mass); 
            q_fromEto0      = ones(numb, n_Mass); 
            CM_CL_fromEto0  = ones(numb, n_Mass);
            CM_CD_fromEto0  = ones(numb, n_Mass);
            CM_CT_fromEto0  = ones(numb, n_Mass);
            CM_CG_fromEto0  = ones(numb, n_Mass);
            CL_ht_fromEto0  = ones(numb, n_Mass);
            CL_new_fromEto0 = ones(numb, n_Mass);
            L_wb_fromEto0   = ones(numb, n_Mass);
            L_new_fromEto0  = ones(numb, n_Mass);
            L_ht_fromEto0   = ones(numb, n_Mass);
            
            % FROM F TO E 
            CL_fromFtoE     = ones(numb, n_Mass);
            alfa_fromFtoE   = ones(numb, n_Mass); 
            CD_fromFtoE     = ones(numb, n_Mass); 
            q_fromFtoE      = ones(numb, n_Mass); 
            CM_CL_fromFtoE  = ones(numb, n_Mass);
            CM_CD_fromFtoE  = ones(numb, n_Mass);
            CM_CT_fromFtoE  = ones(numb, n_Mass);
            CM_CG_fromFtoE  = ones(numb, n_Mass);
            CL_ht_fromFtoE  = ones(numb, n_Mass);
            CL_new_fromFtoE = ones(numb, n_Mass);
            L_wb_fromFtoE   = ones(numb, n_Mass);
            L_new_fromFtoE  = ones(numb, n_Mass);
            L_ht_fromFtoE   = ones(numb, n_Mass);
            
            % FROM G TO F 
            CL_fromGtoF     = ones(numb, n_Mass);
            alfa_fromGtoF   = ones(numb, n_Mass); 
            CD_fromGtoF     = ones(numb, n_Mass); 
            q_fromGtoF      = ones(numb, n_Mass); 
            CM_CL_fromGtoF  = ones(numb, n_Mass);
            CM_CD_fromGtoF  = ones(numb, n_Mass);
            CM_CT_fromGtoF  = ones(numb, n_Mass);
            CM_CG_fromGtoF  = ones(numb, n_Mass);
            CL_ht_fromGtoF  = ones(numb, n_Mass);
            CL_new_fromGtoF = ones(numb, n_Mass);
            L_wb_fromGtoF   = ones(numb, n_Mass);
            L_new_fromGtoF  = ones(numb, n_Mass);
            L_ht_fromGtoF   = ones(numb, n_Mass);

%% Negative inverted flight
for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(i))
        case "Case 2"
            if abs(min(nneg_cruise_sea_level(:,i))) > abs(nmin)  
                
                % FROM 0 TO S INVERTED 
                n_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value;
                V_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value; 
                
                for j = 1:numb
                    [CL_from0toS_inv(j,i), alfa_from0toS_inv(j,i), CD_from0toS_inv(j,i), q_from0toS_inv(j,i), ...
                     CM_CL_from0toS_inv(j,i), CM_CD_from0toS_inv(j,i), CM_CT_from0toS_inv(j,i), ...
                     CM_CG_from0toS_inv(j,i), CL_ht_from0toS_inv(j,i), CL_new_from0toS_inv(j,i), ...
                     L_wb_from0toS_inv(j,i), L_new_from0toS_inv(j,i), L_ht_from0toS_inv(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_from0toS_inv(j,i) , WS(i), n_from0toS_inv(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM S INVERTED TO G 
                n_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value; 
                V_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value;
                
                for j = 1:numb
                    [CL_fromS_invtoG(j,i), alfa_fromS_invtoG(j,i), CD_fromS_invtoG(j,i), q_fromS_invtoG(j,i), ...
                     CM_CL_fromS_invtoG(j,i), CM_CD_fromS_invtoG(j,i), CM_CT_fromS_invtoG(j,i), ...
                     CM_CG_fromS_invtoG(j,i), CL_ht_fromS_invtoG(j,i), CL_new_fromS_invtoG(j,i), ...
                     L_wb_fromS_invtoG(j,i), L_new_fromS_invtoG(j,i), L_ht_fromS_invtoG(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromS_invtoG(j,i) , WS(i), n_fromS_invtoG(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM G TO GUST1 
                n_fromGtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoGust1.value;
                V_fromGtoGust1 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoGust1.value;
                
                for j = 1:numb
                    [CL_fromGtoGust1(j,i), alfa_fromGtoGust1(j,i), CD_fromGtoGust1(j,i), q_fromGtoGust1(j,i), ...
                     CM_CL_fromGtoGust1(j,i), CM_CD_fromGtoGust1(j,i), CM_CT_fromGtoGust1(j,i), ...
                     CM_CG_fromGtoGust1(j,i), CL_ht_fromGtoGust1(j,i), CL_new_fromGtoGust1(j,i), ...
                     L_wb_fromGtoGust1(j,i), L_new_fromGtoGust1(j,i), L_ht_fromGtoGust1(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGtoGust1(j,i) , WS(i), n_fromGtoGust1(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM GUST1 TO F 
                n_fromGust1toF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toF.value;
                V_fromGust1toF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toF.value;
                
                for j = 1:numb
                    [CL_fromGust1toF(j,i), alfa_fromGust1toF(j,i), CD_fromGust1toF(j,i), q_fromGust1toF(j,i), ...
                     CM_CL_fromGust1toF(j,i), CM_CD_fromGust1toF(j,i), CM_CT_fromGust1toF(j,i), ...
                     CM_CG_fromGust1toF(j,i), CL_ht_fromGust1toF(j,i), CL_new_fromGust1toF(j,i), ...
                     L_wb_fromGust1toF(j,i), L_new_fromGust1toF(j,i), L_ht_fromGust1toF(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGust1toF(j,i) , WS(i), n_fromGust1toF(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM F TO GUST2
                n_fromFtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoGust2.value;
                V_fromFtoGust2 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoGust2.value;  
                
                for j = 1:numb
                    [CL_fromFtoGust2(j,i), alfa_fromFtoGust2(j,i), CD_fromFtoGust2(j,i), q_fromFtoGust2(j,i), ...
                     CM_CL_fromFtoGust2(j,i), CM_CD_fromFtoGust2(j,i), CM_CT_fromFtoGust2(j,i), ...
                     CM_CG_fromFtoGust2(j,i), CL_ht_fromFtoGust2(j,i), CL_new_fromFtoGust2(j,i), ...
                     L_wb_fromFtoGust2(j,i), L_new_fromFtoGust2(j,i), L_ht_fromFtoGust2(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromFtoGust2(j,i) , WS(i), n_fromFtoGust2(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM GUST2 TO E 
                n_fromGust2toE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toE.value;
                V_fromGust2toE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toE.value;
                
                for j = 1:numb
                    [CL_fromGust2toE(j,i), alfa_fromGust2toE(j,i), CD_fromGust2toE(j,i), q_fromGust2toE(j,i), ...
                     CM_CL_fromGust2toE(j,i), CM_CD_fromGust2toE(j,i), CM_CT_fromGust2toE(j,i), ...
                     CM_CG_fromGust2toE(j,i), CL_ht_fromGust2toE(j,i), CL_new_fromGust2toE(j,i), ...
                     L_wb_fromGust2toE(j,i), L_new_fromGust2toE(j,i), L_ht_fromGust2toE(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGust2toE(j,i) , WS(i), n_fromGust2toE(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM E TO 0
                n_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value;
                V_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value;
                
                for j = 1:numb
                    [CL_fromEto0(j,i), alfa_fromEto0(j,i), CD_fromEto0(j,i), q_fromEto0(j,i), ...
                     CM_CL_fromEto0(j,i), CM_CD_fromEto0(j,i), CM_CT_fromEto0(j,i), ...
                     CM_CG_fromEto0(j,i), CL_ht_fromEto0(j,i), CL_new_fromEto0(j,i), ...
                     L_wb_fromEto0(j,i), L_new_fromEto0(j,i), L_ht_fromEto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromEto0(j,i) , WS(i), n_fromEto0(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                
            elseif abs(min(nneg_cruise_sea_level(:,i))) < abs(nmin)  
                % FROM 0 TO S_INVERTED 
                n_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value;
                V_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value;
                
                for j = 1:numb
                    [CL_from0toS_inv(j,i), alfa_from0toS_inv(j,i), CD_from0toS_inv(j,i), q_from0toS_inv(j,i), ...
                     CM_CL_from0toS_inv(j,i), CM_CD_from0toS_inv(j,i), CM_CT_from0toS_inv(j,i), ...
                     CM_CG_from0toS_inv(j,i), CL_ht_from0toS_inv(j,i), CL_new_from0toS_inv(j,i), ...
                     L_wb_from0toS_inv(j,i), L_new_from0toS_inv(j,i), L_ht_from0toS_inv(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_from0toS_inv(j,i) , WS(i), n_from0toS_inv(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM S_INVERTED TO G
                n_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value;
                V_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value;
                
                for j = 1:numb
                    [CL_fromS_invtoG(j,i), alfa_fromS_invtoG(j,i), CD_fromS_invtoG(j,i), q_fromS_invtoG(j,i), ...
                     CM_CL_fromS_invtoG(j,i), CM_CD_fromS_invtoG(j,i), CM_CT_fromS_invtoG(j,i), ...
                     CM_CG_fromS_invtoG(j,i), CL_ht_fromS_invtoG(j,i), CL_new_fromS_invtoG(j,i), ...
                     L_wb_fromS_invtoG(j,i), L_new_fromS_invtoG(j,i), L_ht_fromS_invtoG(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromS_invtoG(j,i) , WS(i), n_fromS_invtoG(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM G TO F
                n_fromGtoF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.value;
                V_fromGtoF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.value; 
                
                for j = 1:numb
                    [CL_fromGtoF(j,i), alfa_fromGtoF(j,i), CD_fromGtoF(j,i), q_fromGtoF(j,i), ...
                     CM_CL_fromGtoF(j,i), CM_CD_fromGtoF(j,i), CM_CT_fromGtoF(j,i), ...
                     CM_CG_fromGtoF(j,i), CL_ht_fromGtoF(j,i), CL_new_fromGtoF(j,i), ...
                     L_wb_fromGtoF(j,i), L_new_fromGtoF(j,i), L_ht_fromGtoF(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromGtoF(j,i) , WS(i), n_fromGtoF(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end 

                % FROM F TO E
                n_fromFtoE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.value;
                V_fromFtoE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.value;
                
                for j = 1:numb
                    [CL_fromFtoE(j,i), alfa_fromFtoE(j,i), CD_fromFtoE(j,i), q_fromFtoE(j,i), ...
                     CM_CL_fromFtoE(j,i), CM_CD_fromFtoE(j,i), CM_CT_fromFtoE(j,i), ...
                     CM_CG_fromFtoE(j,i), CL_ht_fromFtoE(j,i), CL_new_fromFtoE(j,i), ...
                     L_wb_fromFtoE(j,i), L_new_fromFtoE(j,i), L_ht_fromFtoE(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromFtoE(j,i) , WS(i), n_fromFtoE(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end

                % FROM E TO 0
                n_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value;
                V_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value; 
                
                for j = 1:numb
                    [CL_fromEto0(j,i), alfa_fromEto0(j,i), CD_fromEto0(j,i), q_fromEto0(j,i), ...
                     CM_CL_fromEto0(j,i), CM_CD_fromEto0(j,i), CM_CT_fromEto0(j,i), ...
                     CM_CG_fromEto0(j,i), CL_ht_fromEto0(j,i), CL_new_fromEto0(j,i), ...
                     L_wb_fromEto0(j,i), L_new_fromEto0(j,i), L_ht_fromEto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                               rho0, V_fromEto0(j,i) , WS(i), n_fromEto0(j,i), ...
                                                                                               CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                               CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                               MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
                end
                
            end
        case "Case 1"
            % FROM 0 TO S INVERTED 
            n_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value;
            V_from0toS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value;
                
            for j = 1:numb
                [CL_from0toS_inv(j,i), alfa_from0toS_inv(j,i), CD_from0toS_inv(j,i), q_from0toS_inv(j,i), ...
                 CM_CL_from0toS_inv(j,i), CM_CD_from0toS_inv(j,i), CM_CT_from0toS_inv(j,i), ...
                 CM_CG_from0toS_inv(j,i), CL_ht_from0toS_inv(j,i), CL_new_from0toS_inv(j,i), ...
                 L_wb_from0toS_inv(j,i), L_new_from0toS_inv(j,i), L_ht_from0toS_inv(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_from0toS_inv(j,i) , WS(i), n_from0toS_inv(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end

            % FROM S INVERTED TO G 
            n_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value;
            V_fromS_invtoG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value;
                
            for j = 1:numb
                [CL_fromS_invtoG(j,i), alfa_fromS_invtoG(j,i), CD_fromS_invtoG(j,i), q_fromS_invtoG(j,i), ...
                 CM_CL_fromS_invtoG(j,i), CM_CD_fromS_invtoG(j,i), CM_CT_fromS_invtoG(j,i), ...
                 CM_CG_fromS_invtoG(j,i), CL_ht_fromS_invtoG(j,i), CL_new_fromS_invtoG(j,i), ...
                 L_wb_fromS_invtoG(j,i), L_new_fromS_invtoG(j,i), L_ht_fromS_invtoG(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromS_invtoG(j,i) , WS(i), n_fromS_invtoG(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end

            % FROM G TO F 
            n_fromGtoF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.value;
            V_fromGtoF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.value;
                
            for j = 1:numb
                [CL_fromGtoF(j,i), alfa_fromGtoF(j,i), CD_fromGtoF(j,i), q_fromGtoF(j,i), ...
                 CM_CL_fromGtoF(j,i), CM_CD_fromGtoF(j,i), CM_CT_fromGtoF(j,i), ...
                 CM_CG_fromGtoF(j,i), CL_ht_fromGtoF(j,i), CL_new_fromGtoF(j,i), ...
                 L_wb_fromGtoF(j,i), L_new_fromGtoF(j,i), L_ht_fromGtoF(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromGtoF(j,i) , WS(i), n_fromGtoF(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end

            % FROM F TO E 
            n_fromFtoE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.value;
            V_fromFtoE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.value;
                
            for j = 1:numb
                [CL_fromFtoE(j,i), alfa_fromFtoE(j,i), CD_fromFtoE(j,i), q_fromFtoE(j,i), ...
                 CM_CL_fromFtoE(j,i), CM_CD_fromFtoE(j,i), CM_CT_fromFtoE(j,i), ...
                 CM_CG_fromFtoE(j,i), CL_ht_fromFtoE(j,i), CL_new_fromFtoE(j,i), ...
                 L_wb_fromFtoE(j,i), L_new_fromFtoE(j,i), L_ht_fromFtoE(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromFtoE(j,i) , WS(i), n_fromFtoE(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end

            % FROM E TO 0 
            n_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value;
            V_fromEto0 = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value;
                
            for j = 1:numb
                [CL_fromEto0(j,i), alfa_fromEto0(j,i), CD_fromEto0(j,i), q_fromEto0(j,i), ...
                 CM_CL_fromEto0(j,i), CM_CD_fromEto0(j,i), CM_CT_fromEto0(j,i), ...
                 CM_CG_fromEto0(j,i), CL_ht_fromEto0(j,i), CL_new_fromEto0(j,i), ...
                 L_wb_fromEto0(j,i), L_new_fromEto0(j,i), L_ht_fromEto0(j,i)] = BalancingParametersFlight(obj1, ...
                                                                                           rho0, V_fromEto0(j,i) , WS(i), n_fromEto0(j,i), ...
                                                                                           CLmax_aero_model, alfa0l, a2 , b2, c2, CL_star, ...
                                                                                           CL0, CLalfa, p_CD, CL_max_inv, XAC(i), XCG(i), bCG(i), ...
                                                                                           MAC, h_thrust(i), CM0, CM_landing_gear, CM_slope, S, l_ht_envelope(i));
            end
    end
end

%% STORE INSIDE THE AIRCRAFT STRUCTURED VARIABLE  

for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(i))
        case "Case 2"
            if abs(min(nneg_cruise_sea_level(:,i))) > abs(nmin)  
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.value                 = CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.value           = alfa_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.value           = deg2rad(alfa_from0toS_inv); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.value                 = CD_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.value                  = q_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.value              = CM_CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.value              = CM_CD_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.value              = CM_CT_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.value              = CM_CG_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.value              = CL_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.value             = CL_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.value               = L_wb_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.value              = L_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.value               = L_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.value                 = CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.value           = alfa_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.value           = deg2rad(alfa_fromS_invtoG); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.value                 = CD_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.value                  = q_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.value              = CM_CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.value              = CM_CD_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.value              = CM_CT_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.value              = CM_CG_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.value              = CL_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.value             = CL_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.value               = L_wb_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.value              = L_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.value               = L_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM G TO GUST1
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoGust1.value                 = CL_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoGust1.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoGust1_deg.value           = alfa_fromGtoGust1; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoGust1_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoGust1_rad.value           = deg2rad(alfa_fromGtoGust1); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoGust1_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoGust1.value                 = CD_fromGtoGust1; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoGust1.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoGust1.value                  = q_fromGtoGust1; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoGust1.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoGust1.value              = CM_CL_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoGust1.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoGust1.value              = CM_CD_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoGust1.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoGust1.value              = CM_CT_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoGust1.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoGust1.value              = CM_CG_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoGust1.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoGust1.value              = CL_ht_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoGust1.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoGust1.value             = CL_new_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoGust1.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoGust1.value               = L_wb_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoGust1.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoGust1.value              = L_new_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoGust1.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoGust1.value               = L_ht_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoGust1.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM GUST1 TO F 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toF.value                 = CL_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust1toF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toF_deg.value           = alfa_fromGust1toF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toF_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toF_rad.value           = deg2rad(alfa_fromGust1toF); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust1toF_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toF.value                 = CD_fromGust1toF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust1toF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toF.value                  = q_fromGust1toF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust1toF.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toF.value              = CM_CL_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust1toF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toF.value              = CM_CD_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust1toF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toF.value              = CM_CT_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust1toF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toF.value              = CM_CG_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust1toF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toF.value              = CL_ht_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust1toF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toF.value             = CL_new_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust1toF.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toF.value               = L_wb_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust1toF.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toF.value              = L_new_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust1toF.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toF.value               = L_ht_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust1toF.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM F TO GUST2 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoGust2.value                 = CL_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoGust2.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoGust2_deg.value           = alfa_fromFtoGust2; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoGust2_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoGust2_rad.value           = deg2rad(alfa_fromFtoGust2); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoGust2_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoGust2.value                 = CD_fromFtoGust2; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoGust2.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoGust2.value                  = q_fromFtoGust2; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoGust2.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoGust2.value              = CM_CL_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoGust2.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoGust2.value              = CM_CD_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoGust2.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoGust2.value              = CM_CT_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoGust2.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoGust2.value              = CM_CG_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoGust2.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoGust2.value              = CL_ht_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoGust2.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoGust2.value             = CL_new_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoGust2.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoGust2.value               = L_wb_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoGust2.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoGust2.value              = L_new_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoGust2.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoGust2.value               = L_ht_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoGust2.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM GUST2 TO E 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toE.value                 = CL_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGust2toE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toE_deg.value           = alfa_fromGust2toE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toE_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toE_rad.value           = deg2rad(alfa_fromGust2toE); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGust2toE_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toE.value                 = CD_fromGust2toE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGust2toE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toE.value                  = q_fromGust2toE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGust2toE.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toE.value              = CM_CL_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGust2toE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toE.value              = CM_CD_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGust2toE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toE.value              = CM_CT_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGust2toE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toE.value              = CM_CG_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGust2toE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toE.value              = CL_ht_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGust2toE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toE.value             = CL_new_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGust2toE.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toE.value               = L_wb_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGust2toE.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toE.value              = L_new_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGust2toE.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toE.value               = L_ht_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGust2toE.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.value                 = CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.value           = alfa_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.value           = deg2rad(alfa_fromEto0); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.value                 = CD_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.value                  = q_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.value              = CM_CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.value              = CM_CD_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.value              = CM_CT_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.value              = CM_CG_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.value              = CL_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.value             = CL_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.value               = L_wb_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.value              = L_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.value               = L_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
            
            elseif abs(min(nneg_cruise_sea_level(:,i))) < abs(nmin)  
                
                % FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.value                 = CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.value           = alfa_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.value           = deg2rad(alfa_from0toS_inv); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.value                 = CD_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.value                  = q_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.value              = CM_CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.value              = CM_CD_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.value              = CM_CT_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.value              = CM_CG_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.value              = CL_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.value             = CL_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.value               = L_wb_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.value              = L_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.value               = L_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.value                 = CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.value           = alfa_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.value           = deg2rad(alfa_fromS_invtoG); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.value                 = CD_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.value                  = q_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.value              = CM_CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.value              = CM_CD_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.value              = CM_CT_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.value              = CM_CG_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.value              = CL_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.value             = CL_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.value               = L_wb_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.value              = L_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.value               = L_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM G TO F
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoF.value                 = CL_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_deg.value           = alfa_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_rad.value           = deg2rad(alfa_fromGtoF); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoF.value                 = CD_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoF.value                  = q_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoF.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoF.value              = CM_CL_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoF.value              = CM_CD_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoF.value              = CM_CT_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoF.value              = CM_CG_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoF.value              = CL_ht_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoF.value             = CL_new_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoF.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoF.value               = L_wb_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoF.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoF.value              = L_new_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoF.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoF.value               = L_ht_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoF.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM F TO E
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoE.value                 = CL_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_deg.value           = alfa_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_rad.value           = deg2rad(alfa_fromFtoE); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoE.value                 = CD_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoE.value                  = q_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoE.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoE.value              = CM_CL_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoE.value              = CM_CD_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoE.value              = CM_CT_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoE.value              = CM_CG_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoE.value              = CL_ht_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoE.value             = CL_new_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoE.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoE.value               = L_wb_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoE.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoE.value              = L_new_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoE.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoE.value               = L_ht_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoE.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.value                 = CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.value           = alfa_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.value           = deg2rad(alfa_fromEto0); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.value                 = CD_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.value                  = q_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.value              = CM_CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.value              = CM_CD_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.value              = CM_CT_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.value              = CM_CG_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.value              = CL_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.value             = CL_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.value               = L_wb_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.value              = L_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.value               = L_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
            end
        case "Case 1"
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                % FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.value                 = CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.value           = alfa_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.value           = deg2rad(alfa_from0toS_inv); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_from0toS_inv_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.value                 = CD_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_from0toS_inv.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.value                  = q_from0toS_inv; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_from0toS_inv.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.value              = CM_CL_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.value              = CM_CD_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.value              = CM_CT_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.value              = CM_CG_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.value              = CL_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_from0toS_inv.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.value             = CL_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_from0toS_inv.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.value               = L_wb_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_from0toS_inv.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.value              = L_new_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_from0toS_inv.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.value               = L_ht_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_from0toS_inv.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.value                 = CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.value           = alfa_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.value           = deg2rad(alfa_fromS_invtoG); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromS_invtoG_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.value                 = CD_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromS_invtoG.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.value                  = q_fromS_invtoG; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromS_invtoG.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.value              = CM_CL_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.value              = CM_CD_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.value              = CM_CT_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.value              = CM_CG_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.value              = CL_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromS_invtoG.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.value             = CL_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromS_invtoG.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.value               = L_wb_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromS_invtoG.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.value              = L_new_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromS_invtoG.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.value               = L_ht_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromS_invtoG.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM G TO F
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoF.value                 = CL_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromGtoF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_deg.value           = alfa_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_rad.value           = deg2rad(alfa_fromGtoF); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromGtoF_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoF.value                 = CD_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromGtoF.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoF.value                  = q_fromGtoF; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromGtoF.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoF.value              = CM_CL_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoF.value              = CM_CD_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoF.value              = CM_CT_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoF.value              = CM_CG_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoF.value              = CL_ht_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromGtoF.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoF.value             = CL_new_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromGtoF.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoF.value               = L_wb_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromGtoF.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoF.value              = L_new_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromGtoF.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoF.value               = L_ht_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromGtoF.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM F TO E
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoE.value                 = CL_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromFtoE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_deg.value           = alfa_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_rad.value           = deg2rad(alfa_fromFtoE); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromFtoE_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoE.value                 = CD_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromFtoE.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoE.value                  = q_fromFtoE; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromFtoE.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoE.value              = CM_CL_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoE.value              = CM_CD_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoE.value              = CM_CT_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoE.value              = CM_CG_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoE.value              = CL_ht_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromFtoE.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoE.value             = CL_new_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromFtoE.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoE.value               = L_wb_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromFtoE.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoE.value              = L_new_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromFtoE.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoE.value               = L_ht_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromFtoE.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
                
                % FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.value                 = CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.value           = alfa_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_deg.Attributes.unit = "deg";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.value           = deg2rad(alfa_fromEto0); 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.alfa_fromEto0_rad.Attributes.unit = "rad";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.value                 = CD_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CD_fromEto0.Attributes.unit       = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.value                  = q_fromEto0; 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.q_fromEto0.Attributes.unit        = "Pa";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.value              = CM_CL_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CL_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.value              = CM_CD_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CD_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.value              = CM_CT_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CT_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.value              = CM_CG_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CM_CG_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.value              = CL_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_ht_fromEto0.Attributes.unit    = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.value             = CL_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.CL_new_fromEto0.Attributes.unit   = "Non dimensional";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.value               = L_wb_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_wb_fromEto0.Attributes.unit     = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.value              = L_new_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_new_fromEto0.Attributes.unit    = "daN";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.value               = L_ht_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.L_ht_fromEto0.Attributes.unit     = "daN";
                % ----------------------------------------------------------------------------------------------------------------------------------------------
    end
end

%% STORE INSIDE THE STRUCT VARIABLE
FlightEnvStorePoints

%% PLOT RESULTS 

% Main Wing - Wing Body - LIFT 
PlotMainWingLift_wb
MainWingLift_wb_Subplots

% Main Wing - Full vehicle - LIFT 
PlotMainWingLift_fullvehicle
MainWingLift_fullvehicle_Subplots

% Horizontal tail - BALANCING LIFT 
PlotHorizontalTailLift
HorizontalTailLift_Subplots