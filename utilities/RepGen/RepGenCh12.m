% --------------------------------------------------------------------------
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 %% CHAPTER 12 - Loads on the vertical tail
%Ref EASA/Tecnam p2006 report

import mlreportgen.report.*  % import report API(report related methods
% @see https://it.mathworks.com/help/rptgen/ug/mlreportgen.report.report-class.html?searchHighlight=mlreportgen.report&s_tid=doc_srchtitle#mw_63820826-78dc-459b-a646-67d4d77f91e5 )
import mlreportgen.dom.*     % import document object model DOM API (DOM related method
% @see https://it.mathworks.com/help/search.html?qdoc=mlreportgen.dom&submitsearch=)
import mlreportgen.utils.*

requirement = Aircraft.Certification.Regulation.value;
% CASE CS-VLA 441(a)(1)
case_a1 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.Lateral_force.Attributes.cs;
% CASE CS-VLA 441(a)(2)
case_a2 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_2.Lateral_force.Attributes.cs;
% CASE CS-VLA 441(a)(3)
case_a3 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force.Attributes.cs;
% MAXIMUM RUDDER DEFLECTION - CONTROL STOPS
rudder_control_stops      = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.Maximum_delta_rudder.value;
rudder_control_stops_unit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.Maximum_delta_rudder.Attributes.unit;
% LATERAL FORCE COEFFICIENT SLOPE PER DEGREE
dCYddeltar_per_degree = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.CYdr.value;
% MAXIMU CY
CY_max_case_a1 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.CY.value;
% DYNAMIC PRESSURE AT VA
qA = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.qA.value;
% VERTICAL TAIL WING SURFACE
S_vertical_total = 2*Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_vertical_tail.value;
% VERTICAL TAIL WING SPAN 
b_vertical = Aircraft.Geometry.Vertical.b.value;
% MAX LATERAL FORCE
Y_max      = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.Lateral_force_decanewton.value;
Y_max_unit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_1.Lateral_force_decanewton.Attributes.unit;
% CALCULATION OF (1.3)*(YAW_ANGLE)
Overswing_sideslip_angle = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_2.yaw_angle.value;
% LATERAL FORCE COEFFICIENT 
CY_VTP_case_a2 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_2.CY_VTP.value;
% LATERAL FORCE CASE (a)(2) 
Y_case_a2 = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_2.Lateral_force_decanewton.value;
% GUST AIRWORTHINESS REQUIREMENT
gust_requirement = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vc.mu_g.Attributes.cs;


% chapter_number = 12;
% ch = strcat('ch' , num2str(chapter_number)); 
ch = Chapter();
ch.Title = 'Loads on the vertical tail';
disp(['Chapter 12', (' "'), ch.Title,('" ') ,'writing...' ])

% -------------------------------------------------------------------------
% moving to another path for figure
cd ..
cd ..
%  regulation = Aircraft.Certification.Regulation.value;
%  results_path = [pwd '\utilities\Geometry\DroneVLA_results\'];
Check_name = convertCharsToStrings(Aircraft.Certification.Aircraft_Name.value);
if Check_name == "DroneVLA"
    results_path =  [pwd '\utilities\Geometry\DroneVLA_results\'];
elseif Check_name == "TecnamP92"
    results_path =  [pwd '\utilities\Geometry\TecnamP92_results\'];
end
cd(RepDir);

fig = FormalImage([results_path,'Vertical-Side-View.png']);
         fig.Caption = 'Vertical fin, side view.';
         fig.Height = '5in';
         fig.LinkTarget='verticalfin_side_view';
         add(ch,fig);
% -------------------------------------------------------------------------

% firt paragraph - optional
str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    'the vertical tail must withstand several manoeuvring loads.' ...
    ' In this chapter, all these load case will be illustrated.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(ch,para);

%sec
sec = Section();
sec.Title = 'Manouevring load';
str = ['At speeds up to VA, the vertical tail surfaces must be designed to '...
       'withstand the following condition. In computing the tail loads, ' ...
       'the yawing velocity may be assumed to be zero. '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);

%sub
subsec = Section();
subsec.Title = [char(requirement) ...
                char(case_a1)];
str = ['With the aeroplane in unaccelerated flight at zero yaw, ' ...
       'it is assumed that the rudder control is suddenly displaced ' ...
       'to the maximum deflection, as limited by the control stops or by limit pilot forces.' ...
       'The control stops are +/- ' ...
       (' ') ...
       strcat(num2str(rudder_control_stops)) ...
       (' ') ...
       char(rudder_control_stops_unit) ...
       '. The lateral force coefficient acting on the rudder when at '...
       'maximum deflection angle is given by the following simple ' ...
       ' equation: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % LATERAL FORCE COEFFICIENT ON THE RUDDER AT MAX DEFLECTION
        % latex interprete with $ simbol
        myEq = "$ C_Y = C_{Y,0} + \frac{d C_Y}{d \delta_r} * \delta_{r,max} ";
        eq = Equation(strcat(myEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(subsec,eqImg);
% -------------------------------------------------------------------------      
str = ['where: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------

        % CY
        myEq = "$ C_Y = \mathrm{lateral force coefficient;}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg1 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref1 = eqImg1;         

        % C_Y_0
        myEq = "$ C_{Y, 0} = \mathrm{lateral force coefficient at } \beta=\delta=0 \mathrm{, equal to zero for symmetrical airfoil;}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg2 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref2 = eqImg2; 
        
        % d C_Y / d delta
        myEq = "$ \frac{d C_Y }{d \delta_r } = \mathrm{lateral force curve slope per deg of rudder deflection;}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg3 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref3 = eqImg3;         

        % delta max
        myEq = "$ \delta_{r, max} = \mathrm{rudder control stop.}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg4 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref4 = eqImg4;      
        
        ol = UnorderedList({ref1, ref2, ref3, ref4});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(subsec,ol);
% -------------------------------------------------------------------------      
str = ['Assuming no deflection of the control cable' ...
       ', the maximum value of the lateral force coefficient ' ...
       'is: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        myNumEq = strcat( ' = ', num2str(dCYddeltar_per_degree,4), ' * ', ...
                          num2str(rudder_control_stops,4), ...
                          ' = ', num2str(CY_max_case_a1));
        % latex interprete with $ simbol
        myEq = "$ (C_Y)_{\delta_{r} = 30} ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(subsec,eqImg);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
str = ['The lateral force is calculated as follow: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        myNumEq = strcat( ' = \frac{1}{10}*', num2str(qA,4), '*', ...
                          num2str(S_vertical_total,4), '*\frac{', ...
                          num2str(Aircraft.Geometry.Wing.S.value,4), '}{', ...
                          num2str(S_vertical_total,4), ...
                          '}*', num2str(CY_max_case_a1,4), ' = ', ...
                          num2str(Y_max,4), '\,\,', ...
                          Y_max_unit);
        % latex interprete with $ simbol
        myEq = "$ Y = \frac{1}{10}*q_A*S_{vertical}*\frac{S_{wing}}{S_{vertical}}*(C_Y)_{\delta_{r} = 30} ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(subsec,eqImg);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
switch (Aircraft.Geometry.Vertical.empennage_flag.value)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Single fin'
        % -----------------------------------------------------------------
        str = ['The lateral force acting on the fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Y_max,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);    
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Multiple fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Double fin'
        str = ['The lateral force acting on a single fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Y_max,4)) ...
            '/2 = ' ...
            (' ') ...
            strcat(num2str(Y_max*0.5,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para); 
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
end
% -------------------------------------------------------------------------
% SUB-SECTION CASE (a)(1)
add(sec,subsec);

%sub
subsec = Section();
subsec.Title = [char(requirement) ...
                char(case_a2)];
str = ['With the rudder deflected as specified in sub-paragraph '...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(case_a1) ...
    (' ') ...
    'of this paragraph, it is assumed that the aeroplane yaws to the ' ...
    'resulting sideslip angle. In lieu of a rational analysis, an ' ...
    'overswing angle equal to 1.3 times the static sideslip angle ' ...
    'of sub-paragraph ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(case_a3) ...
    (' ') ...
    'of this paragraph may be assumed. The overswing sideslip angle is ' ...
    '1.3 * ' ...
    (' ') ...
    strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.yaw_angle.value)) ...
    (' ') ...
    ' = ' ...
    (' ') ...
    strcat(num2str(Overswing_sideslip_angle)) ...
    (' ') ...
    char(rudder_control_stops_unit) ...
    '. The total lateral force acting on the vertical tail in this case is: ' ];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        myNumEq = strcat( ' = \frac{1}{10}*', num2str(qA,4), '*', ...
                          num2str(S_vertical_total,4), '*', ...
                          '\frac{', ...
                          num2str(Aircraft.Geometry.Wing.S.value,4), '}{', ...
                          num2str(S_vertical_total,4), ...
                          '}*', ...
                          num2str(CY_VTP_case_a2,4), ...
                          ' = ', ...
                          num2str(Y_case_a2,4), '\,\,', ...
                          Y_max_unit);
        % latex interprete with $ simbol
        
        % Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_vertical_tail.value/Aircraft.Geometry.Wing.S.value;
        myEq = "$ Y =\frac{1}{10}*q_A*S_{vertical}*\frac{S_{wing}}{S_{vertical}}*C_Y ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(subsec,eqImg);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
switch (Aircraft.Geometry.Vertical.empennage_flag.value)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Single fin'
        str = ['The lateral force acting on the fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Y_case_a2,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Multiple fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Double fin'
        str = ['The lateral force acting on a single fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Y_case_a2,4)) ...
            '/2 = ' ...
            (' ') ...
            strcat(num2str(Y_case_a2*0.5,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
end
% -------------------------------------------------------------------------        
% -------------------------------------------------------------------------
% SUB-SECTION CASE (a)(2)
add(sec,subsec);

%sub
subsec = Section();
subsec.Title = [char(requirement) ...
                char(case_a3)];
str = ['A yaw angle of 15 degrees with the rudder control maintained ' ...
       'in the neutral position (except as limited by pilot strength).' ...
       ' The total lateral force in this case is: ' ];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
        % -----------------------------------------------------------------
        % Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.S_vertical_tail.value/Aircraft.Geometry.Wing.S.value;
        myNumEq = strcat( ' = \frac{1}{10}*', num2str(qA,4), '*', ...
                          num2str(S_vertical_total,4), '*', ...
                          '\frac{', ...
                          num2str(Aircraft.Geometry.Wing.S.value,4), ... 
                          '}{', ...
                          num2str(S_vertical_total,4), ... 
                          '}*', ...
                          num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.CY_VTP.value,4), ... 
                          ' = ', ...
                          num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4), '\,\,', ...
                          Y_max_unit);
        % latex interprete with $ simbol
        myEq = "$ Y =\frac{1}{10}*q_A*S_{vertical}*\frac{S_{wing}}{S_{vertical}}*C_Y ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(subsec,eqImg);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
switch (Aircraft.Geometry.Vertical.empennage_flag.value)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Single fin'
        % -----------------------------------------------------------------
        str = ['The lateral force acting on the fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
        % -----------------------------------------------------------------
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Multiple fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Double fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        % -----------------------------------------------------------------
        str = ['The lateral force acting on a single fin of the vertical tail plain is '...
            (' ') ...
            strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4)) ...
            '/2 = ' ...
            (' ') ...
            strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value*0.5,4)) ...
            (' ') ...
            char(Y_max_unit) ...
            '.'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
        % -----------------------------------------------------------------
end
% -------------------------------------------------------------------------    
% SUB-SECTION CASE (a)(3)
add(sec,subsec);

add(ch,sec);

% %sec
% sec = Section();
% sec.Title = 'Balancing loads';
% str = ['ADD HERE details '];
% para = Paragraph(str);
% add(ch,para);
% add(ch,sec);

%sec
sec = Section();
sec.Title = 'Manouevring and gust envelope';
str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(gust_requirement) ...
    ' in the abscence of a more rational analysis, the gust load must be ' ...
    ' computed as follows:  '
    ];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);

% -------------------------------------------------------------------------
        % LATERAL FORCE COEFFICIENT ON THE RUDDER AT MAX DEFLECTION
        % latex interprete with $ simbol
        %
        %             K_gt * U_de * V * a_vt * S_vt
        %      L_vt = -----------------------------
        %                          16.3
        %
        myEq = "$ L_{vt} = \frac{K_{gt} * U_{de} * V * a_{vt} * S_{vt}}{16.3} ";
        eq = Equation(strcat(myEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(sec,eqImg);
% -------------------------------------------------------------------------    
%sec
str = ['where: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------

        % Ude
        myEq = "$ U_{de} = \mathrm{derived gust velocity (m/s);}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg1 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref1 = eqImg1;         

        % Lvt
        myEq = "$ L_{vt} = \mathrm{vertical tail load (daN)}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg2 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref2 = eqImg2; 
        
        % Kgt
        myEq = "$ K_{gt} = \frac{0.88 * \mu_{gt}}{5.3 + \mu_{gt}} = \mathrm{gust alleviation factor;}";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg3 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref3 = eqImg3;         
        
%                          2 * M                   K^2
%      mu_gt = ------------------------------- * ------- = lat. mass ratio;
%              rho * c_bar_t * g * a_vt * S_vt   (l_t^2)
%              
        % mu_gt
        myEq = "$ \mu_{gt} = \frac{2 * M}{\rho * \overline{c}_{t} * g * a_{vt} * S_{vt}} * \frac{K^2}{l_{t}^{2}} = \mathrm{lateral mass ratio}; ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg4 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref4 = eqImg4;      
%              M    = aeroplane mass (kg); 
%              rho  = air density (kg/m^3); 
%              S_vt = area of vertical tail (m^2);
%              l_t  = distance from aeroplane c.g. to lift centre of
%                     vertical surface (m); 
%              a_vt = lift curve slope of vertical tail (1/rad); 
%              V    = aeroplane equivalent speed (m/s); 
%              K    = radius of gyration in yaw (m);
%              g    = acceleration due to gravity (m/s^2).
        % M
        myEq = "$ M = \mathrm{aeroplane mass (kg)}; ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg5 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref5 = eqImg5; 
        
        % rho
        myEq = "$ rho = \mathrm{air density} (kg/m^3); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg6 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref6 = eqImg6; 
        
        % lt
        myEq = "$ l_{t} = \mathrm{aeroplane c.g.-to-lift-centre of vertical surface distance} (m); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg7 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref7 = eqImg7; 
        
        % Svt
        myEq = "$ S_{vt} = \mathrm{area of vertical tail} (m^2); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg8 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref8 = eqImg8; 
        
        % avt
        myEq = "$ a_{vt} = \mathrm{lift curve slope of vertical tail} (1/rad); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg9 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref9 = eqImg9; 
        
        % V
        myEq = "$ V = \mathrm{aeroplane equivalent speed} (m/s); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg10 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref10 = eqImg10; 
        
        % K
        myEq = "$ K = \mathrm{radius of gyration in yaw} (m); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg11 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref11 = eqImg11; 
        
        % g
        myEq = "$ g = \mathrm{acceleration due to gravity} (m/s^2); ";
        eq = Equation(myEq);
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg12 = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        ref12 = eqImg12; 
        
        ol = UnorderedList({ref1, ref2, ref3, ref4, ...
            ref5, ref6, ref7, ref8, ref9, ref10, ref11, ...
            ref12});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(sec,ol);
% -------------------------------------------------------------------------   
% CRITICAL GUST LOADS 
gl_0    = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vc.Gust_loads_VC.value;
gl_1    = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vd.Gust_loads_VD.value;
gl_crit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.Critical_gustloads.value;
gl_unit = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.vd.Gust_loads_VD.Attributes.unit;
% -------------------------------------------------------------------------   
%sec
str = ['These calculations must be performed at VC and VD; the results are the following: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        %ordered list
        ref1 = [' Gust load at VC: ' ...
            (' ') ...
            strcat(num2str(gl_0)) ...
            (' ') ...
            char(gl_unit)];
        ref2 = [' Gust load at VD: ' ...
            (' ') ...
            strcat(num2str(gl_1)) ...
            (' ') ...
            char(gl_unit)];
        ol = OrderedList({ref1, ref2});
        
%         %1
%         para = Paragraph(str);
%         para.Style = {HAlign('justify')};
%         add(sec,para)
%         %2
%         para2 = Paragraph(str2);
%         para2.Style = {HAlign('justify')};
%         add(sec,para2)
        %list
        append(sec,ol);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------   
%sec
gl_flag = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.GustLoads.Critical_gustloads.Attributes.flag;
str = ['The critical gust load is ' ...
    (' ') ...
    strcat(num2str(gl_crit)) ...
    (' ') ...
    char(gl_unit) ...
    (' ') ...
    char(gl_flag) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
add(ch,sec);

%sec
sec = Section();
sec.Title = 'Vertical tail loads summary';
% -------------------------------------------------------------------------
%sub
subsec = Section();
subsec.Title = ['Critical manouevring loads'];
str = ['The critical manouevring loads are summarized here.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
switch (Aircraft.Geometry.Vertical.empennage_flag.value)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Single fin'
                % -----------------------------------------------------------------
        %ordered list
        ref1 = [char(requirement) ...
                (' ') ...
                char(case_a1) ...
                ':' ...
                (' ') ...
                strcat(num2str(Y_max,4)) ...
               (' ') ...
               char(Y_max_unit) ...
               ';'];
        ref2 = [char(requirement) ...
                (' ') ...
                char(case_a2) ...
                ':' ...
                (' ') ...
                strcat(num2str(Y_case_a2,4)) ...
                (' ') ...
                char(Y_max_unit) ...
                ';'];
        ref3 = [char(requirement) ...
                (' ') ...
                char(case_a3) ...
                ':' ...
                (' ') ...
                strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value,4)) ...
                (' ') ...
                char(Y_max_unit) ...
                '.'];
        ol = OrderedList({ref1, ref2, ref3});
        
%         %1
%         para = Paragraph(str);
%         para.Style = {HAlign('justify')};
%         add(sec,para)
%         %2
%         para2 = Paragraph(str2);
%         para2.Style = {HAlign('justify')};
%         add(sec,para2)
        %list
        append(subsec,ol);
        % -----------------------------------------------------------------
        % -----------------------------------------------------------------
    case 'Multiple fin'
        % -----------------------------------------------------------------
    case 'Double fin'
        % -----------------------------------------------------------------
        %ordered list
        ref1 = [char(requirement) ...
                (' ') ...
                char(case_a1) ...
                ':' ...
                (' ') ...
                strcat(num2str(Y_max*0.5,4)) ...
               (' ') ...
               char(Y_max_unit) ...
               ';'];
        ref2 = [char(requirement) ...
                (' ') ...
                char(case_a2) ...
                ':' ...
                (' ') ...
                strcat(num2str(Y_case_a2*0.5,4)) ...
                (' ') ...
                char(Y_max_unit) ...
                ';'];
        ref3 = [char(requirement) ...
                (' ') ...
                char(case_a3) ...
                ':' ...
                (' ') ...
                strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value*0.5,4)) ...
                (' ') ...
                char(Y_max_unit) ...
                '.'];
        ol = OrderedList({ref1, ref2, ref3});
        
%         %1
%         para = Paragraph(str);
%         para.Style = {HAlign('justify')};
%         add(sec,para)
%         %2
%         para2 = Paragraph(str2);
%         para2.Style = {HAlign('justify')};
%         add(sec,para2)
        %list
        append(subsec,ol);
        % -----------------------------------------------------------------
end
add(sec,subsec);  
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
%sub
subsec = Section();
subsec.Title = ['Critical gust loads'];
str = ['The critical gust load is' ...
    (' ') ...
    strcat(num2str(gl_crit)) ...
    (' ') ...
    char(gl_unit) ...
    (' ') ...
    char(gl_flag) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        %ordered list
%         ref1 = [char(requirement) ...
%                 (' ') ...
%                 char(case_a1) ...
%                 ':' ...
%                 (' ') ...
%                 strcat(num2str(Y_max*0.5,4)) ...
%                (' ') ...
%                char(Y_max_unit) ...
%                ';'];
%         ref2 = [char(requirement) ...
%                 (' ') ...
%                 char(case_a2) ...
%                 ':' ...
%                 (' ') ...
%                 strcat(num2str(Y_case_a2*0.5,4)) ...
%                 (' ') ...
%                 char(Y_max_unit) ...
%                 ';'];
%         ref3 = [char(requirement) ...
%                 (' ') ...
%                 char(case_a3) ...
%                 ':' ...
%                 (' ') ...
%                 strcat(num2str(Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.Case_a_3.Lateral_force_decanewton.value*0.5,4)) ...
%                 (' ') ...
%                 char(Y_max_unit) ...
%                 '.'];
%         ol = OrderedList({ref1, ref2, ref3});
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
%         append(subsec,ol);
        % -----------------------------------------------------------------
add(sec,subsec);  
% -------------------------------------------------------------------------
add(ch,sec);
%  
%  (a) With the aeroplane in a loading condition correspondint to point A
%      or point D in the V - n diagram (whichever condition leads to the
%      higher balance load) the loads on the horizontal tail must be
%      combined with those on the vertical tail as specified in CS - VLA
%      441. 
%  (b) 75% of the loads according to CS - VLA 423 for the horizontal tail
%      and CS - VLA 441 for the vertical tail must be assumed acting
%      simultaneously. 
%

supp_load_req = Aircraft.Certification.Regulation.SubpartC.CombinedLoads.Critical_condition.Total_loads.Attributes.cs;

%sec
sec = Section();
sec.Title = 'Combined loads';
str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(supp_load_req) ...
    ' the following two additional condition must be verified: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
% COMBINED LOADS RULES
global_airworth_rules       = Aircraft.Certification.Regulation.SubpartC.VerticalTailLoads.global_requirement.Attributes.cs;
global_airworth_rules_horiz = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.general_rules.cs;
% COMBINED LOADS
Tailloads_subpar_a  = Aircraft.Certification.Regulation.SubpartC.CombinedLoads.subparagraph_a.LTail.value;
Tailloads_subpar_b  = Aircraft.Certification.Regulation.SubpartC.CombinedLoads.subparagraph_b.LTail.value;
Comb_tailloads_unit = Aircraft.Certification.Regulation.SubpartC.CombinedLoads.Critical_condition.Total_loads.Attributes.unit;
        %ordered list
        ref1 = ['With the aeroplane in a loading condition correspondint to point A' ...
                ' or point D in the V - n diagram (whichever condition leads to the' ...
                ' higher balance load) the loads on the horizontal tail must be' ...
                ' combined with those on the vertical tail as specified in' ...
                (' ') ...
                char(requirement) ...
                (' ') ...
                char(global_airworth_rules) ...
                '; this prescription results in a combined load equal to' ...
                (' ') ...
                strcat(num2str(Tailloads_subpar_a,4)) ...
                (' ') ...
                char(Comb_tailloads_unit) ...
                ';'];
        ref2 = ['75 % of the loads according to ' ...
            (' ') ...
            char(requirement) ...
            (' ') ... 
            char(global_airworth_rules_horiz) ...
            (' ') ...
            'for the horizontal tail and' ...
            (' ') ...
            char(requirement) ...
            (' ') ...
            char(global_airworth_rules) ...
            (' ') ...
            'for the vertical tail must be assumed acting simultaneously;' ...
            ' this prescription results in a combined load equal to' ...
            (' ') ...
            strcat(num2str(Tailloads_subpar_b,4)) ...
            (' ') ...
            char(Comb_tailloads_unit) ...
            '.'];
        ol = OrderedList({ref1, ref2});
        append(sec,ol);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
total_combined_load = Aircraft.Certification.Regulation.SubpartC.CombinedLoads.Critical_condition.Total_loads.value;
str = ['The critical combined load is ' ...
    (' ') ...
    strcat(num2str(total_combined_load)) ...
    (' ') ...
    char(Comb_tailloads_unit) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -----------------------------------------------------------------------------------------------
%moving to another path for figure
cd ..
cd ..
 regulation = Aircraft.Certification.Regulation.value;
 results_path = [pwd '\' regulation '\Output\'];

cd(RepDir);

Check_name = convertCharsToStrings(Aircraft.Certification.Aircraft_Name.value);
if Check_name == "Drone_VLA"
     fig = FormalImage([results_path,'Combinedload.png']);
     fig.Caption = 'Combined load figurative representation.';
     fig.Height = '5in';
     fig.LinkTarget='comb_load';
     add(ch,fig);
elseif Check_name == "TecnamP92"
    disp("No combined load.")
end

cd(RepDir); 
 
%  fig = FormalImage([results_path,'Combinedload.png']);
%  fig.Caption = 'Combined load figurative representation.';
%  fig.Height = '5in';
%  fig.LinkTarget='comb_load';
%  add(ch,fig);

%  fig = FormalImage([results_path,'Finalenvelope.png']);
%  fig.Caption = 'Maneuver and Gust load factors and diagram';
%  fig.Height = '5in';
%  fig.LinkTarget='maneuver_ref';
%  add(ch,fig);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------        
%         %1
%         para = Paragraph(str);
%         para.Style = {HAlign('justify')};
%         add(sec,para)
%         %2
%         para2 = Paragraph(str2);
%         para2.Style = {HAlign('justify')};
%         add(sec,para2)
%         %list
%         append(sec,ol);
% -------------------------------------------------------------------------   

add(ch,sec);

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
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% --------------------------------------------------------------------------
% %% CHAPTER 12 - Loads on the vertical tail
% %Ref EASA/Tecnam p2006 report
% 
% import mlreportgen.report.*  % import report API(report related methods
% % @see https://it.mathworks.com/help/rptgen/ug/mlreportgen.report.report-class.html?searchHighlight=mlreportgen.report&s_tid=doc_srchtitle#mw_63820826-78dc-459b-a646-67d4d77f91e5 )
% import mlreportgen.dom.*     % import document object model DOM API (DOM related method
% % @see https://it.mathworks.com/help/search.html?qdoc=mlreportgen.dom&submitsearch=)
% import mlreportgen.utils.*
% 
% % chapter_number = 12;
% % ch = strcat('ch' , num2str(chapter_number)); 
% ch = Chapter();
% ch.Title = 'Loads on the vertical tail';
% disp(['Chapter 12', (' "'), ch.Title,('" ') ,'writing...' ])
% 
% 
% str = ['ADD HERE details '];
% para = Paragraph(str);
% add(ch,para);
% 
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
% sec.Title = 'Manouevring loads';
% str = ['ADD HERE details '];
% para = Paragraph(str);
% add(ch,para);
% %sub
% subsec = Section();
% subsec.Title = 'a(1)';
% 
% add(sec,subsec);
% 
% %sub
% subsec = Section();
% subsec.Title = 'a(2)';
% 
% add(sec,subsec);
% 
% %sub
% subsec = Section();
% subsec.Title = 'a(3)';
% 
% add(sec,subsec);
% 
% %sub
% subsec = Section();
% subsec.Title = 'Gust loads';
% 
% add(sec,subsec);
% 
% add(ch,sec);
% 
% %sec
% sec = Section();
% sec.Title = 'Vertical tail loads summary';
% str = ['ADD HERE details '];
% para = Paragraph(str);
% add(ch,para);
% 
% add(ch,sec);
% 
% %sec
% sec = Section();
% sec.Title = 'Combined loads';
% str = ['ADD HERE details on h-v combined loads'];
% para = Paragraph(str);
% add(ch,para);
% 
% 
% add(ch,sec);
% 
% 
% %moving to another path for figure
% % cd ..
% % cd ..
% %  regulation = Aircraft.Certification.Regulation.value;
% %  results_path = [pwd '\' regulation '\Output\'];
% % 
% %  cd (RepDir);
% % 
% % fig = FormalImage([results_path,'Finalenvelope.pdf']);
% %          fig.Caption = 'Maneuver and Gust load factors and diagram';
% %          fig.Height = '5in';
% %          fig.LinkTarget='maneuver_ref';
% %          add(ch,fig);
% 
% %add(ch7,sec1);
% 
% 
% %% END chapter
% %Adding chapters
% add(rpt,ch);