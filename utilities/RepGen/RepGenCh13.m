%% CHAPTER 13 - Loads on the wing flaps
%Ref EASA/Tecnam p2006 report

import mlreportgen.report.*  % import report API(report related methods
% @see https://it.mathworks.com/help/rptgen/ug/mlreportgen.report.report-class.html?searchHighlight=mlreportgen.report&s_tid=doc_srchtitle#mw_63820826-78dc-459b-a646-67d4d77f91e5 )
import mlreportgen.dom.*     % import document object model DOM API (DOM related method
% @see https://it.mathworks.com/help/search.html?qdoc=mlreportgen.dom&submitsearch=)
import mlreportgen.utils.*

% CSVLA REQUIREMENT 
requirement = Aircraft.Certification.Regulation.value;
% CS-VLA 445(a)
airworth_rule_nmax = Aircraft.Certification.Regulation.SubpartC.Flapsloads.nmax.Attributes.cs;

% chapter_number = 13;
% ch = strcat('ch' , num2str(chapter_number)); 
ch = Chapter();
ch.Title = 'Loads on the wing flaps';
disp(['Chapter 13', (' "'), ch.Title,('" ') ,'writing...' ])

str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(airworth_rule_nmax) ...
    (' ') ...
    ', if flaps or similar high lift devices to be used for take-off, ' ...
    'approach or landing are installed, the aeroplane, with the flaps' ...
    ' fully deflected at VF, is assumed to be subjected to symmetrical' ...
    ' manoeuvres and gusts resulting in limit load factors within the' ...
    ' range determined by (1) Manoeuvring to a positive limit load factor' ...
    ' of 2.0 (2) Positive and negative gust of 7.62 m/s acting normal' ...
    ' to the flight path in level flight.' ];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(ch,para);

wing_flaps_reg = Aircraft.Certification.Regulation.SubpartC.Flapsloads.wing_flaps_reg.Attributes.cs;
%sec
sec = Section();
sec.Title = 'Manouevring load';
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       char(wing_flaps_reg) ...
       (' ') ...
       ', the wing flpas, their operating mechanisms and their supporting' ...
       ' structure will be analyzed at two deflection angle, namely takeoff' ...
       ' and landing position.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);

max_lift_coefficient_takeoff = Aircraft.Certification.Aerodynamic_data.Flaps.CLMAX_takeoff.value;
min_stallspeed_takeoff       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.PointS.VS.value;
stallspeed_unit_takeoff      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.PointS.VS.Attributes.unit;
%sub
% -------------------------------------------------------------------------
subsec = Section();
subsec.Title = 'Takeoff';
str = ['The flaps V-n diagram relative to the takeoff configuration' ...
    ' is shown in this subsection; the estimated maximum lift coefficient' ...
    ' in this configuration is' ...
    (' ') ...
    strcat(num2str(max_lift_coefficient_takeoff,4)) ...
    (' ') ...
    ' corresponding to a stall speed equal to' ...
    (' ') ...
    strcat(num2str(min_stallspeed_takeoff,4)) ...
    (' ') ...
    char(stallspeed_unit_takeoff) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flapsenvelopediagramtakeoff.png']);
        fig.Caption = 'Flaps V-n diagram. Takeoff.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps V-n diagram takeoff';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flaps_gust_envelopediagramtakeoff.png']);
        fig.Caption = 'Flaps gust envelope diagram. Takeoff.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps gust envelope diagram takeoff';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flaps_final_envelopediagramtakeoff.png']);
        fig.Caption = 'Flaps final envelope diagram. Takeoff.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps final envelope diagram takeoff';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% -------------------------------------------------------------------------
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    add(sec,subsec);
% -------------------------------------------------------------------------    
% add(ch,sec);
% -------------------------------------------------------------------------

% LANDING
max_lift_coefficient_landing = Aircraft.Certification.Aerodynamic_data.Flaps.CLMAX_landing.value;
min_stallspeed_landing       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.PointS.VS.value;
% -------------------------------------------------------------------------
subsec = Section();
subsec.Title = 'Landing';
str = ['The flaps V-n diagram relative to the landing configuration' ...
    ' is shown in this subsection; the estimated maximum lift coefficient' ...
    ' in this configuration is' ...
    (' ') ...
    strcat(num2str(max_lift_coefficient_takeoff,4)) ...
    (' ') ...
    ' corresponding to a stall speed equal to' ...
    (' ') ...
    strcat(num2str(min_stallspeed_takeoff,4)) ...
    (' ') ...
    char(stallspeed_unit_takeoff) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flapsenvelopediagramlanding.png']);
        fig.Caption = 'Flaps V-n diagram. Landing.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps V-n diagram landing';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++  
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flaps_gust_envelopediagramlanding.png']);
        fig.Caption = 'Flaps gust envelope diagram. Landing.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps gust envelope diagram landing';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'flaps_final_envelopediagramlanding.png']);
        fig.Caption = 'Flaps final envelope diagram. Landing.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Flaps final envelope diagram landing';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    add(sec,subsec);
    % ---------------------------------------------------------------------
    subsec = Section();
    subsec.Title = 'Summary of flaps load';
    str = ['A diagram of the flaps load calculations is shown. The clean' ...
        ' positive attitude flight envelope of the aircraft is also represented' ...
        ' for reference. The data relative to these calculations are summarized' ...
        ' in table form, for takeoff and landing configurations, respectively.'];
    para = Paragraph(str);
    para.Style = {HAlign('justify')};
    add(subsec,para);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %moving to another path for figure
        cd ..
        cd ..
        regulation = Aircraft.Certification.Regulation.value;
        results_path = [pwd '\' regulation '\Output\'];
        
        cd (RepDir);
        
        fig = FormalImage([results_path,'Superposition.png']);
        fig.Caption = 'Summary of flaps flight load.';
        fig.Height = '5in';
        %fig.Width = '4in';
        fig.LinkTarget='Summary of flaps flight load';
        add(subsec,fig);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % ---------------------------------------------------------------------
    add(sec,subsec);
% -------------------------------------------------------------------------    
add(ch,sec);
% -------------------------------------------------------------------------
% In the following switch case it is possible to cover all the possible
% case relative to the flaps flight envelope.
% -------------------------------------------------------------------------
% switch (Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.case.value)
%     case 'Case 1'
        % -------------------------------------------------------------------------
        % TAKEOFF
        % -------------------------------------------------------------------------
        mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.mu_g.value;
        kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.Kg.value;
        point_S = "Point S";
        vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.value(end);
        vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.Attributes.unit;
        ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.value(end);
        ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.Attributes.unit;
        point_A = "Point A";
        va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.value(end);
        % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.Attributes.unit;
        na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.value(end);
        % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.Attributes.unit;
        point_F = "Point F";
        if isfield(Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope, 'PointF1') == 1
            nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.PointF1.nF1.value;
        % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF.Attributes.unit;
            vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.PointF1.VF1.value;
        % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF.Attributes.unit;
        else 
            nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.PointF.nF.value;
            vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.PointF.VF.value;
        end
        % ------------------------------------------------------------------------- 
        % -------------------------------------------------------------------------       
        rho0     = Aircraft.Certification.ISA_Condition.Sea_Level.rho0.value;
        rho      = Aircraft.Certification.ISA_Condition.Operative_ceiling.rho0.value;
        rho_unit = Aircraft.Certification.ISA_Condition.Operative_ceiling.rho0.Attributes.unit;
        Ude      = 7.62; % Gust speed for flaps calculations m/s
        g        = Aircraft.Constants.g.value;
        S        = Aircraft.Geometry.Wing.S.value;
        Mass     = Aircraft.Weight.I_Level.W_maxTakeOff.value;
        WS       = Mass / S;
        WS_unit  = "kg/m^2";
        altitude = Aircraft.Certification.ISA_Condition.Operative_ceiling.Altitude.value;
        alt_un   = Aircraft.Certification.ISA_Condition.Operative_ceiling.Altitude.Attributes.unit;
        % ------------------------------------------------------------------------- 
        mtow    = Aircraft.Weight.I_Level.W_maxTakeOff.value;
        mtow_un = Aircraft.Weight.I_Level.W_maxTakeOff.Attributes.unit;
        % -----------------------------------------------------------------
        %table gust calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(sec,para);  
        % -----------------------------------------------------------------
        header = {'ID',strcat('V(',vc_un,')'), strcat('M(',mtow_un,')'),...
                strcat('M/S(',mtow_un,'/',s_un,')'), strcat('Altitude(',altitude_un,')'),...
                strcat('rho(',rho_un,')'),'mug', 'Kg', strcat('Ude(',gustc_un,')') , 'n'};
%         header = {'Point', strcat('V(',vs_unit,')'), strcat('n(',ns_unit,')'), ...
%                   strcat('mug'), strcat('Kg'), strcat('Ude(',vs_unit,')'), ...
%                   strcat('WS(',WS_unit,')'), strcat('rho(',rho_unit,')'), ...
%                   strcat('altitude(',alt_un,')')};
        %each table row needs of a fieldValue
        %1
        name       = {char(point_S); char(point_A); char(point_F)};
        speeds     = {num2str(vs,4); num2str(va,4); num2str(vf,4)};
        vec_mass   = {num2str(mtow,4);  num2str(mtow,4);  num2str(mtow,4) };
        load_fact  = {num2str(ns,4); num2str(na,4); num2str(nf,4)};
        vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
        vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
        vec_Ude    = {num2str(Ude,4); num2str(Ude,4); num2str(Ude,4)};
        vec_WS     = {num2str(WS,4);  num2str(WS,4);  num2str(WS,4) };
        vec_rho    = {num2str(rho,4); num2str(rho,4); num2str(rho,4)};
        vec_alt    = {num2str(altitude,4); num2str(altitude,4); num2str(altitude,4)};
        fieldValue = [name, speeds, vec_mass, vec_WS, vec_alt, vec_rho, ...
                      vec_mug, vec_kg, vec_Ude, load_fact];
    
          
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Flaps envelope points summary at takeoff.');
        tbl.LinkTarget = 'flapenvpointstakeoff';
        add(sec,tbl);
        % -----------------------------------------------------------------
        % -------------------------------------------------------------------------    
        % -------------------------------------------------------------------------
        % LANDING
        % -------------------------------------------------------------------------
        mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.mu_g.value;
        kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.Kg.value;
        point_S = "Point S";
        vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.value(end);
        vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.Attributes.unit;
        ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.value(end);
        ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.Attributes.unit;
        point_A = "Point A";
        va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.value(end);
        % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.Attributes.unit;
        na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.value(end);
        % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.Attributes.unit;
        point_F = "Point F";
        % -----------------------------------------------------------------------------------------------------------------
        if isfield(Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope, 'PointF1') == 1
            nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.PointF1.nF1.value;
        % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF.Attributes.unit;
            vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.PointF1.VF1.value;
        % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF.Attributes.unit;
        else 
            nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.PointF.nF.value;
            vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.PointF.VF.value;
        end
        % ------------------------------------------------------------------------- 
        % -----------------------------------------------------------------------------------------------------------------
        % -------------------------------------------------------------------------       
        rho0     = Aircraft.Certification.ISA_Condition.Sea_Level.rho0.value;
        rho      = Aircraft.Certification.ISA_Condition.Operative_ceiling.rho0.value;
        rho_unit = Aircraft.Certification.ISA_Condition.Operative_ceiling.rho0.Attributes.unit;
        Ude      = 7.62; % Gust speed for flaps calculations m/s
        g        = Aircraft.Constants.g.value;
        S        = Aircraft.Geometry.Wing.S.value;
        Mass     = Aircraft.Weight.I_Level.W_maxTakeOff.value;
        WS       = Mass / S;
        WS_unit  = "kg/m^2";
        altitude = Aircraft.Certification.ISA_Condition.Operative_ceiling.Altitude.value;
        alt_un   = Aircraft.Certification.ISA_Condition.Operative_ceiling.Altitude.Attributes.unit;
        % ------------------------------------------------------------------------- 
        % -----------------------------------------------------------------
        %table gust calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(sec,para);  
        % -----------------------------------------------------------------
        mtow    = Aircraft.Weight.I_Level.W_maxTakeOff.value;
        mtow_un = Aircraft.Weight.I_Level.W_maxTakeOff.Attributes.unit;
        % -----------------------------------------------------------------
        header = {'ID',strcat('V(',vc_un,')'), strcat('M(',mtow_un,')'),...
                strcat('M/S(',mtow_un,'/',s_un,')'), strcat('Altitude(',altitude_un,')'),...
                strcat('rho(',rho_un,')'),'mug', 'Kg', strcat('Ude(',gustc_un,')') , 'n'};

        %each table row needs of a fieldValue
        %1
        name       = {char(point_S);  char(point_A);  char(point_F) };
        speeds     = {num2str(vs,4);  num2str(va,4);  num2str(vf,4) };
        vec_mass   = {num2str(mtow,4);  num2str(mtow,4);  num2str(mtow,4) };
        load_fact  = {num2str(ns,4);  num2str(na,4);  num2str(nf,4) };
        vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
        vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
        vec_Ude    = {num2str(Ude,4); num2str(Ude,4); num2str(Ude,4)};
        vec_WS     = {num2str(WS,4);  num2str(WS,4);  num2str(WS,4) };
        vec_rho    = {num2str(rho,4); num2str(rho,4); num2str(rho,4)};
        vec_alt    = {num2str(altitude,4); num2str(altitude,4); num2str(altitude,4)};
        fieldValue = [name, speeds, vec_mass, vec_WS, vec_alt, vec_rho, ...
                      vec_mug, vec_kg, vec_Ude, load_fact];
        % ----------------------------------------------------------------------------
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Flaps envelope points summary at landing.');
        tbl.LinkTarget = 'flapenvpointslanding';
        add(sec,tbl);
        % -----------------------------------------------------------------
%     case 'Case 2'
%         % -----------------------------------------------------------------
%         % STARTING THE FIRST IF
%         % -----------------------------------------------------------------
%         obj           = csvla;
%         % FLAPS DEPLOYED GUST ENVELOPE 
%         Mass          = Aircraft.Weight.I_Level.W_maxTakeOff.value;
%         numb          = 1e3;
%         nmax          = Aircraft.Certification.Regulation.SubpartC.Flapsloads.nmax.value; 
%         VA            = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.PointA.VA.value;
%         VF            = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.PointF.VF.value;
%         rho0          = Aircraft.Certification.ISA_Condition.Sea_Level.rho0.value;
%         rho           = Aircraft.Certification.ISA_Condition.Operative_ceiling.rho0.value;
%         S             = Aircraft.Geometry.Wing.S.value;
%         b             = Aircraft.Geometry.Wing.b.value;
%         MGC           = S / b;
%         CLalfa_rad    = Aircraft.Certification.Aerodynamic_data.Normal_Force_Curve_Slope.value;
%         g             = Aircraft.Constants.g.value;
%         Ude           = 7.62; % Gust magnitude
%         WS            = ( Mass * g ) / S;
% 
%         % CALCULATION OF THE MASS FACTOR
%         % mu_g = calcmug(obj, WS, MGC, CLalfa_rad, rho0, g);
%         mu_g = calcmug(obj, WS, MGC, CLalfa_rad, rho, g); 
% 
%         % GUST ALLEVIATION FACTOR 
%         Kg   = calckg(obj, mu_g);
% 
%         % CALCULATION OF THE GUST LOAD FACTOR AT V = VF 
%         nGUST_plus     = @(V) 1.0 + V .* ((0.5 * rho0 * CLalfa_rad * Kg * Ude) / ( WS ));
%         V_gust         = linspace(VA, VF, 1e3*numb)'; 
%         n_g_plus       = nGUST_plus(V_gust);
%         % -----------------------------------------------------------------
%         % NGUST GREATER THAN NMAX
%         % -----------------------------------------------------------------
%         if abs(n_g_plus) > nmax 
%             % -------------------------------------------------------------
%             % -------------------------------------------------------------------------
%             % TAKEOFF
%             % -------------------------------------------------------------------------
%             mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.mu_g.value;
%             kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.Kg.value;
%             point_S = "Point S";
%             vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.value(end);
%             vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.Attributes.unit;
%             ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.value(end);
%             ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.Attributes.unit;
%             point_A = "Point A";
%             va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.value(end);
%             % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.Attributes.unit;
%             na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.value(end);
%             % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.Attributes.unit;
%             point_F1  = "Point F1";
%             vf1       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF1.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF1.Attributes.unit;
%             nf1       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF1.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF1.Attributes.unit;
%             point_F   = "Point F";
%             vf        = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromF1toF.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromF1toF.Attributes.unit;
%             nf        = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromF1toF.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromF1toF.Attributes.unit;
%             % ------------------------------------------------------------------------- 
%             % -----------------------------------------------------------------
%             %table gust calculation        
%             str = ['TABLE TO BE CHECKED!!!'];
%             para = Paragraph(str);
%             para.Style = {HAlign('justify')};
%             para.BackgroundColor = "red";
%             add(sec,para);  
%             % -----------------------------------------------------------------
%             header = {'Point', strcat('V(',vs_unit,')'), strcat('n(',ns_unit,')')};
%             %each table row needs of a fieldValue
%             %1
%             name       = {char(point_S); char(point_A);   char(point_F1); char(point_F)};
%             speeds     = {num2str(vs,4); num2str(va,4);   num2str(vf1,4); num2str(vf,4)};
%             load_fact  = {num2str(ns,4); num2str(na,4);   num2str(nf1,4); num2str(nf,4)};
%             vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%             vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%             fieldValue = [name, speeds, load_fact, vec_mug, vec_kg];
% 
% 
%             tbl = FormalTable(header,fieldValue);
%             % In order to put a table with a caption, the API Report denomination should
%             % be used, the other options are from API DOM. In order to solve the problem,
%             % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
%             tbl = BaseTable(tbl);
%             tbl.Title = strcat('Flaps envelope points summary at takeoff.');
%             tbl.LinkTarget = 'flapenvpointstakeoff';
%             add(sec,tbl);
%             % -----------------------------------------------------------------
%             % -------------------------------------------------------------------------    
%             % -------------------------------------------------------------------------
%             % LANDING
%             % -------------------------------------------------------------------------
%             mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.mu_g.value;
%             kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.Kg.value;
%             point_S = "Point S";
%             vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.value(end);
%             vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.Attributes.unit;
%             ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.value(end);
%             ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.Attributes.unit;
%             point_A = "Point A";
%             va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.value(end);
%             % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.Attributes.unit;
%             na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.value(end);
%             % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.Attributes.unit;
%             point_F1  = "Point F1";
%             vf1       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromAtoF1.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromAtoF1.Attributes.unit;
%             nf1       = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromAtoF1.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromAtoF1.Attributes.unit;
%             point_F   = "Point F";
%             vf        = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromF1toF.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromF1toF.Attributes.unit;
%             nf        = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromF1toF.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromF1toF.Attributes.unit;
%             % ------------------------------------------------------------------------- 
%             % -----------------------------------------------------------------
%             %table gust calculation        
%             str = ['TABLE TO BE CHECKED!!!'];
%             para = Paragraph(str);
%             para.Style = {HAlign('justify')};
%             para.BackgroundColor = "red";
%             add(sec,para);  
%             % -----------------------------------------------------------------
%             header = {'Point', strcat('V(',vs_unit,')'), strcat('n(',ns_unit,')')};
%             %each table row needs of a fieldValue
%             %1
%             name       = {char(point_S); char(point_A);   char(point_F1); char(point_F)};
%             speeds     = {num2str(vs,4); num2str(va,4);   num2str(vf1,4); num2str(vf,4)};
%             load_fact  = {num2str(ns,4); num2str(na,4);   num2str(nf1,4); num2str(nf,4)};
%             vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%             vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%             fieldValue = [name, speeds, load_fact, vec_mug, vec_kg];
% 
% 
%             tbl = FormalTable(header,fieldValue);
%             % In order to put a table with a caption, the API Report denomination should
%             % be used, the other options are from API DOM. In order to solve the problem,
%             % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
%             tbl = BaseTable(tbl);
%             tbl.Title = strcat('Flaps envelope points summary at takeoff.');
%             tbl.LinkTarget = 'flapenvpointstakeoff';
%             add(sec,tbl);
%             % -----------------------------------------------------------------
%             % -------------------------------------------------------------
%         % -----------------------------------------------------------------
%         % NGUST GREATER THAN NMAX
%         % -----------------------------------------------------------------
%         elseif abs(n_g_plus) < nmax 
%             % -------------------------------------------------------------
%             % -------------------------------------------------------------------------
%             % TAKEOFF
%             % -------------------------------------------------------------------------
%             mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.mu_g.value;
%             kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.Gust_envelope.Kg.value;
%             point_S = "Point S";
%             vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.value(end);
%             vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_from0toS.Attributes.unit;
%             ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.value(end);
%             ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_from0toS.Attributes.unit;
%             point_A = "Point A";
%             va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.value(end);
%             % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromStoA.Attributes.unit;
%             na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.value(end);
%             % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromStoA.Attributes.unit;
%             point_F = "Point F";
%             vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.V_fromAtoF.Attributes.unit;
%             nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Takeoff.final_envelope.n_fromAtoF.Attributes.unit;
%             % ------------------------------------------------------------------------- 
%             % -----------------------------------------------------------------
%             %table gust calculation        
%             str = ['TABLE TO BE CHECKED!!!'];
%             para = Paragraph(str);
%             para.Style = {HAlign('justify')};
%             para.BackgroundColor = "red";
%             add(sec,para);  
%             % -----------------------------------------------------------------
%             header = {'Point', strcat('V(',vs_unit,')'), strcat('n(',ns_unit,')')};
%             %each table row needs of a fieldValue
%             %1
%             name       = {char(point_S); char(point_A); char(point_F)};
%             speeds     = {num2str(vs,4); num2str(va,4); num2str(vf,4)};
%             load_fact  = {num2str(ns,4); num2str(na,4); num2str(nf,4)};
%             vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%             vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%             fieldValue = [name, speeds, load_fact, vec_mug, vec_kg];
% 
% 
%             tbl = FormalTable(header,fieldValue);
%             % In order to put a table with a caption, the API Report denomination should
%             % be used, the other options are from API DOM. In order to solve the problem,
%             % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
%             tbl = BaseTable(tbl);
%             tbl.Title = strcat('Flaps envelope points summary at takeoff.');
%             tbl.LinkTarget = 'flapenvpointstakeoff';
%             add(sec,tbl);
%             % -----------------------------------------------------------------
%             % -------------------------------------------------------------------------    
%             % -------------------------------------------------------------------------
%             % LANDING
%             % -------------------------------------------------------------------------
%             mug     = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.mu_g.value;
%             kg      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.Gust_envelope.Kg.value;
%             point_S = "Point S";
%             vs      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.value(end);
%             vs_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_from0toS.Attributes.unit;
%             ns      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.value(end);
%             ns_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_from0toS.Attributes.unit;
%             point_A = "Point A";
%             va      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.value(end);
%             % va_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromStoA.Attributes.unit;
%             na      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.value(end);
%             % na_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromStoA.Attributes.unit;
%             point_F = "Point F";
%             vf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromAtoF.value(end);
%             % vf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.V_fromAtoF.Attributes.unit;
%             nf      = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromAtoF.value(end);
%             % nf_unit = Aircraft.Certification.Regulation.SubpartC.Flapsloads.Landing.final_envelope.n_fromAtoF.Attributes.unit;
%             % -------------------------------------------------------------------------
%             % ------------------------------------------------------------------------- 
%             % -----------------------------------------------------------------
%             %table gust calculation        
%             str = ['TABLE TO BE CHECKED!!!'];
%             para = Paragraph(str);
%             para.Style = {HAlign('justify')};
%             para.BackgroundColor = "red";
%             add(sec,para);  
%             % -----------------------------------------------------------------
%             header = {'Point', strcat('V(',vs_unit,')'), strcat('n(',ns_unit,')'), ...
%                       strcat('mug'), strcat('Kg')};
%             %each table row needs of a fieldValue
%             %1
%             name       = {char(point_S);  char(point_A);  char(point_F) };
%             speeds     = {num2str(vs,4);  num2str(va,4);  num2str(vf,4) };
%             load_fact  = {num2str(ns,4);  num2str(na,4);  num2str(nf,4) };
%             vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%             vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%             fieldValue = [name, speeds, load_fact, vec_mug, vec_kg];
% 
% 
%             tbl = FormalTable(header,fieldValue);
%             % In order to put a table with a caption, the API Report denomination should
%             % be used, the other options are from API DOM. In order to solve the problem,
%             % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
%             tbl = BaseTable(tbl);
%             tbl.Title = strcat('Flaps envelope points summary at landing.');
%             tbl.LinkTarget = 'flapenvpointslanding';
%             add(sec,tbl);
%             % -----------------------------------------------------------------
%             % -------------------------------------------------------------
%         end
% end
%         % LATERAL FORCE COEFFICIENT ON THE RUDDER AT MAX DEFLECTION
%         % latex interprete with $ simbol
%         myEq = "$ C_Y = C_{Y,0} + \frac{d C_Y}{d \delta_r} * \delta_{r,max} ";
%         eq = Equation(strcat(myEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(subsec,eqImg);
% % -------------------------------------------------------------------------      
% str = ['where: '];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------
% 
%         % CY
%         myEq = "$ C_Y = \mathrm{lateral force coefficient;}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg1 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref1 = eqImg1;         
% 
%         % C_Y_0
%         myEq = "$ C_{Y, 0} = \mathrm{lateral force coefficient at } \beta=\delta=0 \mathrm{, equal to zero for symmetrical airfoil;}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg2 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref2 = eqImg2; 
%         
%         % d C_Y / d delta
%         myEq = "$ \frac{d C_Y }{d \delta_r } = \mathrm{lateral force curve slope per deg of rudder deflection;}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg3 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref3 = eqImg3;         
% 
%         % delta max
%         myEq = "$ \delta_{r, max} = \mathrm{rudder control stop.}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg4 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref4 = eqImg4;      
%         
%         ol = UnorderedList({ref1, ref2, ref3, ref4});
% %         ol = UnorderedList({ref1,ref2,ref3,...
% %             ref4,ref5,ref6, ref7,ref8});
% %         ol = UnorderedList({ref1, ref2, ref3,...
% %             ref4,ref5,ref6, ref7, ref8, ref9});
%         append(subsec,ol);
% % -------------------------------------------------------------------------      
% str = ['Assuming no deflection of the control cable' ...
%        ', the maximum value of the lateral force coefficient ' ...
%        'is: '];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------
%         % -----------------------------------------------------------------
%         myNumEq = strcat( ' = ', num2str(dCYddeltar_per_degree,4), ' * ', ...
%                           num2str(rudder_control_stops,4), ...
%                           ' = ', num2str(CY_max_case_a1));
%         % latex interprete with $ simbol
%         myEq = "$ (C_Y)_{\delta_{r} = 30} ";
%         eq = Equation(strcat(myEq, myNumEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(subsec,eqImg);
%         % -----------------------------------------------------------------
% % -------------------------------------------------------------------------
% str = ['The lateral force is calculated as follow: '];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------
%         % -----------------------------------------------------------------
%         myNumEq = strcat( ' = (1/10)*', num2str(qA,4), '*', ...
%                           num2str(S_vertical_total,4), '*', ...
%                           num2str(CY_max_case_a1,4), '/', ...
%                           num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio.value,4), ' = ', ...
%                           num2str(Y_max,4), '\,\,', ...
%                           Y_max_unit);
%         % latex interprete with $ simbol
%         myEq = "$ Y = \frac{1}{10}*q_A*S_{vertical}*\frac{(C_Y)_{\delta_{r} = 30}}{S_{ratio}} ";
%         eq = Equation(strcat(myEq, myNumEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(subsec,eqImg);
%         % -----------------------------------------------------------------
% % -------------------------------------------------------------------------
% str = ['The lateral force acting on a single fin of the vertical tail plain is '...
%     (' ') ...
%     strcat(num2str(Y_max,4)) ...
%     '/2 = ' ...
%     (' ') ...
%     strcat(num2str(Y_max*0.5,4)) ...
%     (' ') ...
%     char(Y_max_unit) ...
%     '.'];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------
% % SUB-SECTION CASE (a)(1)
% add(sec,subsec);
% 
% %sub
% subsec = Section();
% subsec.Title = [char(requirement) ...
%                 char(case_a2)];
% str = ['With the rudder deflected as specified in sub-paragraph '...
%     (' ') ...
%     char(requirement) ...
%     (' ') ...
%     char(case_a1) ...
%     (' ') ...
%     'of this paragraph, it is assumed that the aeroplane yaws to the ' ...
%     'resulting sideslip angle. In lieu of a rational analysis, an ' ...
%     'overswing angle equal to 1.3 times the static sideslip angle ' ...
%     'of sub-paragraph ' ...
%     (' ') ...
%     char(requirement) ...
%     (' ') ...
%     char(case_a3) ...
%     (' ') ...
%     'of this paragraph may be assumed. The overswing sideslip angle is ' ...
%     '1.3 * ' ...
%     (' ') ...
%     strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.yaw_angle.value)) ...
%     (' ') ...
%     ' = ' ...
%     (' ') ...
%     strcat(num2str(Overswing_sideslip_angle)) ...
%     (' ') ...
%     char(rudder_control_stops_unit) ...
%     '. The total lateral force acting on the vertical tail in this case is: ' ];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------
%         % -----------------------------------------------------------------
%         myNumEq = strcat( ' = (1/10)*', num2str(qA,4), '*', ...
%                           num2str(S_vertical_total,4), '*', ...
%                           num2str(CY_VTP_case_a2,4), '/', ...
%                           num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio.value,4), ' = ', ...
%                           num2str(Y_case_a2,4), '\,\,', ...
%                           Y_max_unit);
%         % latex interprete with $ simbol
%         myEq = "$ Y =\frac{1}{10}*q_A*S_{vertical}*\frac{C_Y}{S_{ratio}} ";
%         eq = Equation(strcat(myEq, myNumEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(subsec,eqImg);
%         % -----------------------------------------------------------------
% % -------------------------------------------------------------------------
% str = ['The lateral force acting on a single fin of the vertical tail plain is '...
%     (' ') ...
%     strcat(num2str(Y_case_a2,4)) ...
%     '/2 = ' ...
%     (' ') ...
%     strcat(num2str(Y_case_a2*0.5,4)) ...
%     (' ') ...
%     char(Y_max_unit) ...
%     '.'];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------        
% % -------------------------------------------------------------------------
% % SUB-SECTION CASE (a)(2)
% add(sec,subsec);
% 
% %sub
% subsec = Section();
% subsec.Title = [char(requirement) ...
%                 char(case_a3)];
% str = ['A yaw angle of 15 degrees with the rudder control maintained ' ...
%        'in the neutral position (except as limited by pilot strength).' ...
%        ' The total lateral force in this case is: ' ];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
%         % -----------------------------------------------------------------
%         myNumEq = strcat( ' = (1/10)*', num2str(qA,4), '*', ...
%                           num2str(S_vertical_total,4), '*', ...
%                           num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.CY_VTP.value,4), '/', ...
%                           num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_ratio.value,4), ' = ', ...
%                           num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4), '\,\,', ...
%                           Y_max_unit);
%         % latex interprete with $ simbol
%         myEq = "$ Y =\frac{1}{10}*q_A*S_{vertical}*\frac{C_Y}{S_{ratio}} ";
%         eq = Equation(strcat(myEq, myNumEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(subsec,eqImg);
%         % -----------------------------------------------------------------
% % -------------------------------------------------------------------------
% str = ['The lateral force acting on a single fin of the vertical tail plain is '...
%     (' ') ...
%     strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4)) ...
%     '/2 = ' ...
%     (' ') ...
%     strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value*0.5,4)) ...
%     (' ') ...
%     char(Y_max_unit) ...
%     '.'];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(subsec,para);
% % -------------------------------------------------------------------------    
% % SUB-SECTION CASE (a)(3)
% add(sec,subsec);
% 
% add(ch,sec);
% 
% % %sec
% % sec = Section();
% % sec.Title = 'Balancing loads';
% % str = ['ADD HERE details '];
% % para = Paragraph(str);
% % add(ch,para);
% % add(ch,sec);
% 
% %sec
% sec = Section();
% sec.Title = 'Manouevring and gust envelope';
% str = ['According to ' ...
%     (' ') ...
%     char(requirement) ...
%     (' ') ...
%     char(gust_requirement) ...
%     ' in the abscence of a more rational analysis, the gust load must be ' ...
%     ' computed as follows:  '
%     ];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(sec,para);
% 
% % -------------------------------------------------------------------------
%         % LATERAL FORCE COEFFICIENT ON THE RUDDER AT MAX DEFLECTION
%         % latex interprete with $ simbol
%         %
%         %             K_gt * U_de * V * a_vt * S_vt
%         %      L_vt = -----------------------------
%         %                          16.3
%         %
%         myEq = "$ L_{vt} = \frac{K_{gt} * U_{de} * V * a_{vt} * S_{vt}}{16.3} ";
%         eq = Equation(strcat(myEq));
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         append(sec,eqImg);
% % -------------------------------------------------------------------------    
% %sec
% str = ['where: '];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(sec,para);
% % -------------------------------------------------------------------------
% 
%         % Ude
%         myEq = "$ U_{de} = \mathrm{derived gust velocity (m/s);}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg1 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref1 = eqImg1;         
% 
%         % Lvt
%         myEq = "$ L_{vt} = \mathrm{vertical tail load (daN)}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg2 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref2 = eqImg2; 
%         
%         % Kgt
%         myEq = "$ K_{gt} = \frac{0.88 * \mu_{gt}}{5.3 + \mu_{gt}} = \mathrm{gust alleviation factor;}";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg3 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref3 = eqImg3;         
%         
% %                          2 * M                   K^2
% %      mu_gt = ------------------------------- * ------- = lat. mass ratio;
% %              rho * c_bar_t * g * a_vt * S_vt   (l_t^2)
% %              
%         % mu_gt
%         myEq = "$ \mu_{gt} = \frac{2 * M}{\rho * \overline{c}_{t} * g * a_{vt} * S_{vt}} * \frac{K^2}{l_{t}^{2}} = \mathrm{lateral mass ratio}; ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg4 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref4 = eqImg4;      
% %              M    = aeroplane mass (kg); 
% %              rho  = air density (kg/m^3); 
% %              S_vt = area of vertical tail (m^2);
% %              l_t  = distance from aeroplane c.g. to lift centre of
% %                     vertical surface (m); 
% %              a_vt = lift curve slope of vertical tail (1/rad); 
% %              V    = aeroplane equivalent speed (m/s); 
% %              K    = radius of gyration in yaw (m);
% %              g    = acceleration due to gravity (m/s^2).
%         % M
%         myEq = "$ M = \mathrm{aeroplane mass (kg)}; ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg5 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref5 = eqImg5; 
%         
%         % rho
%         myEq = "$ rho = \mathrm{air density} (kg/m^3); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg6 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref6 = eqImg6; 
%         
%         % lt
%         myEq = "$ l_{t} = \mathrm{aeroplane c.g.-to-lift-centre of vertical surface distance} (m); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg7 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref7 = eqImg7; 
%         
%         % Svt
%         myEq = "$ S_{vt} = \mathrm{area of vertical tail} (m^2); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg8 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref8 = eqImg8; 
%         
%         % avt
%         myEq = "$ a_{vt} = \mathrm{lift curve slope of vertical tail} (1/rad); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg9 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref9 = eqImg9; 
%         
%         % V
%         myEq = "$ V = \mathrm{aeroplane equivalent speed} (m/s); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg10 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref10 = eqImg10; 
%         
%         % K
%         myEq = "$ K = \mathrm{radius of gyration in yaw} (m); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg11 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref11 = eqImg11; 
%         
%         % g
%         myEq = "$ g = \mathrm{acceleration due to gravity} (m/s^2); ";
%         eq = Equation(myEq);
%         eq.DisplayInline = true;
%         eq.FontSize = 12;
%         eqImg12 = getImpl(eq,rpt);
%         if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
%             eqImg.Style = {VerticalAlign("-30%")};
%         elseif(rpt.Type == "docx")
%             eqImg.Style = {VerticalAlign("-5pt")};
%         end
%         ref12 = eqImg12; 
%         
%         ol = UnorderedList({ref1, ref2, ref3, ref4, ...
%             ref5, ref6, ref7, ref8, ref9, ref10, ref11, ...
%             ref12});
% %         ol = UnorderedList({ref1,ref2,ref3,...
% %             ref4,ref5,ref6, ref7,ref8});
% %         ol = UnorderedList({ref1, ref2, ref3,...
% %             ref4,ref5,ref6, ref7, ref8, ref9});
%         append(sec,ol);
% % -------------------------------------------------------------------------   
% % CRITICAL GUST LOADS 
% gl_0    = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vc.Gust_loads_VC.value;
% gl_1    = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vd.Gust_loads_VD.value;
% gl_crit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.Critical_gustloads.value;
% gl_unit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vd.Gust_loads_VD.Attributes.unit;
% % -------------------------------------------------------------------------   
% %sec
% str = ['These calculations must be performed at VC and VD; the results are the following: '];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(sec,para);
% % -------------------------------------------------------------------------
% 
%         %ordered list
%         ref1 = [' Gust load at VC: ' ...
%             (' ') ...
%             strcat(num2str(gl_0)) ...
%             (' ') ...
%             char(gl_unit)];
%         ref2 = [' Gust load at VD: ' ...
%             (' ') ...
%             strcat(num2str(gl_1)) ...
%             (' ') ...
%             char(gl_unit)];
%         ol = OrderedList({ref1, ref2});
%         
% %         %1
% %         para = Paragraph(str);
% %         para.Style = {HAlign('justify')};
% %         add(sec,para)
% %         %2
% %         para2 = Paragraph(str2);
% %         para2.Style = {HAlign('justify')};
% %         add(sec,para2)
%         %list
%         append(sec,ol);
% % -------------------------------------------------------------------------   
% %sec
% gl_flag = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.Critical_gustloads.Attributes.flag;
% str = ['The critical gust load is ' ...
%     (' ') ...
%     strcat(num2str(gl_crit)) ...
%     (' ') ...
%     char(gl_unit) ...
%     (' ') ...
%     char(gl_flag) ...
%     '.'];
% para = Paragraph(str);
% para.Style = {HAlign('justify')};
% add(sec,para);
% % -------------------------------------------------------------------------
% add(ch,sec);
% 
% 

%moving to another path for figure
% cd ..
% cd ..
%  regulation = Aircraft.Certification.Regulation.value;
%  results_path = [pwd '\' regulation '\Output\'];
% 
%  cd (RepDir);
% 
% fig = FormalImage([results_path,'Finalenvelope.pdf']);
%          fig.Caption = 'Maneuver and Gust load factors and diagram';
%          fig.Height = '5in';
%          fig.LinkTarget='maneuver_ref';
%          add(ch,fig);

%add(ch7,sec1);


%% END chapter
%Adding chapters
add(rpt,ch);