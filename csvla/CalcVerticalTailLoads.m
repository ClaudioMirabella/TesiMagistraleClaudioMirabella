
        %% CS - VLA 441 MANOEUVRING LOADS 
        %
        %  (a) At speeds up to VA, the vertical tail surfaces must be designed to
        %      withistand the following conditions.In computing the tail loads, the
        %      yawing velocity may be assumed to be zero
        %      (1) whit the aeroplane in unaccelerated flight at zero yaw, it is
        %          assumed that the rudder control is suddenly displaced to the
        %          maximum deflection, as limited by the control stops or by limit
        %          pilot forces; 
        %      (2) with the rudder deflected as specified in sub-paragraph (a)(1)
        %          of this paragraph, it is assumed that the aeroplane yaws to the
        %          resulting sideslip angle. In lieu of a rational analysis, an
        %          overswing angle equal to 1.3 times the static sideslip angle of
        %          sub-paragraph (a)(3) of this paragraph may be assumed; 
        %      (3) A yaw angle of 15.0 degrees with the rudder control maintained
        %          in the neutral position, except as limited by pilot strength. 
        %
        %  (b) The average loading of Appendix B, B11 and figure B1 of Appendix B 
        %      and the distribution of figures B6, B7, B8 of Appendix B may be used
        %      instead of requirements of sub-paragraphs (a)(2), (a)(1) and (a)(3)
        %      of this paragraph, respectively.
        %
        %  (c) The yaw angles specified in sub-paragraph (a)(3) of this paragraph
        %      may be reduced if the yaw angle chosen for a particular speed 
        %      cannot be exceeded in 
        %      (1) steady sideslip conditions; and 
        %      (2) uncoordinated rolls from steep banks.

        %% AMC VLA 441 MANOEUVRING LOADS 
        %  -----------------------------
        %  INTERPRETATIVE MATERIAL AND ACCEPTABLE MEANS OF COMPLIANCE 
        % 
        %  For aeroplanes where the horizontal tail is supported by the vertical
        %  tail, the tail surfaces and their supporting structure, including the
        %  rear portion of the fuselage, should be designed to whitstand the
        %  prescribed loading on the vertica ltail and the roll-moments induced by
        %  the horizontal tail acting in the same direction.

        %  For T - Tails, in the abscence of a more rational analysis, the rolling
        %  moment induced by deflection of the vertical rudder may be computed as
        %  follows: 
        %                            rho0
        %  M_rudder = (0.3) * S_ht * ---- * beta * V^2 * b_ht 
        %                              2
        %  where 
        %
        %  M_rudder = induced roll - moment at horizontal tail (N * m) 
        %  b_ht     = span of horizonta tail (m) 
        %  V        = airspeed (m/s)
        %  S_ht     = area of horizontal tail (m^2)
        %  rho0     = air densidity at sea level (kg/m^3)
        %  beta     = angle of zero - lift line due to rudder deflection; this
        %             angle can be defined as follow         
        %                         dL
        %                       ------- * eta * f_n
        %                        d eta 
        %             where 
        %               dL
        %             ------- = change of zero - lift angle of eta * f_n = 1
        %              d eta         
        %       
        %             eta     = rudder deflection 
        %             f_n     = effectivity factor in accordance with angle of
        %                       rudder deflection

        %% CS - VLA 443 GUST LOADS 
        %  
        %  (a) Vertical tail surfaces must be designed to whithstand, in
        %      unaccelerated flight at speed V = VC, lateral gusts of the values
        %      prescribed for VC in CS - VLA 333 (c).
        %
        %  (b) In the absence of a more rational analysis, the gust load must be
        %      computed as follows 
        %
        %             K_gt * U_de * V * a_vt * S_vt
        %      L_vt = -----------------------------
        %                          16.3
        %
        %      where 
        %
        %      U_de  = derived gust velocities (m/s);
        % 
        %      L_vt  = vertical tail loads (daN);
        %     
        %               (0.88) * mu_gt 
        %      K_gt  = --------------- = gust alleviation factor;
        %                5.3 + mu_gt
        %
        %                          2 * M                   K^2
        %      mu_gt = ------------------------------- * ------- = lat. mass ratio;
        %              rho * c_bar_t * g * a_vt * S_vt   (l_t^2)
        %              
        %              where 
        %                
        %              M    = aeroplane mass (kg); 
        %              rho  = air density (kg/m^3); 
        %              S_vt = area of vertical tail (m^2);
        %              l_t  = distance from aeroplane c.g. to lift centre of
        %                     vertical surface (m); 
        %              a_vt = lift curve slope of vertical tail (1/rad); 
        %              V    = aeroplane equivalent speed (m/s); 
        %              K    = radius of gyration in yaw (m);
        %              g    = acceleration due to gravity (m/s^2).
        %
        %  (c) The average loading in figure B5 and the distribution in figure B8
        %      of Appendix B may be used. 

        %% AMC VLA 443 GUST LOADS 
        %  -----------------------------
        %  INTERPRETATIVE MATERIAL AND ACCEPTABLE MEANS OF COMPLIANCE 
        %
        %  For aeroplanes where the horizontal tail is supported by the vertical
        %  tail, the tail surfaces and their supporting structure including the
        %  rear portion of the fuselage should be designed to whithstand the
        %  prescribed loadings on the vertical tail and the roll - moments induced
        %  by the horizontal tail acting in the same direction. 
        %
        %  For T - Tails in the abscence of a more rational analysis, the rolling
        %  moment induced by gust load may be computed as follow 
        % 
        %                             rho0
        %  M_rudder = (0.3) * S_ht * ------ * V * U * b_ht * K_gf
        %                               2
        %    
        %  where 
        %
        %  M_rudder = induced roll - moment at horizontal tail (N * m);
        %  K_gf     = gust factor = 1.2; 
        %  b_ht     = span of horizontal tail (m); 
        %  S_ht     = area of horizontal tail (m^2); 
        %  rho0     = density of air at sea level (kg/m^3);
        %  V        = airspeed of flight (m/s);
        %  U        = gust speed (m/s).

        %% CS - VLA 445 OUTBOARD FINS 
        %
        %  (a) If outboard fins are on the horizonta tail surface, the tail
        %      surfaces must be designed for the maximum horizontal surface load in
        %      combination with the corresponding loads induced on the vertical
        %      surfaces by endplates effects. These induced effects need not be
        %      combined with other vertical surface loads. 
        %
        %  (b) If outboard fins extend above and below the horizontal surface, the 
        %      critical vertical surface loading, the load per unit area as
        %      determined under CS - VLA 441 and 443, must be applied to 
        %      (1) the part of the vertical surfaces above the horizontal surface
        %          with 80% of that loading applied to the part below the 
        %          horizontal surface; and 
        %      (2) the part of the vertical surfaces below the horizontal surface
        %          with 80% of that loading applied to the part above the 
        %          horizontal surface. 
        %
        %  (c) The endplate effects of outboard fins must be taken into account in
        %      applying the yawing conditions of CS - VLA 441 and 443 to the
        %      vertical surfaces in sub - paragraph (b) of this paragraph.
 
