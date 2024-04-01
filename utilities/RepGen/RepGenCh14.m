%% CHAPTER 14 - Loads on the control surfaces
%Ref EASA/Tecnam p2006 report

import mlreportgen.report.*  % import report API(report related methods
% @see https://it.mathworks.com/help/rptgen/ug/mlreportgen.report.report-class.html?searchHighlight=mlreportgen.report&s_tid=doc_srchtitle#mw_63820826-78dc-459b-a646-67d4d77f91e5 )
import mlreportgen.dom.*     % import document object model DOM API (DOM related method
% @see https://it.mathworks.com/help/search.html?qdoc=mlreportgen.dom&submitsearch=)
import mlreportgen.utils.*

% CONSTANTS
requirement            = Aircraft.Certification.Regulation.value;
aileron_airworth_rules = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Aileron_load_SI.Attributes.cs;
% chapter_number = 12;
% ch = strcat('ch' , num2str(chapter_number)); 
ch = Chapter();
ch.Title = 'Loads on the control surfaces';
disp(['Chapter 14', (' "'), ch.Title,('" ') ,'writing...' ])
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       char(aileron_airworth_rules) ...
       (' ') ...
       ', the flight control system and its supporting structure must be' ...
       ' designed for loads corresponding to 125 % of the computed hinge' ...
       ' moments of the movable control surface.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(ch,para);

% +++++++
% AILERON
% +++++++
aileron_load_SI        = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Aileron_load_SI.value;
aileron_load_SI_unit   = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Aileron_load_SI.Attributes.unit;
aileron_airworth_rules = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Aileron_load_SI.Attributes.cs;
%sec
sec = Section();
sec.Title = 'Ailerons';
% -------------------------------------------------------------------------
%moving to another path for figure
cd ..
cd ..
%  regulation = Aircraft.Certification.Regulation.value;
% results_path = Aircraft.res_dir;
Check_name = convertCharsToStrings(Aircraft.Certification.Aircraft_Name.value);
if Check_name == "DroneVLA"
    results_path =  [pwd '\utilities\Geometry\DroneVLA_results\'];
elseif Check_name == "TecnamP92"
    results_path =  [pwd '\utilities\Geometry\TecnamP92_results\'];
end
cd(RepDir);

fig = FormalImage([results_path,'/Wing-Top-View.png']);
         fig.Caption = 'Aileron, top view.';
         fig.Height = '5in';
         fig.LinkTarget='aileron_top_view';
         add(sec,fig);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
C_h_delta_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_delta_rad.value;
C_h_delta_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_delta_rad.Attributes.unit;
C_h_delta_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_delta_deg.value;
C_h_delta_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_delta_deg.Attributes.unit;
C_h_alfa_deg     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_alfa_deg.value;
C_h_alfa_deg_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_alfa_deg.Attributes.unit;
C_h_alfa_rad     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_alfa_rad.value;
C_h_alfa_rad_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_alfa_rad.Attributes.unit;
C_h_total_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_total_deg.value;
C_h_total_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_total_deg.Attributes.unit;
C_h_total_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_total_rad.value;
C_h_total_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_total_rad.Attributes.unit;
% -------------------------------------------------------------------------
        %table gust calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(ch,para);  
        
        header = {'Quantity', 'Value', 'Units'};
        %each table row needs of a fieldValue
        %gust calculation table
        %1 
        chdeltarad = {'CH delta', num2str(C_h_delta_rad,4), char(C_h_delta_rad_un)};    
        chdeltadeg = {'CH delta', num2str(C_h_delta_deg,4), char(C_h_delta_deg_un)};
        chalfarad  = {'CH alfa',  num2str(C_h_alfa_rad,4),  char(C_h_alfa_rad_un)};    
        chalfadeg  = {'CH alfa',  num2str(C_h_alfa_deg,4),  char(C_h_alfa_deg_un)};
        chtotalrad = {'CH total', num2str(C_h_total_rad,4), char(C_h_total_rad_un)};    
        chtotaldeg = {'CH total', num2str(C_h_total_deg,4), char(C_h_total_deg_un)};

        fieldValue = [chdeltarad; chdeltadeg; chalfarad; ...
            chalfadeg; chtotalrad; chtotaldeg];
    
          
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Aileron. Hinge moments coefficients.');
        tbl.LinkTarget = 'hingemomentcoefftableaileron';
        add(sec,tbl);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       char(aileron_airworth_rules) ...
       (' ') ...
       ', the total aileron load is equal to' ...
       (' ') ...
       strcat(num2str(aileron_load_SI,4)) ...
       (' ') ...
       char(aileron_load_SI_unit) ...
       '. The hinge moment is calculated' ...
       ' by the following equation '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
C_h_total_aileron = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Aileron.C_h_total_deg.value;
qA                = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.qA.value;
S_aileron         = Aircraft.Geometry.Aileron.S.value;
cf                = Aircraft.Geometry.Aileron.cf.value;
HA                = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA.value;
HA_unit           = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA.Attributes.unit;
% -------------------------------------------------------------------------
% HA = C_h_total_deg * qA * S_aileron * cf;
        myNumEq = strcat( ' = ', ...
                                num2str(qA,4), '*', ...
                                num2str(S_aileron,4), '*', ...
                                num2str(cf,4), '*', ...
                                num2str(C_h_total_aileron,4), ' = ', ... 
                                num2str(HA,4) , '\,\,', ...
                                HA_unit);
        myEq = "$ H_{aileron} = q*S_{aileron}*c_f*C_{h_{total}} ";
        eq = Equation(strcat(myEq, myNumEq));
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
str = ['where: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
        % HA 
        myEq = "$ H_{aileron} = \mathrm{aileron hinge moment} (N * m) \mathrm{;} ";
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

        % q
        myEq = "$ q = \mathrm{dynamic pressure at point A} (Pa) \mathrm{;} ";
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
        
        % S_aileron 
        myEq = "$ S_{aileron} = \mathrm{aileron surface} (m^2) \mathrm{;} ";
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

        % cf
        myEq = "$ c_f = \mathrm{reference chord} (m) \mathrm{;}";
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
        
        % C_h_total
        myEq = "$ C_{h_{total}} = \mathrm{total hinge moment coefficient.}";
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
        
        ol = UnorderedList({ref1, ref2, ref3, ref4, ref5});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(sec,ol);
% -------------------------------------------------------------------------   
str = ['This is the formula used in all the following calculations. ' ...
    'The total hinge moment that must be considered in structural calculations ' ...
    ' is the following: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
% HA_total = 2 * 1.25 * HA
        myNumEq = strcat(' = ', ...
                                num2str(2,4), '*', ...
                                num2str(1.25,4), '*', ...
                                '(', num2str(HA,4), ')', ...
                         ' = ', ...
                                num2str(2*1.25*HA,4), '\,\,', ...
                                HA_unit);
        myEq = "$ H_{aileron_{total}} = 2 * 1.25 * H_{aileron} ";
        eq = Equation(strcat(myEq, myNumEq));
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
add(ch,sec);
% ++++++++
% ELEVATOR
% ++++++++
elevator_load_SI        = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Total_elevator_SI.value;
elevator_load_SI_unit   = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.Total_elevator_SI.Attributes.unit;
%sec
sec = Section();
sec.Title = 'Elevator';
% -------------------------------------------------------------------------
% moving to another path for figure
cd ..
cd ..
%  regulation = Aircraft.Certification.Regulation.value;
 %results_path = [pwd '\utilities\Geometry\DroneVLA_results\'];
cd(RepDir);

fig = FormalImage([results_path,'/Horizontal-Top-View.png']);
         fig.Caption = 'Elevator, top view.';
         fig.Height = '5in';
         fig.LinkTarget='elevator_top_view';
         add(sec,fig);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
C_h_delta_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_delta_rad.value;
C_h_delta_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_delta_rad.Attributes.unit;
C_h_delta_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_delta_deg.value;
C_h_delta_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_delta_deg.Attributes.unit;
C_h_alfa_deg     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_alfa_deg.value;
C_h_alfa_deg_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_alfa_deg.Attributes.unit;
C_h_alfa_rad     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_alfa_rad.value;
C_h_alfa_rad_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_alfa_rad.Attributes.unit;
C_h_total_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_total_deg.value;
C_h_total_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_total_deg.Attributes.unit;
C_h_total_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_total_rad.value;
C_h_total_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_total_rad.Attributes.unit;
% -------------------------------------------------------------------------
        %table gust calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(ch,para);  
        
        header = {'Quantity', 'Value', 'Units'};
        %each table row needs of a fieldValue
        %gust calculation table
        %1 
        chdeltarad = {'CH delta', num2str(C_h_delta_rad,4), char(C_h_delta_rad_un)};    
        chdeltadeg = {'CH delta', num2str(C_h_delta_deg,4), char(C_h_delta_deg_un)};
        chalfarad  = {'CH alfa',  num2str(C_h_alfa_rad,4),  char(C_h_alfa_rad_un)};    
        chalfadeg  = {'CH alfa',  num2str(C_h_alfa_deg,4),  char(C_h_alfa_deg_un)};
        chtotalrad = {'CH total', num2str(C_h_total_rad,4), char(C_h_total_rad_un)};    
        chtotaldeg = {'CH total', num2str(C_h_total_deg,4), char(C_h_total_deg_un)};

        fieldValue = [chdeltarad; chdeltadeg; chalfarad; ...
            chalfadeg; chtotalrad; chtotaldeg];
    
          
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Elevator. Hinge moments coefficients.');
        tbl.LinkTarget = 'elevatorhingemomentcoefftable';
        add(sec,tbl);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       char(aileron_airworth_rules) ...
       (' ') ...
       ', the total elevator load is equal to' ...
       (' ') ...
       strcat(num2str(elevator_load_SI,4)) ...
       (' ') ...
       char(elevator_load_SI_unit) ...
       '. The hinge moment is'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
HA_Total_elevator      = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_Total.value; 
HA_Total_elevator_unit = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_Total.Attributes.unit;
HA_elevator            = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_elevator.value; 
HA_elevator_unit       = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_elevator.Attributes.unit;
C_h_total_deg_elevator = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Elevator.C_h_total_deg.value;
S_elevator             = Aircraft.Geometry.Elevator.S.value;
cf_elevator            = Aircraft.Geometry.Elevator.cf.value;
% -------------------------------------------------------------------------
% HA = C_h_total_deg * qA * S_aileron * cf;
        myNumEq = strcat( ' = ', ...
                                num2str(qA,4), '*', ...
                                num2str(S_elevator,4), '*', ...
                                num2str(cf_elevator,4), '*', ...
                                num2str(C_h_total_deg_elevator,4), ' = ', ...
                                num2str(HA_elevator,4) , '\,\,', ...
                                HA_unit);
        myEq = "$ H_{elevator} = q*S_{elevator}*c_f*C_{h_{total}} ";
        eq = Equation(strcat(myEq, myNumEq));
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
str = ['The total hinge moment that must be considered in structural calculations ' ...
    ' is the following: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
% HA_total = 2 * 1.25 * HA
        myNumEq = strcat(' = ', ...
                                num2str(2,4), '*', ...
                                num2str(1.25,4), '*', ...
                                '(', num2str(HA_elevator,4), ')', ...
                         ' = ', ...
                                num2str(HA_Total_elevator,4), '\,\,', ...
                                HA_unit);
        myEq = "$ H_{elevator_{total}} = 2 * 1.25 * H_{elevator} ";
        eq = Equation(strcat(myEq, myNumEq));
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
add(ch,sec);

% ++++++
% RUDDER
% ++++++
rudder_load_SI        = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.total_rudder_loads.value;
rudder_load_SI_unit   = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.total_rudder_loads.Attributes.unit;
%sec
sec = Section();
sec.Title = 'Rudder';
% -------------------------------------------------------------------------
% moving to another path for figure
cd ..
cd ..
%  regulation = Aircraft.Certification.Regulation.value;
% results_path = [pwd '\utilities\Geometry\DroneVLA_results\'];
cd(RepDir);

fig = FormalImage([results_path,'/Vertical-Side-View.png']);
         fig.Caption = 'Vertical fin, side view.';
         fig.Height = '5in';
         fig.LinkTarget='verticalfin_side_view';
         add(sec,fig);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
C_h_delta_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_delta_rad.value;
C_h_delta_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_delta_rad.Attributes.unit;
C_h_delta_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_delta_deg.value;
C_h_delta_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_delta_deg.Attributes.unit;
C_h_alfa_deg     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_alfa_deg.value;
C_h_alfa_deg_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_alfa_deg.Attributes.unit;
C_h_alfa_rad     = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_alfa_rad.value;
C_h_alfa_rad_un  = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_alfa_rad.Attributes.unit;
C_h_total_deg    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_total_deg.value;
C_h_total_deg_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_total_deg.Attributes.unit;
C_h_total_rad    = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_total_rad.value;
C_h_total_rad_un = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_total_rad.Attributes.unit;
% -------------------------------------------------------------------------
        %table gust calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(ch,para);  
        
        header = {'Quantity', 'Value', 'Units'};
        %each table row needs of a fieldValue
        %gust calculation table
        %1 
        chdeltarad = {'CH delta', num2str(C_h_delta_rad,4), char(C_h_delta_rad_un)};    
        chdeltadeg = {'CH delta', num2str(C_h_delta_deg,4), char(C_h_delta_deg_un)};
        chalfarad  = {'CH alfa',  num2str(C_h_alfa_rad,4),  char(C_h_alfa_rad_un)};    
        chalfadeg  = {'CH alfa',  num2str(C_h_alfa_deg,4),  char(C_h_alfa_deg_un)};
        chtotalrad = {'CH total', num2str(C_h_total_rad,4), char(C_h_total_rad_un)};    
        chtotaldeg = {'CH total', num2str(C_h_total_deg,4), char(C_h_total_deg_un)};

        fieldValue = [chdeltarad; chdeltadeg; chalfarad; ...
            chalfadeg; chtotalrad; chtotaldeg];
    
          
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Rudder. Hinge moments coefficients.');
        tbl.LinkTarget = 'hingemomentcoefftablerudder';
        add(sec,tbl);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       char(aileron_airworth_rules) ...
       (' ') ...
       ', the total rudder load is equal to' ...
       (' ') ...
       strcat(num2str(rudder_load_SI,4)) ...
       (' ') ...
       char(rudder_load_SI_unit) ...
       '. The hinge moment is'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
HA_Total_rudder      = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_rudder_125.value; 
HA_Total_rudder_unit = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_rudder_125.Attributes.unit;
HA_rudder            = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_rudder.value; 
HA_rudder_unit       = Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope.PointA.HA_rudder.Attributes.unit;
C_h_total_deg_rudder = Aircraft.Certification.Aerodynamic_data.Hinge_moments.Rudder.C_h_delta_deg.value;
S_rudder             = Aircraft.Geometry.Rudder.S.value;
cf_rudder            = Aircraft.Geometry.Rudder.chord.value;
% -------------------------------------------------------------------------
% SWITCH CASE TO TAKE INTO ACCOUNT THE TYPE OF RUDDER USED
% -------------------------------------------------------------------------
switch (Aircraft.Geometry.Vertical.empennage_flag.value)
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Multiple fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Double fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        % HA = C_h_total_deg * qA * S_aileron * cf;
        myNumEq = strcat( ' = ', ...
                                num2str(qA,4), '*', ...
                                '(2*', num2str(S_rudder,4), ')', '*', ...
                                num2str(cf_elevator,4), '*', ...
                                num2str(C_h_total_deg_rudder,4), ' = ', ...
                                num2str(HA_rudder,4) , '\,\,', ...
                                HA_unit);
        myEq = "$ H_{rudder} = q*(2*S_{rudder})*c_f*C_{h_{total}} ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(sec,eqImg);
        % -----------------------------------------------------------------
        str = ['where the surface is related to the double fin geometrical' ...
               ' arrangement. The total hinge moment that must be considered in' ...
               ' structural calculations is the following: '];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(sec,para);
        % -----------------------------------------------------------------
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    case 'Single fin'
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        % HA = C_h_total_deg * qA * S_aileron * cf;
        myNumEq = strcat( ' = ', ...
                                num2str(qA,4), '*', ...
                                num2str(S_rudder,4), '*', ...
                                num2str(cf_elevator,4), '*', ...
                                num2str(C_h_total_deg_rudder,4), ' = ', ...
                                num2str(HA_rudder,4) , '\,\,', ...
                                HA_unit);
        myEq = "$ H_{rudder} = q*S_{rudder}*c_f*C_{h_{total}} ";
        eq = Equation(strcat(myEq, myNumEq));
        eq.DisplayInline = true;
        eq.FontSize = 12;
        eqImg = getImpl(eq,rpt);
        if (rpt.Type == "html" || rpt.Type == "html-file" || rpt.Type == "pdf")
            eqImg.Style = {VerticalAlign("-30%")};
        elseif(rpt.Type == "docx")
            eqImg.Style = {VerticalAlign("-5pt")};
        end
        append(sec,eqImg);
        % -----------------------------------------------------------------
        str = ['where the surface is related to the double fin geometrical' ...
               ' arrangement. The total hinge moment that must be considered in' ...
               ' structural calculations is the following: '];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(sec,para);
        % -----------------------------------------------------------------
end
% -------------------------------------------------------------------------
        % HA_total = 2 * 1.25 * HA
        myNumEq = strcat(' = ', ...
                                num2str(1.25,4), '*', ...
                                '(', num2str(HA_rudder,4), ')', ...
                         ' = ', ...
                                num2str(HA_Total_rudder,4), '\,\,', ...
                                HA_unit);
        myEq = "$ H_{rudder_{total}} = 1.25 * H_{rudder} ";
        eq = Equation(strcat(myEq, myNumEq));
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

%add(sec,sec1);


%% END chapter
%Adding chapters
add(rpt,ch);