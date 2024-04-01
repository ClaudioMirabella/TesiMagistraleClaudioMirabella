%% CHAPTER 11 - Loads on the htail
%Ref EASA: WING LOAD CALCULATION
%(Example document for LSA applicants – v1 of 08.03.16)
%Date of issue: DD/MM/YYYY
%Document reference: ABCD-FL-57-00

import mlreportgen.report.*  % import report API(report related methods
% @see https://it.mathworks.com/help/rptgen/ug/mlreportgen.report.report-class.html?searchHighlight=mlreportgen.report&s_tid=doc_srchtitle#mw_63820826-78dc-459b-a646-67d4d77f91e5 )
import mlreportgen.dom.*     % import document object model DOM API (DOM related method
% @see https://it.mathworks.com/help/search.html?qdoc=mlreportgen.dom&submitsearch=)
import mlreportgen.utils.*

% ------------------------------------------------------------------------------------------------------------
requirement            = Aircraft.Certification.Regulation.value;
% CS-VLA 421 Balancing loads
balancing_airworth_req = Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.Attributes.cs;
flaps_load_req         = char(Aircraft.Certification.Regulation.SubpartC.Flapsloads.nmax.Attributes.cs);
% ------------------------------------------------------------------------------------------------------------

% chapter_number = 11;
% ch = strcat('ch' , num2str(chapter_number)); 
ch = Chapter();
ch.Title = 'Loads on the horizontal tail';
disp(['Chapter 11', (' "'), ch.Title,('" ') ,'writing...' ])

str = ['According to ' ...
      (' ') ...
      char(requirement) ...
      (' ') ...
      char(balancing_airworth_req) ...
      (' ') ...
      ', a horizontal tail balancing load is a load necessary to maintain' ...
      ' equilibrium in any specified flight condition with no pitching' ...
      ' acceleration. Horizontal tail surfaces must also be designed for'...
      ' the balancing loads occuring at any point on the limit manoeuvring' ...
      ' envelope and in the flap conditions specified in' ...
      (' ') ...
      char(requirement) ...
      (' ') ...
      flaps_load_req(1:4) ...
      '. The distribution in figure B6 of Appendix B may be used. '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(ch,para);

% BALANCING LOADS
% The following forces are considered and placed in equilibrium: 
% Lift on the wing;
% Horizontal tail balancing load according to requirement 5.2.2.1 [3];
% Weight of the aeroplane;
% For the calculation of the equilibrium, the z-axis of the aeroplane is assumed aligned with the direction of the gravity.
% In a second stage (section 6.4), once the forces are calculated, the corresponding angle of attack will be considered for
% the calculation of the correct direction of the forces on the wing; 
% Influence of thrust and drag (of the total airplane) are considered negligible at this stage of calculation of the vertical forces.
% The effect of the drag will be considered in a second stage on the wing only;
% The wing lift is assumed to act on the aerodynamic centre of the wing as a starting point. The contribution of the fuselage
% is accounted for as a shift of the point of aerodynamic centre. This is better explained in section 6.1.5.
% The HT lift is applied at 25% of the chord;
% Effects of structural flexure are considered negligible;
% Angular accelerations are disregarded until the aeroplane has attained the prescribed load factor (according to requirement 5.2.2.3 [3]);

%sec
sec = Section();
sec.Title = 'Balancing loads';
str = ['The following forces are considered and placed in equilibrium:'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %ordered list
        ref1 = ['lift on the wing;'];
        ref2 = ['horizontal tail balancing load;'];
        ref3 = ['weight of the aircraft;'];
        ref4 = ['for the calculation of the equilibrium, the z axis of' ...
            ' aircraft is assumed aligned with the direction of the' ...
            ' gravity. In a second stage, once the forces are calculated,' ...
            ' the corresponding angle of attack will be considered for' ...
            ' the calculation of the correct direction of the forces on' ...
            ' the wing;'];
        ref5 = ['influence of thrust and drag (of the total airplane)' ...
            ' are considered negligible at this stage of calculation of' ...
            ' the vertical forces. The effect of the drag will be' ...
            ' considered in a second stage on the wing only;'];
        ref6 = ['the wing lift is assumed to act on the aerodynamic' ...
            ' centre of the wing as a starting point. The contribution' ...
            ' of the fuselage is accounted for as a shift of the point' ...
            ' of aerodynamic centre;'];
        ref7 = ['the horizontal tail lift is applied at 25% of' ...
            'the chord;'];
        ref8 = ['no aeroelastic deformation will be considered;'];
        ref9 = ['angular accelerations are disregarded until the' ...
            ' aeroplane has attained the prescribed load factor.'];
        ol = UnorderedList({ref1, ref2, ref3, ref4, ref5, ref6, ref7, ...
            ref8});
        append(sec,ol);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% ------------------------------------------------------------------------- 
str = ['These approximation are by no means mandatory and can be' ...
    ' discounted if more reliable data about the aircraft aerodynamics' ...
    ' or more accurate calculations are necessary.'];
para = Paragraph(str);
para.BackgroundColor = "green";
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
fig = FormalImage([results_path,'Balancingloads.png']);
fig.Caption = 'Balancing loads';
fig.Height = '5in';
fig.LinkTarget='bala_loads';
add(sec,fig);

add(ch,sec);
% ------------------------------------------------------------------------- 

% CS-VLA 423 Manouevring loads
manouevring_load_req = char(Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.Attributes.cs);
%sec
sec = Section();
sec.Title = 'Manouevring loads';
str = ['According to ' ...
       (' ') ...
       char(requirement) ...
       (' ') ...
       manouevring_load_req(1:4) ...
       ', each horizontal tail surface must be designed for manoeuvring' ...
       ' loads imposed by one of the cited load conditions.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
%         % -----------------------------------------------------------------
%         %ordered list
%         ref1 = ['a sudden deflection of the elevator control at VA, to' ... 
%                 ' (1) the maximum updward deflection and (2) the maximum' ...
%                 ' downward deflection, as limited by the control stops or' ...
%                 ' pilot effort, whichever is critical. The average loading' ...
%                 ' of B11 of Appendix B and the distribution in figure B7' ...
%                 ' of Appendix B may be used;'];
%         ref2 = ['75 % of the loads according to ' ...
%             (' ') ...
%             char(requirement) ...
%             (' ') ... 
%             char(global_airworth_rules_horiz) ...
%             (' ') ...
%             'for the horizontal tail and' ...
%             (' ') ...
%             char(requirement) ...
%             (' ') ...
%             char(global_airworth_rules) ...
%             (' ') ...
%             'for the vertical tail must be assumed acting simultaneously;' ...
%             ' this prescription results in a combined load equal to' ...
%             (' ') ...
%             strcat(num2str(Tailloads_subpar_b,4)) ...
%             (' ') ...
%             char(Comb_tailloads_unit) ...
%             '.'];
%         ol = OrderedList({ref1, ref2});
%         append(sec,ol);
%         % -----------------------------------------------------------------
% -------------------------------------------------------------------------        

% UNCHECKED MANOEUVRE DATA
pitchup_control_stops   = Aircraft.Certification.Aerodynamic_data.Elevator.Max_deflection.value;
pitchup_control_unit    = Aircraft.Certification.Aerodynamic_data.Elevator.Max_deflection.Attributes.unit;
pitchdown_control_stops = Aircraft.Certification.Aerodynamic_data.Elevator.Max_deflection.value;  

%sub
subsec = Section();
subsec.Title = 'Unchecked manoeuvre';
str = ['At speed VA the pitching control is suddenly displaced to the' ...
    ' maximum deflection as limited by the control stops. The control' ...
    ' stops are' ...
    (' ') ...
    strcat(num2str(pitchup_control_stops,4)) ...
    (' ') ...
    char(pitchup_control_unit) ...
    (' ') ...
    ' pitch up and ' ...
    (' ') ...
    strcat(num2str(pitchdown_control_stops,4)) ...
    (' ') ...
    char(pitchup_control_unit) ...
    (' ') ...
    ' pitch down. Assuming a linear increment of deflection angle,' ...
    ' the tail lift and its moment about the center of gravity pitching' ...
    ' axis grow accordingly. The aircraft angular pitching acceleration' ...
    ' is the consequence, which, at the tail station, leads to a' ...
    ' tangential acceleration nearly normal to tail plane. ' ...
    ' In the time interval delta t a relative speed delta v develops,' ...
    ' which, in composition with the aircraft speed VA causes a decrement' ...
    ' of the tail incidence angle equal to the delta v divided by VA.' ...
    ' This damping effect is the major relevant fact of the control finite' ...
    ' time and its consequence is a less unchecked manoeuvring load.' ...
    ' Taking into account the drag forces, which are opposed to the body' ...
    ' rotation, and other minus occurrencies, a conservative damping' ...
    ' reduction factor of about 0.3 is introduced. This is a standard' ...
    ' assumption for the sudden manoeuvring deflection from neutral' ...
    ' position to stops. Assuming the direction and the intensity of' ...
    ' airspeed at the center of gravity constant during the control time,' ...
    ' the differential equation representing the motion is:'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para)
% -------------------------------------------------------------------------
switch(Aircraft.Certification.Aerodynamic_data.Horizontal.tau.Attributes.flag)
    case 'Full movable'
        % PITCHING ANGLE DIFFERENTIAL EQUATION 
        %
        myEq = "$ \frac{d^{2}\theta}{dt} = \frac{q*S_{tail}*a_{tail}*d}{I_{y}}*\Biggl(\omega*dt - \frac{\Delta v}{V_A}*DF\Biggr) ";
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
        %sec
        str = ['where: '];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
        % -------------------------------------------------------------------------

        % Ude
        myEq = "$ \theta = \mathrm{rotation pitching angle}";
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
        myEq = "$ q = \mathrm{dynamic pressure (Pa)}";
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
        myEq = "$ S_{tail} = \mathrm{horizontal tail area (m^2)}";
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
        myEq = "$ d = \mathrm{C.G.-tail-A.C. distance (m) with } x_{C.G.} = 0.25*MAC ";
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
        myEq = "$ a_{tail} = \mathrm{tail lift curve slope (1/deg)}; ";
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
        myEq = "$ I_{y} = \mathrm{airplane pitching inertia moment (kg*m^2)} ";
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
        myEq = "$ \omega = \frac{\delta_{e,max}*\tau}{t_{deflection}} = \mathrm{control angular speed of plane deflection (rad/sec)}";
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
        
        % tau
        myEq = "$ \tau = 1.0 = \mathrm{elevator efficiency factor;}";
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
        
        % t deflection
        myEq = "$ t_{deflection} = \mathrm{total time required to full stop;}";
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
        
        % delta max
        myEq = "$ \delta_{e,max} = \mathrm{maximum elevator deflection;}";
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
        
        % Svt
        myEq = "$ \frac{\Delta v}{V_A} = \mathrm{damping angle} ";
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
        
        % avt
        myEq = "$ DF = \mathrm{damping effect reduction factor} = 0.3 ";
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
            ref5, ref6, ref7, ref8, ref9, ref10, ref11, ref12});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(subsec,ol);
        % -------------------------------------------------------------------------
        % -------------------------------------------------------------------------    
    case 'Conventional'
        % PITCHING ANGLE DIFFERENTIAL EQUATION 
        %
        myEq = "$ \frac{d^{2}\theta}{dt} = \frac{q*S_{tail}*a_{tail}*d}{I_{y}}*\Biggl(\omega*dt - \frac{\Delta v}{V_A}*DF\Biggr) ";
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
        %sec
        str = ['where: '];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        add(subsec,para);
        % -------------------------------------------------------------------------

        % Ude
        myEq = "$ \theta = \mathrm{rotation pitching angle}";
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
        myEq = "$ q = \mathrm{dynamic pressure (Pa)}";
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
        myEq = "$ S_{tail} = \mathrm{horizontal tail area (m^2)}";
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
        myEq = "$ d = \mathrm{C.G.-tail-A.C. distance (m) with } x_{C.G.} = 0.25*MAC ";
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
        myEq = "$ a_{tail} = \mathrm{tail lift curve slope (1/deg)}; ";
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
        myEq = "$ I_{y} = \mathrm{airplane pitching inertia moment (kg*m^2)} ";
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
        myEq = "$ \omega = \frac{\delta_{e,max}*\tau}{t_{deflection}} = \mathrm{control angular speed of plane deflection (rad/sec)}";
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
        
        % tau
        myEq = "$ \tau = 0.5 = \mathrm{elevator efficiency factor;}";
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
        
        % t deflection
        myEq = "$ t_{deflection} = \mathrm{total time required to full stop;}";
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
        
        % delta max
        myEq = "$ \delta_{e,max} = \mathrm{maximum elevator deflection;}";
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
        
        % Svt
        myEq = "$ \frac{\Delta v}{V_A} = \mathrm{damping angle} ";
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
        
        % avt
        myEq = "$ DF = \mathrm{damping effect reduction factor} = 0.3 ";
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
            ref5, ref6, ref7, ref8, ref9, ref10, ref11, ref12});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(subsec,ol);
        % -------------------------------------------------------------------------

% -------------------------------------------------------------------------  
% -------------------------------------------------------------------------  
end
%sec
str = ['The angular speed is defined from total elevator deflection' ...
    ', elevator efficiency factor and total deflection time.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
%sec
% PITCH UP CASE 423(a) 
DeltaLimitLTail_cs_airworth        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.Attributes.cs;
DeltaLimitLTail_pitch_up           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.value;
DeltaLimitLTail_pitch_up_unit      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.DeltaLimitLTail.Attributes.unit;
alpha_new_horiz_grad_pitch_up      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_grad.value(end);
alpha_new_horiz_grad_pitch_up_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_grad.Attributes.unit;
% PITCH DOWN CASE 423(a) 
DeltaLimitLTail_pitch_down      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.DeltaLimitLTail.value;
alpha_new_horiz_grad_pitch_down = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_grad.value(end);
str = ['It is possible to solve this equation using simple and reliable' ...
    ' numerical methods. According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(DeltaLimitLTail_cs_airworth) ...
    (' ') ...
    ', the following results are presented: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        %ordered list
        ref1 = ['a pitch up case where the resultant tailplane angle of' ...
            ' attack is ' ...
            (' ') ...
            strcat(num2str(alpha_new_horiz_grad_pitch_up,4)) ...
            (' ') ...
            char(alpha_new_horiz_grad_pitch_up_unit) ...
            (' ') ...
            ' and a corresponding limit tail load of ' ...
            (' ') ...
            strcat(num2str(DeltaLimitLTail_pitch_up,4)) ...
            (' ') ...
            char(DeltaLimitLTail_pitch_up_unit) ...
            ';'];
        ref2 = ['a pitch down case where the resultant tailplane angle of' ...
            ' attack is ' ...
            (' ') ...
            strcat(num2str(alpha_new_horiz_grad_pitch_down,4)) ...
            (' ') ...
            char(alpha_new_horiz_grad_pitch_up_unit) ...
            (' ') ...
            ' and a corresponding limit tail load of ' ...
            (' ') ...
            strcat(num2str(DeltaLimitLTail_pitch_down,4)) ...
            (' ') ...
            char(DeltaLimitLTail_pitch_up_unit) ...
            '.'];
        ol = OrderedList({ref1, ref2});
        append(subsec,ol);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------        
        % -----------------------------------------------------------------
        %table unchecked manoeuvre calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(subsec,para);  
        % -----------------------------------------------------------------
        d2thetadt2_pitch_down      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.d2thetadt2.value(1:5:end);
        d2thetadt2_unit            = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.d2thetadt2.Attributes.unit;
        dthetadt_pitch_down        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.dthetadt.value(1:5:end);  
        dthetadt_unit              = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.dthetadt.Attributes.unit;
        alpha_new_horiz_pitch_down = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz_deg.value(1:5:end);
        alpha_new_horiz_unit       = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_prime_horiz_deg.Attributes.unit;
        delta_theta_pitch_down     = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_theta.value(1:5:end);
        delta_theta_unit           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_theta.Attributes.unit;
        delta_v_pitch_down         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_v.value(1:5:end);
        delta_v_unit               = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.delta_v.Attributes.unit;
        alpha_new_ht_pitch_down    = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_grad.value(1:5:end);
        alpha_new_unit             = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_down.alpha_new_horiz_grad.Attributes.unit;
        % -----------------------------------------------------------------
        header = {strcat('d2theta(',d2thetadt2_unit,')'), ...
                  strcat('dtheta(',dthetadt_unit,')'), ...
                  strcat('alfa ht(',alpha_new_horiz_unit,')'), ...
                  strcat('delta theta(',delta_theta_unit,')'), ...
                  strcat('delta v(',delta_v_unit,')'), ...
                  strcat('alfa new ht(',alpha_new_unit,')')};
        %each table row needs of a fieldValue
        %1
%         name       = {char(point_S);  char(point_A);  char(point_F) };
%         speeds     = {num2str(vs,4);  num2str(va,4);  num2str(vf,4) };
%         load_fact  = {num2str(ns,4);  num2str(na,4);  num2str(nf,4) };
%         vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%         vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%         vec_Ude    = {num2str(Ude,4); num2str(Ude,4); num2str(Ude,4)};
%         vec_WS     = {num2str(WS,4);  num2str(WS,4);  num2str(WS,4) };
%         vec_rho    = {num2str(rho,4); num2str(rho,4); num2str(rho,4)};
%         vec_alt    = {num2str(altitude,4); num2str(altitude,4); num2str(altitude,4)};
        fieldValue = {num2str(d2thetadt2_pitch_down,4), num2str(dthetadt_pitch_down,4), ...
            num2str(alpha_new_horiz_pitch_down,4), num2str(delta_theta_pitch_down,4), ...
            num2str(delta_v_pitch_down,4), num2str(alpha_new_ht_pitch_down,4)};
        % ----------------------------------------------------------------------------
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Unchecked manoeuvre. Pitch down case calculations.');
        tbl.LinkTarget = 'uncheckedmanoeuvre_pitchdown';
        add(subsec,tbl);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
        % -----------------------------------------------------------------
        %table unchecked manoeuvre calculation        
        str = ['TABLE TO BE CHECKED!!!'];
        para = Paragraph(str);
        para.Style = {HAlign('justify')};
        para.BackgroundColor = "red";
        add(subsec,para);  
        % -----------------------------------------------------------------
        d2thetadt2_pitch_up      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.d2thetadt2.value(1:5:end);
        d2thetadt2_unit          = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.d2thetadt2.Attributes.unit;
        dthetadt_pitch_up        = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.dthetadt.value(1:5:end);  
        dthetadt_unit            = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.dthetadt.Attributes.unit;
        alpha_new_horiz_pitch_up = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz_deg.value(1:5:end);
        alpha_new_horiz_unit     = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_prime_horiz_deg.Attributes.unit;
        delta_theta_pitch_up     = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_theta.value(1:5:end);
        delta_theta_unit         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_theta.Attributes.unit;
        delta_v_pitch_up         = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_v.value(1:5:end);
        delta_v_unit             = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.delta_v.Attributes.unit;
        alpha_new_ht_pitch_up    = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_grad.value(1:5:end);
        alpha_new_unit           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.pitch_up.alpha_new_horiz_grad.Attributes.unit;
        % -----------------------------------------------------------------
        header = {strcat('d2theta(',d2thetadt2_unit,')'), ...
                  strcat('dtheta(',dthetadt_unit,')'), ...
                  strcat('alfa ht(',alpha_new_horiz_unit,')'), ...
                  strcat('delta theta(',delta_theta_unit,')'), ...
                  strcat('delta v(',delta_v_unit,')'), ...
                  strcat('alfa new ht(',alpha_new_unit,')')};
        %each table row needs of a fieldValue
        %1
%         name       = {char(point_S);  char(point_A);  char(point_F) };
%         speeds     = {num2str(vs,4);  num2str(va,4);  num2str(vf,4) };
%         load_fact  = {num2str(ns,4);  num2str(na,4);  num2str(nf,4) };
%         vec_mug    = {num2str(mug,4); num2str(mug,4); num2str(mug,4)};
%         vec_kg     = {num2str(kg,4);  num2str(kg,4);  num2str(kg,4) };
%         vec_Ude    = {num2str(Ude,4); num2str(Ude,4); num2str(Ude,4)};
%         vec_WS     = {num2str(WS,4);  num2str(WS,4);  num2str(WS,4) };
%         vec_rho    = {num2str(rho,4); num2str(rho,4); num2str(rho,4)};
%         vec_alt    = {num2str(altitude,4); num2str(altitude,4); num2str(altitude,4)};
        fieldValue = {num2str(d2thetadt2_pitch_down,4), num2str(dthetadt_pitch_down,4), ...
            num2str(alpha_new_horiz_pitch_down,4), num2str(delta_theta_pitch_down,4), ...
            num2str(delta_v_pitch_down,4), num2str(alpha_new_ht_pitch_down,4)};
        % ----------------------------------------------------------------------------
        tbl = FormalTable(header,fieldValue);
        % In order to put a table with a caption, the API Report denomination should
        % be used, the other options are from API DOM. In order to solve the problem,
        % the table is created as FormalTable (DOM) but it is inserted in a BaseTable (Report).
        tbl = BaseTable(tbl);
        tbl.Title = strcat('Unchecked manoeuvre. Pitch up case calculations.');
        tbl.LinkTarget = 'uncheckedmanoeuvre_pitchup';
        add(subsec,tbl);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
add(sec,subsec);
% -------------------------------------------------------------------------  

%sub

% CS - VLA 423 (b)
Airworth_csvla_methodb = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.pitch_down.critical_tail_airloads.Attributes.cs;
% PITCHING INERTIA MOMENT 
pitching_inertia_moment      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.IY.value; 
pitching_inertia_moment_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_a.IY.Attributes.unit;
% METHOD B RESULTS 
Total_critical_loads_methodb      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.Total_critical_loads.value;
Total_critical_loads_methodb_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Method_b.Total_critical_loads.Attributes.unit;

subsec = Section();
subsec.Title = 'Checked manoeuvre';
% -------------------------------------------------------------------------
str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(Airworth_csvla_methodb) ...
    (' ') ...
    ' a sudden upward deflection of the elevator must be studied,' ...
    ' at speeds abobe VA, followed by a downward deflection of the' ...
    ' elevator, resulting in specified combinations of normal and angular acceleration.' ...
    ' The airplane pitching inertia moment is estimated equal to' ...
    (' ') ...
    strcat(num2str(pitching_inertia_moment,4)) ...
    (' ' ) ...
    char(pitching_inertia_moment_unit) ...
    ' at maximum takeoff weight and center of gravity at 25% of' ...
    ' the mean aerodynamic chord. The maximum limit load in the checked' ...
    ' manoeuvre is ' ...
    (' ') ...
    strcat(num2str(Total_critical_loads_methodb,4)) ...
    (' ' ) ...
    char(Total_critical_loads_methodb_unit) ...
    '.'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
add(sec,subsec);

%sub
subsec = Section();
subsec.Title = 'Gust loads';
% -------------------------------------------------------------------------
%   (d) In the absence of a more rational analysis, the incremental tail
%       load due to the gust, must be computed as follows:
%       
%                     Kg * U_de * V * a_ht * S_ht          d epsilon
%       Delta L_ht = ----------------------------- * [1 - -----------]
%                              (16) * (3)                   d alpha
%
%       where 
%       Delta L_ht      = incremental horizontal tail load (daN);
%       Kg              = gust alleviation factor defined in CS - VLA 341;
%       U_de            = derived gust velocity (m/s);
%       V               = aeroplane equivalent speed (m/s);
%       a_ht            = slope of horizontal tail lift curve per radian; 
%       S_ht            = area of horizontal tail (m^2); 
%       
%            d epsilon 
%       1 - ----------- = downwash factor.
%             d alpha
% -------------------------------------------------------------------------

% CS - VLA 425 
Total_gust_at_VF_plus_cs_airworth = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VF_plus.Attributes.cs;
% CS - VLA 425(d) 
deltatail_airworth_cs_airworth    = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.DeltaL_ht_VD.Attributes.cs;

str = ['According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(Total_gust_at_VF_plus_cs_airworth) ...
    (' ') ...
    ' , each horizontal tail surface must be designed for loads resulting' ...
    ' during steady, unaccelereted flight at different speeds (VF, VC, VD).' ...
    ' The incremental tail load resulting from the gusts must be added to' ...
    ' the initial balancing tailload to obtain the total tail load.' ...
    ' According to ' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(deltatail_airworth_cs_airworth) ...
    ', in the abscence of a more rational analysis, the incremental tail' ...
    ' load due to the gust, must be computed as follows: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
% GUST LOAD EQUATION 
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
        % PITCHING ANGLE DIFFERENTIAL EQUATION 
        %
        myEq = "$ \Delta L_{ht} = \frac{1}{2}*\Biggl[ K_{g}*\rho_{0}*U_{de}*V*a_{ht}*S_{ht} \biggl(1 - \frac{d \epsilon}{d \alpha} \biggr) \Biggr] ";
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
%sec
str = ['where: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para);
% -------------------------------------------------------------------------
        % Ude
        myEq = "$ \rho_{0} = \mathrm{density of air at sea level (kg/m^3);}";
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
        myEq = "$ K_{g} = \mathrm{gust alleviation factor at MTOW;}";
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
        myEq = "$ U_{de} = \mathrm{derived gust speed (m/s);}";
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
        myEq = "$ V = \mathrm{aircraft equivalent speed (m/s);} ";
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
        myEq = "$ a_{ht} = \mathrm{tail lift curve slope (1/rad);}; ";
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
        myEq = "$ S_{ht} = \mathrm{horizontal tail area (m^2);} ";
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
        myEq = "$ \biggl(1 - \frac{d \epsilon}{ d \alpha} \biggr) = \mathrm{downwash factor.}";
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
        
        ol = UnorderedList({ref1, ref2, ref3, ref4, ...
            ref5, ref6, ref7});
%         ol = UnorderedList({ref1,ref2,ref3,...
%             ref4,ref5,ref6, ref7,ref8});
%         ol = UnorderedList({ref1, ref2, ref3,...
%             ref4,ref5,ref6, ref7, ref8, ref9});
        append(subsec,ol);
% ------------------------------------------------------------------------- 
str = ['Results can be summarized as follow:'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(subsec,para); 
% -------------------------------------------------------------------------
        %ordered list
        DeltaL_ht_VF           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.DeltaL_ht_VF.value;
        DeltaL_ht_VF_unit      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.DeltaL_ht_VF.Attributes.unit;
        Total_gust_at_VF_plus  = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VF_plus.value;
        Total_gust_at_VF_minus = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VF_minus.value;
        ref1 = ['at VF, the incremental tail load is' ...
            (' ') ...
            strcat(num2str(DeltaL_ht_VF,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' and the resulting total load is' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VF_plus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is summed and' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VF_minus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is subtracted;'];
        DeltaL_ht_VC           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.DeltaL_ht_VC.value;
        Total_gust_at_VC_plus  = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VC_plus.value;
        Total_gust_at_VC_minus = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VC_minus.value;
        ref2 = ['at VC, the incremental tail load is' ...
            (' ') ...
            strcat(num2str(DeltaL_ht_VC,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' and the resulting total load is' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VC_plus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is summed and' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VC_minus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is subtracted;'];
        DeltaL_ht_VD           = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.DeltaL_ht_VD.value;
        Total_gust_at_VD_plus  = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VD_plus.value;
        Total_gust_at_VD_minus = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.Gustloads.Total_gust_at_VD_minus.value;
        ref3 = ['at VF, the incremental tail load is' ...
            (' ') ...
            strcat(num2str(DeltaL_ht_VD,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' and the resulting total load is' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VD_plus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is summed and' ...
            (' ') ...
            strcat(num2str(Total_gust_at_VD_minus,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ' when the incremental tail load is subtracted.'];
        ol = OrderedList({ref1, ref2, ref3});
        append(subsec,ol);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
add(sec,subsec);
% -------------------------------------------------------------------------
add(ch,sec);

%sec
sec = Section();
sec.Title = 'Horizontal tail loads summary';
str = ['In this section all the maximum manoeuvring limit loads are summarized'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
        % -----------------------------------------------------------------
        %ordered list
        Method_a      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_a.value;
        Method_a_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_a.Attributes.unit;
        ref1 = ['Case (a):' ...
            (' ') ...
            strcat(num2str(Method_a,4)) ...
            (' ') ...
            char(Method_a_unit) ...
            ';'];
        Method_b      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_b.value;
        Method_b_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_b.Attributes.unit;
        ref2 = ['Case (b):' ...
            (' ') ...
            strcat(num2str(Method_b,4)) ...
            (' ') ...
            char(Method_b_unit) ...
            ';'];
        Method_a_plus_b      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_a_plus_b.value;
        Method_a_plus_b_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_a_plus_b.Attributes.unit;
        ref3 = ['Case (a) + (b):' ...
            (' ') ...
            strcat(num2str(Method_a_plus_b,4)) ...
            (' ') ...
            char(Method_a_plus_b_unit) ...
            ';'];
        Method_c      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_c.value;
        Method_c_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_c.Attributes.unit;
        ref4 = ['Case (c):' ...
            (' ') ...
            strcat(num2str(Method_c,4)) ...
            (' ') ...
            char(Method_c_unit) ...
            ';'];
        Method_d      = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_d.value;
        Method_d_unit = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Method_d.Attributes.unit;
        ref5 = ['Case (d):' ...
            (' ') ...
            strcat(num2str(Method_d,4)) ...
            (' ') ...
            char(Method_d_unit) ...
            '.'];
        ol = OrderedList({ref1, ref2, ref3, ref4, ref5});
        append(sec,ol);
        % -----------------------------------------------------------------
% -------------------------------------------------------------------------
add(ch,sec);

%sec
% REQUIREMENT
Full_load_side_cs = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.UnsymmetricalLoads.Full_load_side.Attributes.cs;
sec = Section();
sec.Title = 'Unsysmmetrical loads';
str = ['According to' ...
    (' ') ...
    char(requirement) ...
    (' ') ...
    char(Full_load_side_cs) ...
    ', in the abscence of more rational data for conventional aircraft' ...
    ' must be applied (1) 100% of the maximum loading from the symmetrical' ...
    ' flight conditions on the surface on one side of the plane of symmetry' ...
    ' and (2) the following percentage of that loading to the opposite side:'];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
        % = 100 -10 * (n - 1)
        nmax            = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
        Percentage_load = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.UnsymmetricalLoads.Percentage_load.value;
        % -----------------------------------------------------------------
        myNumEq = strcat( ' = \frac{1}{100}*[100 - 10*(', num2str(nmax,4), ...
                          ' - 1)] = ', ...
                          num2str(Percentage_load,4));
        % latex interprete with $ simbol
        myEq = "$ \% = 100 - 10*(n-1) ";
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
Max_horiz_tail_load = Aircraft.Certification.Regulation.SubpartC.HorizontalTailLoads.CriticalLoads.Maximum.value;
% DeltaL_ht_VF_unit
% -------------------------------------------------------------------------
        str = ['The critical manoeuvre load is' ...
            (' ') ...
            strcat(num2str(Max_horiz_tail_load,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            '; the unsymmetrical loads will be: '];
para = Paragraph(str);
para.Style = {HAlign('justify')};
add(sec,para);
% -------------------------------------------------------------------------
% -------------------------------------------------------------------------
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
        %ordered list
        ref1 = ['load on one side: ' ...
            (' ') ...
            strcat(num2str(Max_horiz_tail_load,4)) ...
            '*0.5 = ' ...
            strcat(num2str(0.5*Max_horiz_tail_load,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            ';'];
        ref2 = ['load on the opposite side: ' ...
            (' ') ...
            strcat(num2str(Max_horiz_tail_load,4)) ...
            '*' ...
            strcat(num2str(Percentage_load,4)) ...
            (' ') ...
            ' = ' ...
            strcat(num2str(Percentage_load*Max_horiz_tail_load,4)) ...
            (' ') ...
            char(DeltaL_ht_VF_unit) ...
            '.'];
        ol = UnorderedList({ref1, ref2});
        append(sec,ol);
        % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
% -------------------------------------------------------------------------  
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