%% FUNCTION HANDLE 
N_calc = @(q, S_wing, b_wing, CN) q * S_wing * b_wing * CN * 1e-1; % Moment N in [daN * m]

%% VERTICAL TAIL SURFACES 
%  Digitalization of the airworthiness rules for the vertical tail loads
%  calculation and structural sizing. 

disp(" ");
disp(" ++++ STARTING VERTICAL TAIL LOADS CALCULATION ++++ ");
disp(" ");
disp(" ---------------------------------------------------------------- ");
disp(" ++++ CS - VLA 441 - VERTICAL TAIL LOADS - MANOEUVRING LOADS ++++ ");
disp(" ---------------------------------------------------------------- ");

% FLAG - ASSESSMENT OF VERTICAL TAIL CONFIGURATION 
empennage_flag = Aircraft.Geometry.Vertical.empennage_flag.value;
switch (empennage_flag)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
    % SINGLE FIN
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
    case 'Single fin' 

        % INITIALIZATION 
        VC                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.VC.value;
        VD                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.VD.value;
        qA                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value;
        sideslip_angle           = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.sideslip_angle.value;
        nmax                     = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
        Mass_Envelope            = Aircraft.Mass.Mass_Envelope.value;
        WS                       = Aircraft.Performance.Wing_loading.value;
        Manoeuvring_Wing_Loading = nmax * WS;
        S_vt                     = Aircraft.Geometry.Vertical.S.value;
        b_vt                     = Aircraft.Geometry.Vertical.b.value;
        b_wing                   = Aircraft.Geometry.Wing.b.value;
        S_wing                   = Aircraft.Geometry.Wing.S.value;
        S_ratio_vt               = S_vt / S_wing; 
        a_vt_rad                 = Aircraft.Geometry.Vertical.a_vt_rad.value;
        g                        = Aircraft.Constant_values.g.value;
        M_ref_vt                 = ( Manoeuvring_Wing_Loading * S_vt ) / ( g );
        Spanwise_load_ratio_vt   = ( Manoeuvring_Wing_Loading * b_vt ) / ( g );
        croot_vt                 = Aircraft.Geometry.Vertical.croot.value;
        Chordwise_load_ratio_vt  = ( M_ref_vt ) / ( croot_vt );
        max_delta_rudder         = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_delta_rudder.value;
        l_vt_envelope            = Aircraft.Geometry.Vertical.l_vt_envelope.value;
        MAC_vt                   = Aircraft.Geometry.Vertical.MAC.value;
        Ude_cruise               = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value;
        Ude_dive                 = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value;
        rad_of_gyr_vt            = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.radius_of_gyration.value;
        CN_deltar                = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_deltar.value;
        CN_beta                  = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CN_beta.value;

        % STORE INSIDE THE AIRCRAFT STRUCT VARIABLE 
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.value           = Manoeuvring_Wing_Loading;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.Attributes.unit = "Pa";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.value           = S_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.Attributes.unit = "Non dimensional";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.value           = M_ref_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.Attributes.unit = "kg";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.value           = Spanwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.Attributes.unit = "kg/m";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.value           = Chordwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.Attributes.unit = "kg/m";

        %% CS - VLA 441 CASE (a)(1)
        % CALCULATIONS 
        CN_deltar_max   = CN_deltar * max_delta_rudder;
        N_case_a1_daN   = N_calc(qA, S_wing, b_wing, CN_deltar_max);
        N_case_a1_kg    = (( N_case_a1_daN ) / ( g )) * 1e1;
        Y_case_a1 = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Y_case_a1(i) = N_case_a1_daN(i) / l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.N_case_a1_daN.value           = N_case_a1_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.N_case_a1_daN.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.N_case_a1_kg.value            = N_case_a1_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.N_case_a1_kg.Attributes.unit  = "kg * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Y_case_a1.value               = Y_case_a1;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Y_case_a1.Attributes.unit     = "daN";

        %% CS - VLA 441 CASE (a)(2)
        overswing_angle = ( -1.5 ) * sideslip_angle;
        CN_case_a2      = CN_deltar_max + CN_beta * overswing_angle;
        N_case_a2_daN   = N_calc(qA, S_wing, b_wing, CN_case_a2); 
        N_case_a2_kg    = (( N_case_a2_daN ) / ( g )) * 1e1;
        Y_case_a2       = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Y_case_a2(i) = N_case_a2_daN(i) / l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.N_case_a2_daN.value           = N_case_a2_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.N_case_a2_daN.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.N_case_a2_kg.value            = N_case_a2_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.N_case_a2_kg.Attributes.unit  = "kg * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Y_case_a2.value               = Y_case_a2;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Y_case_a2.Attributes.unit     = "daN";

        %% CS - VLA 441 CASE (a)(3)
        CN_case_a3    = CN_beta * sideslip_angle;
        N_case_a3_daN = N_calc(qA, S_wing, b_wing, CN_case_a3);
        N_case_a3_kg  = (( N_case_a3_daN ) / ( g )) * 1e1;
        Y_case_a3     = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Y_case_a3(i) = N_case_a3_daN(i) / l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.N_case_a3_daN.value           = N_case_a3_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.N_case_a3_daN.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.N_case_a3_kg.value            = N_case_a3_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.N_case_a3_kg.Attributes.unit  = "kg * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Y_case_a3.value               = Y_case_a3;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Y_case_a3.Attributes.unit     = "daN";

        %% CS - VLA 443 GUST LOAD 
        
        % STANDARD ATMOSPHERE DENSITY - h = 4000 m
        rho_theoretical = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;

        % GUST CONSTANTS 
        mu_g_vt = zeros(n_Mass,1);
        k_g_vt  = zeros(n_Mass,1);
        for i = 1:n_Mass
            [mu_g_vt(i), k_g_vt(i)] = vertical_tail_gust(Mass_Envelope(i), rho_theoretical, MAC_vt, g, a_vt_rad, S_vt, rad_of_gyr_vt, l_vt_envelope(i));
        end

        % --------------------
        %         VC 
        % --------------------
        gust_load_vt_vc = zeros(n_Mass, 1);
        gust_mom_vt_vc  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vc(i) = Gust_loads_vt(k_g_vt(i), Ude_cruise, VC(i), a_vt_rad, S_vt);
            gust_mom_vt_vc(i)  = gust_load_vt_vc(i) * l_vt_envelope(i);
        end

        % --------------------
        %         VD 
        % --------------------
        gust_load_vt_vd = zeros(n_Mass, 1);
        gust_mom_vt_vd  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vd(i) = Gust_loads_vt(k_g_vt(i), Ude_dive, VD(i), a_vt_rad, S_vt);
            gust_mom_vt_vd(i)  = gust_load_vt_vd(i) * l_vt_envelope(i);
        end

        % STORE INSIDE THE AIRCRAFT STRUCT - VC
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.value           = gust_load_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.value            = gust_mom_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.Attributes.unit  = "daN * m";

        % STORE INSIDE THE AIRCRAFT STRUCT - VD
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.value           = gust_load_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.value            = gust_mom_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.Attributes.unit  = "daN * m";

        %% TOTAL LOADS ON THE VERTICAL TAIL 

        % LATERAL FORCES - VC
        Total_force_vt_case_a1_vc = Y_case_a1 + gust_load_vt_vc;
        Total_force_vt_case_a2_vc = Y_case_a2 + gust_load_vt_vc;
        Total_force_vt_case_a3_vc = Y_case_a3 + gust_load_vt_vc;
        
        % LATERAL FORCES - VD
        Total_force_vt_case_a1_vd = Y_case_a1 + gust_load_vt_vd;
        Total_force_vt_case_a2_vd = Y_case_a2 + gust_load_vt_vd;
        Total_force_vt_case_a3_vd = Y_case_a3 + gust_load_vt_vd;

        % YAW MOMENTS - VC 
        Total_mom_vt_case1_vc = Total_force_vt_case_a1_vc .* l_vt_envelope;
        Total_mom_vt_case2_vc = Total_force_vt_case_a2_vc .* l_vt_envelope;
        Total_mom_vt_case3_vc = Total_force_vt_case_a3_vc .* l_vt_envelope;

        % YAW MOMENTS - VD 
        Total_mom_vt_case1_vd = Total_force_vt_case_a1_vd .* l_vt_envelope;
        Total_mom_vt_case2_vd = Total_force_vt_case_a2_vd .* l_vt_envelope;
        Total_mom_vt_case3_vd = Total_force_vt_case_a3_vd .* l_vt_envelope;

        %% ASSESSING CRITICAL LOADS CONDITIONS 
        % INITIALIZATION 
        Total_force_vc  = zeros(n_Mass, 1);
        Total_moment_vc = zeros(n_Mass, 1);
        Total_force_vd  = zeros(n_Mass, 1);
        Total_moment_vd = zeros(n_Mass, 1);

        for i = 1:n_Mass 

            % VC - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a2_vc(i))) && (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a1_vc(i);
            elseif (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a2_vc(i);
            elseif (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a2_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a3_vc(i);
            end

            % VC - MOMENTS
            if (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case2_vc(i))) && (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case1_vc(i);
            elseif (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case2_vc(i);
            elseif (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case2_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case3_vc(i);
            end
    
            % VD - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a2_vd(i))) && (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a1_vd(i);
            elseif (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a2_vd(i);
            elseif (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a2_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a3_vd(i);
            end
    
            % VD - MOMENTS
            if (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case2_vd(i))) && (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case1_vd(i);
            elseif (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case2_vd(i);
            elseif (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case2_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case3_vd(i);
            end

        end
        % STORE INSIDE THE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.value            = Total_force_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.value           = Total_moment_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.value            = Total_force_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.value           = Total_moment_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.Attributes.unit = "daN * m";

    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
    % DOUBLE FIN
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   
    case 'Double fin'

        % INITIALIZATION 
        VC                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.VC.value;
        VD                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.VD.value;
        qA                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value;
        max_yaw_angle            = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_yaw_angle.value;
        nmax                     = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
        Mass_Envelope            = Aircraft.Mass.Mass_Envelope.value;
        WS                       = Aircraft.Performance.Wing_loading.value;
        Manoeuvring_Wing_Loading = nmax * WS;
        S_vt                     = 2 * Aircraft.Geometry.Vertical.S.value;
        b_vt                     = Aircraft.Geometry.Vertical.b.value;
        S_wing                   = Aircraft.Geometry.Wing.S.value;
        S_ratio_vt               = S_vt / S_wing; 
        a_vt_rad                 = Aircraft.Geometry.Vertical.a_vt_rad.value;
        g                        = Aircraft.Constant_values.g.value;
        M_ref_vt                 = ( Manoeuvring_Wing_Loading * S_vt ) / ( g );
        Spanwise_load_ratio_vt   = ( Manoeuvring_Wing_Loading * b_vt ) / ( g );
        croot_vt                 = Aircraft.Geometry.Vertical.croot.value;
        Chordwise_load_ratio_vt  = ( M_ref_vt ) / ( croot_vt );
        CY0                      = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY0.value;
        CYdr                     = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CYdr.value;
        CY_VTP_case_a2           = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY_VTP_case_a2.value;
        CY_VTP_case_a3           = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY_VTP_case_a3.value;
        max_delta_rudder         = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_delta_rudder.value;
        l_vt_envelope            = Aircraft.Geometry.Vertical.l_vt_envelope.value;
        MAC_vt                   = Aircraft.Geometry.Vertical.MAC.value;
        Ude_cruise               = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value;
        Ude_dive                 = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value;
        rad_of_gyr_vt            = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.radius_of_gyration.value;

        % STORE INSIDE THE AIRCRAFT STRUCT VARIABLE 
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.value           = Manoeuvring_Wing_Loading;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.Attributes.unit = "Pa";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.value           = S_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.Attributes.unit = "Non dimensional";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.value           = M_ref_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.Attributes.unit = "kg";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.value           = Spanwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.Attributes.unit = "kg/m";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.value           = Chordwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.Attributes.unit = "kg/m";

        %% CS - VLA 441 CASE (a)(1)
        % CALCULATIONS 
        CY                                = CY0 + CYdr * max_delta_rudder;
        CY_divided_by_S_ratio_vt_case_a1  = CY / S_ratio_vt;
        Lateral_force_case_a1_daN         = qA * S_vt * CY_divided_by_S_ratio_vt_case_a1 * 1e-1;
        Lateral_force_case_a1_kg          = (( Lateral_force_case_a1_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a1                   = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a1(i) = Lateral_force_case_a1_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_daN.value           = Lateral_force_case_a1_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_kg.value            = Lateral_force_case_a1_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Yaw_mom_case_a1.value                     = Yaw_mom_case_a1;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Yaw_mom_case_a1.Attributes.unit           = "daN * m";

        %% CS - VLA 441 CASE (a)(2)
        yaw_angle_case_a2                = 1.3 * max_yaw_angle;
        CY_divided_by_S_ratio_vt_case_a2 = CY_VTP_case_a2 / S_ratio_vt;
        Lateral_force_case_a2_daN        = qA * S_vt * CY_divided_by_S_ratio_vt_case_a2 * 1e-1;
        Lateral_force_case_a2_kg         = (( Lateral_force_case_a2_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a2                  = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a2(i) = Lateral_force_case_a2_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_daN.value           = Lateral_force_case_a2_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_kg.value            = Lateral_force_case_a2_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Yaw_mom_case_a2.value                     = Yaw_mom_case_a2;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Yaw_mom_case_a2.Attributes.unit           = "daN * m";

        %% CS - VLA 441 CASE (a)(3)
        yaw_angle_case_a3                = max_yaw_angle;
        CY_divided_by_S_ratio_vt_case_a3 = CY_VTP_case_a3 / S_ratio_vt;
        Lateral_force_case_a3_daN        = qA * S_vt * CY_divided_by_S_ratio_vt_case_a3 * 1e-1;
        Lateral_force_case_a3_kg         = (( Lateral_force_case_a3_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a3                  = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a3(i) = Lateral_force_case_a3_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_daN.value           = Lateral_force_case_a3_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_kg.value            = Lateral_force_case_a3_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Yaw_mom_case_a3.value                     = Yaw_mom_case_a3;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Yaw_mom_case_a3.Attributes.unit           = "daN * m";

        %% CS - VLA 443 GUST LOAD 
        
        % STANDARD ATMOSPHERE DENSITY - h = 4000 m
        rho_theoretical = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;

        % GUST CONSTANTS 
        mu_g_vt = zeros(n_Mass,1);
        k_g_vt  = zeros(n_Mass,1);
        for i = 1:n_Mass
            [mu_g_vt(i), k_g_vt(i)] = vertical_tail_gust(Mass_Envelope(i), rho_theoretical, MAC_vt, g, a_vt_rad, S_vt, rad_of_gyr_vt, l_vt_envelope(i));
        end

        % --------------------
        %         VC 
        % --------------------
        gust_load_vt_vc = zeros(n_Mass, 1);
        gust_mom_vt_vc  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vc(i) = Gust_loads_vt(k_g_vt(i), Ude_cruise, VC(i), a_vt_rad, S_vt);
            gust_mom_vt_vc(i)  = gust_load_vt_vc(i) * l_vt_envelope(i);
        end

        % --------------------
        %         VD 
        % --------------------
        gust_load_vt_vd = zeros(n_Mass, 1);
        gust_mom_vt_vd  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vd(i) = Gust_loads_vt(k_g_vt(i), Ude_dive, VD(i), a_vt_rad, S_vt);
            gust_mom_vt_vd(i)  = gust_load_vt_vd(i) * l_vt_envelope(i);
        end

        % STORE INSIDE THE AIRCRAFT STRUCT - VC
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.value           = gust_load_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.value            = gust_mom_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.Attributes.unit  = "daN * m";

        % STORE INSIDE THE AIRCRAFT STRUCT - VD
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.value           = gust_load_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.value            = gust_mom_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.Attributes.unit  = "daN * m";

        %% TOTAL LOADS ON THE VERTICAL TAIL 

        % LATERAL FORCES - VC
        Total_force_vt_case_a1_vc = Lateral_force_case_a1_daN + gust_load_vt_vc;
        Total_force_vt_case_a2_vc = Lateral_force_case_a2_daN + gust_load_vt_vc;
        Total_force_vt_case_a3_vc = Lateral_force_case_a2_daN + gust_load_vt_vc;
        
        % LATERAL FORCES - VD
        Total_force_vt_case_a1_vd = Lateral_force_case_a1_daN + gust_load_vt_vd;
        Total_force_vt_case_a2_vd = Lateral_force_case_a2_daN + gust_load_vt_vd;
        Total_force_vt_case_a3_vd = Lateral_force_case_a2_daN + gust_load_vt_vd;

        % YAW MOMENTS - VC 
        Total_mom_vt_case1_vc = Total_force_vt_case_a1_vc .* l_vt_envelope;
        Total_mom_vt_case2_vc = Total_force_vt_case_a2_vc .* l_vt_envelope;
        Total_mom_vt_case3_vc = Total_force_vt_case_a3_vc .* l_vt_envelope;

        % YAW MOMENTS - VD 
        Total_mom_vt_case1_vd = Total_force_vt_case_a1_vd .* l_vt_envelope;
        Total_mom_vt_case2_vd = Total_force_vt_case_a2_vd .* l_vt_envelope;
        Total_mom_vt_case3_vd = Total_force_vt_case_a3_vd .* l_vt_envelope;

        %% ASSESSING CRITICAL LOADS CONDITIONS 
        % INITIALIZATION 
        Total_force_vc  = zeros(n_Mass, 1);
        Total_moment_vc = zeros(n_Mass, 1);
        Total_force_vd  = zeros(n_Mass, 1);
        Total_moment_vd = zeros(n_Mass, 1);

        for i = 1:n_Mass 

            % VC - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a2_vc(i))) && (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a1_vc(i);
            elseif (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a2_vc(i);
            elseif (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a2_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a3_vc(i);
            end

            % VC - MOMENTS
            if (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case2_vc(i))) && (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case1_vc(i);
            elseif (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case2_vc(i);
            elseif (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case2_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case3_vc(i);
            end
    
            % VD - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a2_vd(i))) && (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a1_vd(i);
            elseif (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a2_vd(i);
            elseif (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a2_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a3_vd(i);
            end
    
            % VD - MOMENTS
            if (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case2_vd(i))) && (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case1_vd(i);
            elseif (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case2_vd(i);
            elseif (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case2_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case3_vd(i);
            end

        end
        % STORE INSIDE THE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.value            = Total_force_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.value           = Total_moment_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.value            = Total_force_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.value           = Total_moment_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.Attributes.unit = "daN * m";

    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++       
    % MULTIPLE FINS
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++    
    case 'Multiple fin'

        % INITIALIZATION 
        if isfield(Aircraft.Geometry.Vertical, 'number_of_fin') == 1
            n_fin                    = Aircraft.Geometry.Vertical.number_of_fin.value;
        elseif isfield(Aircraft.Geometry.Vertical, 'number_of_fin') == 0
            disp(" Select number of fin: ")
            n_fin = input(" n_fin: ");
            Aircraft.Geometry.Vertical.number_of_fin.value           = n_fin;
            Aircraft.Geometry.Vertical.number_of_fin.Attributes.unit = "Pure number";
        end
        VC                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.VC.value;
        VD                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.VD.value;
        qA                       = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value;
        max_yaw_angle            = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_yaw_angle.value;
        nmax                     = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
        Mass_Envelope            = Aircraft.Mass.Mass_Envelope.value;
        WS                       = Aircraft.Performance.Wing_loading.value;
        Manoeuvring_Wing_Loading = nmax * WS;
        S_vt                     = n_fin * Aircraft.Geometry.Vertical.S.value;
        b_vt                     = Aircraft.Geometry.Vertical.b.value;
        S_wing                   = Aircraft.Geometry.Wing.S.value;
        S_ratio_vt               = S_vt / S_wing; 
        a_vt_rad                 = Aircraft.Geometry.Vertical.a_vt_rad.value;
        g                        = Aircraft.Constant_values.g.value;
        M_ref_vt                 = ( Manoeuvring_Wing_Loading * S_vt ) / ( g );
        Spanwise_load_ratio_vt   = ( Manoeuvring_Wing_Loading * b_vt ) / ( g );
        croot_vt                 = Aircraft.Geometry.Vertical.croot.value;
        Chordwise_load_ratio_vt  = ( M_ref_vt ) / ( croot_vt );
        CY0                      = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY0.value;
        CYdr                     = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CYdr.value;
        CY_VTP_case_a2           = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY_VTP_case_a2.value;
        CY_VTP_case_a3           = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.CY_VTP_case_a3.value;
        max_delta_rudder         = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.max_delta_rudder.value;
        l_vt_envelope            = Aircraft.Geometry.Vertical.l_vt_envelope.value;
        MAC_vt                   = Aircraft.Geometry.Vertical.MAC.value;
        Ude_cruise               = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value;
        Ude_dive                 = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value;
        rad_of_gyr_vt            = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.radius_of_gyration.value;

        % STORE INSIDE THE AIRCRAFT STRUCT VARIABLE 
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.value           = Manoeuvring_Wing_Loading;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Manoeuvring_Wing_Loading.Attributes.unit = "Pa";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.value           = S_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio_vt.Attributes.unit = "Non dimensional";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.value           = M_ref_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.M_ref_vt.Attributes.unit = "kg";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.value           = Spanwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Spanwise_load_ratio_vt.Attributes.unit = "kg/m";

        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.value           = Chordwise_load_ratio_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Chordwise_load_ratio_vt.Attributes.unit = "kg/m";

        %% CS - VLA 441 CASE (a)(1)
        % CALCULATIONS 
        CY                                = CY0 + CYdr * max_delta_rudder;
        CY_divided_by_S_ratio_vt_case_a1  = CY / S_ratio_vt;
        Lateral_force_case_a1_daN         = qA * S_vt * CY_divided_by_S_ratio_vt_case_a1 * 1e-1;
        Lateral_force_case_a1_kg          = (( Lateral_force_case_a1_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a1                   = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a1(i) = Lateral_force_case_a1_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_daN.value           = Lateral_force_case_a1_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_kg.value            = Lateral_force_case_a1_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Lateral_force_case_a1_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Yaw_mom_case_a1.value                     = Yaw_mom_case_a1;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a1.Yaw_mom_case_a1.Attributes.unit           = "daN * m";

        %% CS - VLA 441 CASE (a)(2)
        yaw_angle_case_a2                = 1.3 * max_yaw_angle;
        CY_divided_by_S_ratio_vt_case_a2 = CY_VTP_case_a2 / S_ratio_vt;
        Lateral_force_case_a2_daN        = qA * S_vt * CY_divided_by_S_ratio_vt_case_a2 * 1e-1;
        Lateral_force_case_a2_kg         = (( Lateral_force_case_a2_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a2                  = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a2(i) = Lateral_force_case_a2_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_daN.value           = Lateral_force_case_a2_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_kg.value            = Lateral_force_case_a2_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Lateral_force_case_a2_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Yaw_mom_case_a2.value                     = Yaw_mom_case_a2;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a2.Yaw_mom_case_a2.Attributes.unit           = "daN * m";

        %% CS - VLA 441 CASE (a)(3)
        yaw_angle_case_a3                = max_yaw_angle;
        CY_divided_by_S_ratio_vt_case_a3 = CY_VTP_case_a3 / S_ratio_vt;
        Lateral_force_case_a3_daN        = qA * S_vt * CY_divided_by_S_ratio_vt_case_a3 * 1e-1;
        Lateral_force_case_a3_kg         = (( Lateral_force_case_a3_daN ) / ( g )) * 1e1;
        Yaw_mom_case_a3                  = zeros(n_Mass, 1);
        for i = 1:n_Mass 
            Yaw_mom_case_a3(i) = Lateral_force_case_a3_daN(i) * l_vt_envelope(i);
        end
        
        % STORE INSIDE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_daN.value           = Lateral_force_case_a3_daN;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_daN.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_kg.value            = Lateral_force_case_a3_kg;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Lateral_force_case_a3_kg.Attributes.unit  = "kg";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Yaw_mom_case_a3.value                     = Yaw_mom_case_a3;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a3.Yaw_mom_case_a3.Attributes.unit           = "daN * m";

        %% CS - VLA 443 GUST LOAD 
        
        % STANDARD ATMOSPHERE DENSITY - h = 4000 m
        rho_theoretical = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;

        % GUST CONSTANTS 
        mu_g_vt = zeros(n_Mass,1);
        k_g_vt  = zeros(n_Mass,1);
        for i = 1:n_Mass
            [mu_g_vt(i), k_g_vt(i)] = vertical_tail_gust(Mass_Envelope(i), rho_theoretical, MAC_vt, g, a_vt_rad, S_vt, rad_of_gyr_vt, l_vt_envelope(i));
        end

        % --------------------
        %         VC 
        % --------------------
        gust_load_vt_vc = zeros(n_Mass, 1);
        gust_mom_vt_vc  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vc(i) = Gust_loads_vt(k_g_vt(i), Ude_cruise, VC(i), a_vt_rad, S_vt);
            gust_mom_vt_vc(i)  = gust_load_vt_vc(i) * l_vt_envelope(i);
        end

        % --------------------
        %         VD 
        % --------------------
        gust_load_vt_vd = zeros(n_Mass, 1);
        gust_mom_vt_vd  = zeros(n_Mass, 1);
        for i = 1:n_Mass
            gust_load_vt_vd(i) = Gust_loads_vt(k_g_vt(i), Ude_dive, VD(i), a_vt_rad, S_vt);
            gust_mom_vt_vd(i)  = gust_load_vt_vd(i) * l_vt_envelope(i);
        end

        % STORE INSIDE THE AIRCRAFT STRUCT - VC
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.value           = gust_load_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_load_vt_vc.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.value            = gust_mom_vt_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vc.gust_mom_vt_vc.Attributes.unit  = "daN * m";

        % STORE INSIDE THE AIRCRAFT STRUCT - VD
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.value                   = mu_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.mu_g_vt.Attributes.unit         = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.value                    = k_g_vt;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.k_g_vt.Attributes.unit          = "Non dimensional";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.value           = gust_load_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_load_vt_vd.Attributes.unit = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.value            = gust_mom_vt_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Gustloads.vd.gust_mom_vt_vd.Attributes.unit  = "daN * m";

        %% TOTAL LOADS ON THE VERTICAL TAIL 

        % LATERAL FORCES - VC
        Total_force_vt_case_a1_vc = Lateral_force_case_a1_daN + gust_load_vt_vc;
        Total_force_vt_case_a2_vc = Lateral_force_case_a2_daN + gust_load_vt_vc;
        Total_force_vt_case_a3_vc = Lateral_force_case_a2_daN + gust_load_vt_vc;
        
        % LATERAL FORCES - VD
        Total_force_vt_case_a1_vd = Lateral_force_case_a1_daN + gust_load_vt_vd;
        Total_force_vt_case_a2_vd = Lateral_force_case_a2_daN + gust_load_vt_vd;
        Total_force_vt_case_a3_vd = Lateral_force_case_a2_daN + gust_load_vt_vd;

        % YAW MOMENTS - VC 
        Total_mom_vt_case1_vc = Total_force_vt_case_a1_vc .* l_vt_envelope;
        Total_mom_vt_case2_vc = Total_force_vt_case_a2_vc .* l_vt_envelope;
        Total_mom_vt_case3_vc = Total_force_vt_case_a3_vc .* l_vt_envelope;

        % YAW MOMENTS - VD 
        Total_mom_vt_case1_vd = Total_force_vt_case_a1_vd .* l_vt_envelope;
        Total_mom_vt_case2_vd = Total_force_vt_case_a2_vd .* l_vt_envelope;
        Total_mom_vt_case3_vd = Total_force_vt_case_a3_vd .* l_vt_envelope;

        %% ASSESSING CRITICAL LOADS CONDITIONS 
        % INITIALIZATION 
        Total_force_vc  = zeros(n_Mass, 1);
        Total_moment_vc = zeros(n_Mass, 1);
        Total_force_vd  = zeros(n_Mass, 1);
        Total_moment_vd = zeros(n_Mass, 1);

        for i = 1:n_Mass 

            % VC - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a2_vc(i))) && (abs(Total_force_vt_case_a1_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a1_vc(i);
            elseif (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a2_vc(i)) >= abs(Total_force_vt_case_a3_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a2_vc(i);
            elseif (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a1_vc(i))) && (abs(Total_force_vt_case_a3_vc(i)) >= abs(Total_force_vt_case_a2_vc(i)))
                Total_force_vc(i) = Total_force_vt_case_a3_vc(i);
            end

            % VC - MOMENTS
            if (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case2_vc(i))) && (abs(Total_mom_vt_case1_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case1_vc(i);
            elseif (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case2_vc(i)) >= abs(Total_mom_vt_case3_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case2_vc(i);
            elseif (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case1_vc(i))) && (abs(Total_mom_vt_case3_vc(i)) >= abs(Total_mom_vt_case2_vc(i)))
                Total_moment_vc(i) = Total_mom_vt_case3_vc(i);
            end
    
            % VD - LATERAL FORCES
            if (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a2_vd(i))) && (abs(Total_force_vt_case_a1_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a1_vd(i);
            elseif (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a2_vd(i)) >= abs(Total_force_vt_case_a3_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a2_vd(i);
            elseif (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a1_vd(i))) && (abs(Total_force_vt_case_a3_vd(i)) >= abs(Total_force_vt_case_a2_vd(i)))
                Total_force_vd(i) = Total_force_vt_case_a3_vd(i);
            end
    
            % VD - MOMENTS
            if (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case2_vd(i))) && (abs(Total_mom_vt_case1_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case1_vd(i);
            elseif (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case2_vd(i)) >= abs(Total_mom_vt_case3_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case2_vd(i);
            elseif (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case1_vd(i))) && (abs(Total_mom_vt_case3_vd(i)) >= abs(Total_mom_vt_case2_vd(i)))
                Total_moment_vd(i) = Total_mom_vt_case3_vd(i);
            end

        end
        % STORE INSIDE THE STRUCT VARIABLE
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.value            = Total_force_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.value           = Total_moment_vc;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vc.Total_moment.Attributes.unit = "daN * m";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.value            = Total_force_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_force.Attributes.unit  = "daN";
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.value           = Total_moment_vd;
        Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Critical_conditions.vd.Total_moment.Attributes.unit = "daN * m";
end

%% PLOT RESULTS 
PlotVerticalTailResults