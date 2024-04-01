
%% AERODYNAMIC MODEL 
%  USER DEFINED VEHICLE AERODYNAMICS
%  CHECK THE INPUT FILE TO VERIFY DATA

% INTERPOLATION FLAG
interpolation_flag = Aircraft.Certification.Aerodynamic_data.Interpolation_flag.value;
switch (interpolation_flag)
    case 'OPEN VSP'

        % UNIT LIFT DISTRIBUTION ALONG THE WING SEMI-SPAN 
        % Lift coefficient distribution at a global CL equal to one
        % A simple function to evaluate the lift coefficient distribution along the
        % span cl = cl(y) when the associated global lift coefficient of the whole
        % wing is equal to 1.0; the function use a method similar to that suggested
        % by Abbott in Theory of Wing Section. See the complete documentation
        % inside the cl_unit_lift.m file
        S                      = Aircraft.Geometry.Wing.S.value*0.5;
        half_span              = Aircraft.Geometry.Wing.half_span_stations.value;
        global_CL_equal_to_one = 0.0;
        tol                    = 1e-1;
        global_CL              = zeros(length(Aircraft.OpenVSP.output.Cl.value(1,:)), 1);
        for i = 1:length(Aircraft.OpenVSP.output.Cl.value(1,:))
            global_CL(i) = trapz(half_span, Aircraft.OpenVSP.output.Cl.value(:,i))/S;
            if (global_CL(i) >= 1.0-tol) && (global_CL(i) <= 1.0+tol)
                    global_CL_equal_to_one = Aircraft.OpenVSP.output.Cl.value(:,i);
            end
        end
        bool_CL_check = global_CL < 1.0; 
        if ~any(bool_CL_check) == 1  
            error("ERROR: CL distribution along the wing semi-span does not contain the unit CL distribution!")
        end
        Aircraft.Certification.Aerodynamic_data.cl_at_CL1.value = global_CL_equal_to_one;
        Aircraft.Certification.Aerodynamic_data.cl_at_CL1.Attributes.unit = "Non dimensional"; 
        
        % PRELIMINARY DATA 
        if isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 0
            oswaldt_efficiency_factor                                 = max(Aircraft.OpenVSP.output.e.value);
            Aircraft.Certification.Aerodynamic_data.e.value           = oswaldt_efficiency_factor; 
            Aircraft.Certification.Aerodynamic_data.e.Attributes.unit = "Non dimensional";
        elseif isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 1
            if  Aircraft.Certification.Aerodynamic_data.e.value == 0
                Aircraft.Certification.Aerodynamic_data.e.value = 0.77;
            end
        end
        
        Points             = 1e3;
        CL_star            = Aircraft.Certification.Aerodynamic_data.CL_star.value;
        CL_interp_values   = Aircraft.OpenVSP.output.CL.value;
        CD_interp_values   = Aircraft.OpenVSP.output.CDtot.value;
        CM_interp_values   = Aircraft.OpenVSP.output.CMy.value;
        alfa_interp_values = Aircraft.OpenVSP.output.alfa.value;
        alpha_interp       = linspace(alfa_interp_values(1), alfa_interp_values(end), Points)';
        
        % INTERPOLATION PROCEDURE - LIFT COEFFICIENT
        index_cl_star  = find((abs(CL_interp_values-CL_star))<1e-1);
        index_aoa_star = index_cl_star(1);
        p_alfa_star    = polyfit(CL_interp_values(index_aoa_star-1:index_aoa_star+1), alfa_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        alfa_star      = polyval(p_alfa_star, CL_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.value            = alfa_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.Attributes.unit  = "deg";
        % -------------------------------------------------------------------------
        CL_wb_interp  = zeros(length(alpha_interp), 1);
        n_pol1        = 1;
        n_pol2        = 1;
        p_CL_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star], [CL_interp_values(1:index_aoa_star-1); CL_star], n_pol1);
        p_CL_wb2      = polyfit([alfa_star; alfa_interp_values(index_aoa_star:end)], [CL_star; CL_interp_values(index_aoa_star:end)], n_pol2);
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.value           = p_CL_wb1; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.Attributes.unit = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value           = p_CL_wb2; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.Attributes.unit = "1/deg";
        CL_wb_interp1 = polyval(p_CL_wb1, alpha_interp);
        CL_wb_interp2 = polyval(p_CL_wb2, alpha_interp);
        for i = 1:length(alpha_interp)
            if (CL_wb_interp1(i) < CL_star) && (CL_wb_interp1(i) ~= CL_wb_interp2(i)) 
                CL_wb_interp(i) = CL_wb_interp1(i);
            elseif CL_wb_interp1(i) > CL_star 
                CL_wb_interp(i) = CL_wb_interp2(i);
            end
        end
        % -------------------------------------------------------------------------
        
        % USEFUL DATA
        CL0              = p_CL_wb1(2);
        CLalfa_deg       = p_CL_wb1(1);
        CLalfa_rad       = p_CL_wb1(1) / deg2rad(1);
        a2               = 0;
        b2               = p_CL_wb2(1);
        c2               = p_CL_wb2(2);
        CL_max_fullmodel = max(CL_wb_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.value           = alpha_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.Attributes.unit = "deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value                = CL_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.value            = CL_max_fullmodel;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.Attributes.unit  = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.value                         = CL0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.Attributes.unit               = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.value                  = CLalfa_deg;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.Attributes.unit        = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value                  = CLalfa_rad;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.Attributes.unit        = "1/rad";
        
        % ALFA ZERO LIFT
        alfa_zero_lift = alpha_fullmodel(0, a2, b2, c2, CL_max_fullmodel, CL_star, CL0, CLalfa_deg);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.value           = alfa_zero_lift;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.Attributes.unit = "deg";
        
        % INTERPOLATION PROCEDURE - DRAG COEFFICIENT
        p_cd_star   = polyfit(alfa_interp_values(index_aoa_star-1:index_aoa_star+1), CD_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        CD_star     = polyval(p_cd_star, alfa_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.value           = CD_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.Attributes.unit = "Non dimensional";
        
        n_pol1        = 2;
        p_CD_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star; alfa_interp_values(index_aoa_star:end)], ...
                                [CD_interp_values(1:index_aoa_star-1); CD_star; CD_interp_values(index_aoa_star:end)], n_pol1);
        CD_wb_interp  = polyval(p_CD_wb1, alpha_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.value                = p_CD_wb1;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.Attributes.unit      = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.value            = CD_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.Attributes.unit  = "Non dimensional";   
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.value                     = polyval(p_CD_wb1, 0);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.Attributes.unit           = "Non dimensional";

        % INTERPOLATION PROCEDURE - PITCHING MOMENT COEFFICIENT
        n_pol        = 1;
        CL_for_CM    = CL_interp_values(CL_interp_values < CL_star);
        index_CM_min = find(CL_interp_values < CL_star,73);
        length_CL    = length(CL_for_CM);
        if length_CL ~= index_CM_min(end)
            error("WARNING: Uncorrect pitching moment interpolation")
        end
        CM_interp_values2 = CM_interp_values(1:index_CM_min(end));
        p_CM_wb           = polyfit(CL_for_CM, CM_interp_values2, n_pol);
        CM_interp         = polyval(p_CM_wb, Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value);
        
        % USEFUL DATA
        CM0  = p_CM_wb(2);
        CMCL = p_CM_wb(1);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.value                = p_CM_wb;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.value                    = CM0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.value                   = CMCL;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.value           = CM_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.Attributes.unit = "Non dimensional";
        
        % FIGURES 
        PlotInterpResults
        
    case 'User'
        
        % PRELIMINARY DATA 
        if isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 0
            oswaldt_efficiency_factor                                 = 0.77;
            Aircraft.Certification.Aerodynamic_data.e.value           = oswaldt_efficiency_factor; 
            Aircraft.Certification.Aerodynamic_data.e.Attributes.unit = "Non dimensional";
        elseif isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 1
            if  Aircraft.Certification.Aerodynamic_data.e.value == 0
                Aircraft.Certification.Aerodynamic_data.e.value = 0.77;
            end
        end
        
        Points             = 1e3;
        CL_max_clean       = Aircraft.Certification.Aerodynamic_data.CL_max_clean.value;
        CL_max_takeoff     = Aircraft.Certification.Aerodynamic_data.CL_max_takeoff.value;
        CL_max_landing     = Aircraft.Certification.Aerodynamic_data.CL_max_landing.value;
        CL_star            = Aircraft.Certification.Aerodynamic_data.CL_star.value;
        alfa_interp_values = Aircraft.Certification.Aerodynamic_data.alfa_wb.value;
        CL_interp_values   = Aircraft.Certification.Aerodynamic_data.cl_wb.value;
        CM_interp_values   = Aircraft.Certification.Aerodynamic_data.cm_wb.value;
        CD_interp_values   = Aircraft.Certification.Aerodynamic_data.cd_wb.value;
        alpha_interp       = linspace(alfa_interp_values(1), alfa_interp_values(end), Points)';
        
        % INTERPOLATION PROCEDURE - LIFT COEFFICIENT
        index_cl_star  = find((abs(CL_interp_values-CL_star))<1e-1);
        index_aoa_star = index_cl_star(1);
        p_alfa_star    = polyfit(CL_interp_values(index_aoa_star-1:index_aoa_star+1), alfa_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        alfa_star      = polyval(p_alfa_star, CL_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.value            = alfa_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.Attributes.unit  = "deg";
        % -------------------------------------------------------------------------
        CL_wb_interp  = zeros(length(alpha_interp), 1);
        n_pol1        = 1;
        n_pol2        = 2;
        p_CL_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star], [CL_interp_values(1:index_aoa_star-1); CL_star], n_pol1);
        p_CL_wb2      = polyfit([alfa_star; alfa_interp_values(index_aoa_star:end)], [CL_star; CL_interp_values(index_aoa_star:end)], n_pol2);
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.value           = p_CL_wb1; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.Attributes.unit = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value           = p_CL_wb2; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.Attributes.unit = "1/deg";
        CL_wb_interp1 = polyval(p_CL_wb1, alpha_interp);
        CL_wb_interp2 = polyval(p_CL_wb2, alpha_interp);
        for i = 1:length(alpha_interp)
            if (CL_wb_interp1(i) < CL_star) && (CL_wb_interp1(i) ~= CL_wb_interp2(i)) 
                CL_wb_interp(i) = CL_wb_interp1(i);
            elseif CL_wb_interp1(i) > CL_star 
                CL_wb_interp(i) = CL_wb_interp2(i);
            end
        end
        % -------------------------------------------------------------------------
        
        % USEFUL DATA
        CL0              = p_CL_wb1(2);
        CLalfa_deg       = p_CL_wb1(1);
        CLalfa_rad       = p_CL_wb1(1) / deg2rad(1);
        a2               = p_CL_wb2(1);
        b2               = p_CL_wb2(2);
        c2               = p_CL_wb2(3);
        CL_max_fullmodel = max(CL_wb_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.value           = alpha_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.Attributes.unit = "deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value                = CL_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.value            = CL_max_fullmodel;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.Attributes.unit  = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.value                         = CL0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.Attributes.unit               = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.value                  = CLalfa_deg;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.Attributes.unit        = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value                  = CLalfa_rad;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.Attributes.unit        = "1/rad";
        
        % ALFA ZERO LIFT
        alfa_zero_lift = alpha_fullmodel(0, a2, b2, c2, CL_max_fullmodel, CL_star, CL0, CLalfa_deg);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.value           = alfa_zero_lift;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.Attributes.unit = "deg";
        
        % INTERPOLATION PROCEDURE - DRAG COEFFICIENT
        p_cd_star   = polyfit(alfa_interp_values(index_aoa_star-1:index_aoa_star+1), CD_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        CD_star     = polyval(p_cd_star, alfa_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.value           = CD_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.Attributes.unit = "Non dimensional";
        
        n_pol1        = 2;
        p_CD_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star; alfa_interp_values(index_aoa_star:end)], ...
                                [CD_interp_values(1:index_aoa_star-1); CD_star; CD_interp_values(index_aoa_star:end)], n_pol1);
        CD_wb_interp  = polyval(p_CD_wb1, alpha_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.value                = p_CD_wb1;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.Attributes.unit      = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.value            = CD_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.Attributes.unit  = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_PolCoeff_p.value           = p_CD_wb1;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_PolCoeff_p.Attributes.unit = "1/deg";    
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.value                     = polyval(p_CD_wb1, 0);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.Attributes.unit           = "Non dimensional";

        % INTERPOLATION PROCEDURE - PITCHING MOMENT COEFFICIENT
        n_pol        = 1;
        CL_for_CM    = CL_interp_values(CL_interp_values < CL_star);
        index_CM_min = find(CL_interp_values < CL_star,73);
        length_CL    = length(CL_for_CM);
        if length_CL ~= index_CM_min
            error("WARNING: Uncorrect pitching moment interpolation")
        end
        CM_interp_values2 = CM_interp_values(1:index_CM_min(end));
        p_CM_wb      = polyfit(CL_for_CM, CM_interp_values2, n_pol);
        CM_interp    = polyval(p_CM_wb, Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value);
        
        % USEFUL DATA
        CM0  = p_CM_wb(2);
        CMCL = p_CM_wb(1);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.value                = p_CM_wb;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.value                    = CM0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.value                   = CMCL;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.value           = CM_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.Attributes.unit = "Non dimensional";
        
        % FIGURES 
        PlotInterpResults
        
    case 'Other'
        
        % PRELIMINARY DATA 
        if isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 0
            oswaldt_efficiency_factor                                 = 0.77;
            Aircraft.Certification.Aerodynamic_data.e.value           = oswaldt_efficiency_factor; 
            Aircraft.Certification.Aerodynamic_data.e.Attributes.unit = "Non dimensional";
        elseif isfield(Aircraft.Certification.Aerodynamic_data, 'e') == 1
            if  Aircraft.Certification.Aerodynamic_data.e.value == 0
                Aircraft.Certification.Aerodynamic_data.e.value = 0.77;
            end
        end
        
        Points             = 1e3;
        CL_max_clean       = Aircraft.Certification.Aerodynamic_data.CL_max_clean.value;
        CL_max_takeoff     = Aircraft.Certification.Aerodynamic_data.CL_max_takeoff.value;
        CL_max_landing     = Aircraft.Certification.Aerodynamic_data.CL_max_landing.value;
        CL_star            = Aircraft.Certification.Aerodynamic_data.CL_star.value;
        alfa_interp_values = Aircraft.Certification.Aerodynamic_data.alfa_wb.value;
        CL_interp_values   = Aircraft.Certification.Aerodynamic_data.cl_wb.value;
        CM_interp_values   = Aircraft.Certification.Aerodynamic_data.cm_wb.value;
        CD_interp_values   = Aircraft.Certification.Aerodynamic_data.cd_wb.value;
        alpha_interp       = linspace(alfa_interp_values(1), alfa_interp_values(end), Points)';
        
        % INTERPOLATION PROCEDURE - LIFT COEFFICIENT
        index_cl_star  = find((abs(CL_interp_values-CL_star))<1e-1);
        index_aoa_star = index_cl_star(1);
        p_alfa_star    = polyfit(CL_interp_values(index_aoa_star-1:index_aoa_star+1), alfa_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        alfa_star      = polyval(p_alfa_star, CL_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.value            = alfa_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alpha_star.Attributes.unit  = "deg";
        % -------------------------------------------------------------------------
        CL_wb_interp  = zeros(length(alpha_interp), 1);
        n_pol1        = 1;
        n_pol2        = 2;
        p_CL_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star], [CL_interp_values(1:index_aoa_star-1); CL_star], n_pol1);
        p_CL_wb2      = polyfit([alfa_star; alfa_interp_values(index_aoa_star:end)], [CL_star; CL_interp_values(index_aoa_star:end)], n_pol2);
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.value           = p_CL_wb1; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb1.Attributes.unit = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.value           = p_CL_wb2; 
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CL_wb2.Attributes.unit = "1/deg";
        CL_wb_interp1 = polyval(p_CL_wb1, alpha_interp);
        CL_wb_interp2 = polyval(p_CL_wb2, alpha_interp);
        for i = 1:length(alpha_interp)
            if (CL_wb_interp1(i) < CL_star) && (CL_wb_interp1(i) ~= CL_wb_interp2(i)) 
                CL_wb_interp(i) = CL_wb_interp1(i);
            elseif CL_wb_interp1(i) > CL_star 
                CL_wb_interp(i) = CL_wb_interp2(i);
            end
        end
        % -------------------------------------------------------------------------
        
        % USEFUL DATA
        CL0              = p_CL_wb1(2);
        CLalfa_deg       = p_CL_wb1(1);
        CLalfa_rad       = p_CL_wb1(1) / deg2rad(1);
        a2               = p_CL_wb2(1);
        b2               = p_CL_wb2(2);
        c2               = p_CL_wb2(3);
        CL_max_fullmodel = max(CL_wb_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.value           = alpha_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.Attributes.unit = "deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value                = CL_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.value            = CL_max_fullmodel;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL_max_fullmodel.Attributes.unit  = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.value                         = CL0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CL0.Attributes.unit               = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.value                  = CLalfa_deg;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_deg.Attributes.unit        = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value                  = CLalfa_rad;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.Attributes.unit        = "1/rad";
        
        % ALFA ZERO LIFT
        alfa_zero_lift = alpha_fullmodel(0, a2, b2, c2, CL_max_fullmodel, CL_star, CL0, CLalfa_deg);
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.value           = alfa_zero_lift;
        Aircraft.Certification.Aerodynamic_data.Interpolation.alfa_zero_lift.Attributes.unit = "deg";
        
        % INTERPOLATION PROCEDURE - DRAG COEFFICIENT
        p_cd_star   = polyfit(alfa_interp_values(index_aoa_star-1:index_aoa_star+1), CD_interp_values(index_aoa_star-1:index_aoa_star+1), 2);
        CD_star     = polyval(p_cd_star, alfa_star);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.value           = CD_star;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_star.Attributes.unit = "Non dimensional";
        
        n_pol1        = 2;
        p_CD_wb1      = polyfit([alfa_interp_values(1:index_aoa_star-1); alfa_star; alfa_interp_values(index_aoa_star:end)], ...
                                [CD_interp_values(1:index_aoa_star-1); CD_star; CD_interp_values(index_aoa_star:end)], n_pol1);
        CD_wb_interp  = polyval(p_CD_wb1, alpha_interp);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.value                = p_CD_wb1;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CD_wb1.Attributes.unit      = "1/deg";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.value            = CD_wb_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.Attributes.unit  = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_PolCoeff_p.value           = p_CD_wb1;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD_PolCoeff_p.Attributes.unit = "1/deg";    
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.value                     = polyval(p_CD_wb1, 0);
        Aircraft.Certification.Aerodynamic_data.Interpolation.CD0.Attributes.unit           = "Non dimensional";

        % INTERPOLATION PROCEDURE - PITCHING MOMENT COEFFICIENT
        n_pol        = 1;
        CL_for_CM    = CL_interp_values(CL_interp_values < CL_star);
        index_CM_min = find(CL_interp_values < CL_star,73);
        length_CL    = length(CL_for_CM);
        if length_CL ~= index_CM_min
            error("WARNING: Uncorrect pitching moment interpolation")
        end
        CM_interp_values2 = CM_interp_values(1:index_CM_min(end));
        p_CM_wb      = polyfit(CL_for_CM, CM_interp_values2, n_pol);
        CM_interp    = polyval(p_CM_wb, Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value);
        
        % USEFUL DATA
        CM0  = p_CM_wb(2);
        CMCL = p_CM_wb(1);
        
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.value                = p_CM_wb;
        Aircraft.Certification.Aerodynamic_data.Interpolation.p_CM_wb.Attributes.unit      = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.value                    = CM0;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM0.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.value                   = CMCL;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CMCL.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.value           = CM_interp;
        Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.Attributes.unit = "Non dimensional";
        
        % FIGURES 
        PlotInterpResults
end
