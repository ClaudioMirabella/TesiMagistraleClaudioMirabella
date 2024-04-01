classdef csvla
%% CLASS TO EVALUATE LOADS FOLLOWING CS - VLA AIRWORTHINESS RULES    
    % CS - VLA Amdt1 -  05 Mar 2009
    %
    % CS - VLA 1 Applicability
    % This airworthiness code is applicable to aeroplanes with a single
    % engine, spark or compression-ignition, having not more than two
    % seats, with a Max Certificated Takeoff Weight of not more than 750 kg
    % and a stalling speed in the landing configuration of not more than 83
    % km/h (45 KCAS) to be approved for day-VFR only. 
    % 
    % CS - VLA 3 Aeroplane categories
    % This CS - VLA applies to aeroplanes intended for non - aerobatic
    % operation only. Non - aerobatic operation includes 
    %  (a) Any manoeuvre incident to normal flying;
    %  (b) Stalls, excepts whip stalls; and 
    %  (c) Lazy eights, chandelles, and steep turns, in which the angle of
    %      bank is not more than 60 degrees. 
    % CS - VLA 301 Loads 
    %  (a) Strength requrements are specified in terms of limit loads,
    %      the maximum loads to be expected in service, and ultimate
    %      loads, limit loads multiplied by prescribed factors of
    %      safety. Unless otherwise provided, prescribed loads are
    %      limit loads. 
    %  (b) Unless otherwise provided, the air, groun, and water loads
    %      must be placed in equilibrium with inertia forces,
    %      considering each item of mass in the aeroplane. These loads
    %      must be distributed to conservatively approximate or closely
    %      represent actual conditions. 
    %  (c) If deflections under load would significantly change the
    %      distribution of external or internal loads, this
    %      redistribution must be taken into account.
    %  (d) Simplified structural design criteria given in this Subpart
    %      C and its appendices may be used only for aeroplanes with
    %      conventional configurations. If Appendix A is used, the
    %      entire appendix must be substituted for the corresponding
    %      paragraphs of this subpart, i.e. CS - VLA 321 to 459, see
    %      also CS - VLA 301 (d).
%% FUNCTIONS USED TO PLOT THE V - N DIAGRAM 
    properties
        flightenvelope
        % CS - VLA 333 Flight envelope 
        % (a) General 
        %     Compliance with the strength requirements of this subpart
        %     must be shown at any combination of airspeed and load factor
        %     on and within the boudaries of a flight envelope, similar to
        %     the one in sub - paragraph(d) of this paragraph, that
        %     represents the envelope of the flight loading conditions
        %     specified by the manoeuvring and gust criteria of sub -
        %     paragraphs (b) and (c) of this paragraph respectively. 
        % (b) Manoeuvring envelope 
        %     Except where limited by maximum static lift coefficient, the
        %     aeroplane is assumed to be subjected to symm. manoeuvres
        %     resulting in the following limit load fators:
        %     (1) the positive manoeuvring load factore specified in CS -
        %         VLA 337 at speed up to VD;
        %     (2) the negative manoeuvring load factore specified in CS -
        %         VLA 337 at VC; and 
        %     (3) factors varying linearly with speed from the specified
        %         value at VC to 0.0 at VD.
    end
    
    methods
        %% FLIGHT ENVELOPE - FIRST METHOD 
        function obj = calcn(obj, nmax)
            % n = calcn(obj, nmax)
            %  Function that calculates load factors values along the
            %  stall curve for flight envelope calculation.
            %
            %  CS - VLA 337 Limit manoeuvring load factors
            %  (a) The positive limit manoeuvring load factor n may not be
            %      less than 3.8. 
            %  (b) The negative limit manoeuvring load factor may not be
            %      less than -1.5.
            %  
            %  INPUT
            %  nmax = Appliable limit load factor
            %  OUTPUT 
            %  n    = Vector of load factor values
            
            % indexes =500;
            indexes = 1e5;
            
            if nmax > 0.0
            obj = linspace(0.0, 2*nmax, indexes)';  
            elseif nmax < 0.0 
            obj = linspace(0.0, 2*nmax, indexes)';  
            end
        end
        %% FLIGHT ENVELOPE - SECOND METHOD
        function obj = calcvs(obj, rho, WS, CLmax, n)
            % vs = calcvs(obj, rho, WS, CLmax, n)
            %  Stall speed values correspondent to limit load 
            %  factors (from 1g to limit g's). 
            %
            %  CS - VLA 335 Design Airspeeds (1)(i)
            %  VS is a computed stalling speed with flaps retracted at the
            %  design weight, normally based on the maximum aeroplane
            %  normal force coefficients, CNA.            
            %  CS - VLA 335 Design Airspeeds (1)(ii)
            %  n is the limit manoeuvring load factor used in design.
            %
            %  INPUT 
            %  rho   = Density at the selected altitude [kg/m**3]
            %  WS    = Wing loading in [Pa]
            %  CLmax = Applicable maximum lift coefficient 
            %  n     = Vector of limit load values
            %  OUTPUT
            %  vs    = Vector of stall speed values
            
            obj = sqrt(WS*(2/rho)*(1/CLmax).*n);
        end
        %% FLIGHT ENVELOPE - THIRD METHOD
        function obj = calcvd(obj, vcmin, vc)
            % Design dive speed CS-VLA(b)(1)(2) VD
            %  Vd must not be less than (1.25)*Vc; and, with Vc min,
            %  the required minimum design cruising speed, Vd may 
            %  not be less than (1.40)*Vcmin.
            % 
            %  INPUT 
            %  vcmin = The required minimum design cruising speed, VD may
            %          not be less than 1.40*VCmin
            %  vc    = Design cruise speed, which may not be less than 
            %                        Vc > 4.7*sqrt(W/S)
            %          where 
            %          W/S = Wing loading in [Pa]
            %          Vc  = Cruise speed in [m/s]         

            vd1 = 1.4*vcmin;
            vd2 = 1.25*vc;
            if vd1 > vd2
                obj = vd1;
            elseif vd2 > vd1
                obj = vd2;
            end
        end
        %% FLIGHT ENVELOPE - FOURTH METHOD
        function obj = calcvc(obj, WS)
        % function obj = calcvc(obj, WS, VH) 
            % Cruisespeed CS-VLA(a)(1)(2), Design cruise speed
            %   Vc (in m/s) may not be less than
            %               Vc > 2.4*sqrt(W/S)
            %   where 
            %   W/S = Wing loading in [Pa]
            %   Vc  = Cruise speed in [m/s]
            %   
            %   Vc need not to be more than 0.9*Vh at sea 
            %   level, where 
            %   Vh  = Max continous power max horizontal 
            %         speed in [m/s]
            %   
            disp(" WARNING: VH not available! ")
            obj = (2.4)*sqrt(WS);
            % x   = (0.9)*VH;
            % if obj > x
            %    obj = x;
            %else 
            %    obj = obj;
            % end 
        end
        %% FLIGHT ENVELOPE - FIFTH METHOD
        function obj = V_n_diagram(obj, npos, nneg, nmax, nmin, VSpos, VSneg, VD, VG, Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        % fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %    This function plot the V - n diagram, based on the applied regulation.
        %    The applied regulation is stored inside the local variable 'Reg' for
        %    convenience and it is used to automatically change the output figure
        %    title name. Also, the selected aircraft name is stored inside the
        %    variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %    This might be a useful feature. 
        %    INPUTS 
        %         npos          --> An array of positive load factors
        %         nneg          --> An array of negative load factors 
        %         nmax          --> Positive maximum load factor
        %         nmin          --> Negative minimum load factor
        %         VSpos         --> An array of positive stall speeds 
        %         VSneg         --> An array of negative stall speeds
        %         VD            --> Aircraft dive speed (positive side)
        %         VG            --> Aircraft dive speed (negative side)
        %         VA            --> Aircraft positive manoeuvring speed
        %         VE            --> Aircraft negative manoeuvring speed 
        %         Reg           --> Applied regulation from 'Aircraft' struct 
        %         Aircraft_name --> Aircraft name from 'Aircraft' struct
        %    OUTPUT
        %         fig1          --> The V-N diagram
        %    
        %    FURTER REFERENCES
        %         The V-N diagram is based on: 
        %
        %         CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %         
        %         EASA Airworthiness rules can be find at 
        %         url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf
        %    
        obj = figure;
        hold on
        grid on 
        grid minor
        ylim([nmin-0.5 nmax+0.5])
        xlim([0 VD+10])
        plot(VSpos, npos, ':r', 'LineWidth',0.2)
        plot(VSneg, nneg, ':r', 'LineWidth',0.2)
        tol = 1E-2;
        for i = 1:length(npos)
            if abs(nmax - npos(i)) < tol
                x = i;               
            end
        end
        temp1 = 1;
        for i = 1:length(npos)
            if abs(1 - npos(i)) < tol 
                temp1 = i;
            end
        end
        plot(VSpos(temp1:x), npos(temp1:x), '-r', 'LineWidth',1)
        for i = 1:length(nneg)
            if abs(nmin - nneg(i)) < tol
                y = i;               
            end
        end
        temp2 = 1; 
         for i = 1:length(npos)
            if abs(-1 - nneg(i)) < tol 
                temp2 = i;
            end
        end
        plot(VSneg(temp2:y), nneg(temp2:y), '-r', 'LineWidth',1)
        plot([VSpos(x) VD], ...
             [nmax nmax], '-b', 'LineWidth',1)
        plot([VSneg(y) VG], ...
             [nmin nmin], '-b', 'LineWidth',1)
        plot([VD VG], ...
             [nmax nmin], '-b', 'LineWidth',1)
        plot([VSpos(temp1) VSpos(temp1)], ...
             [npos(temp1) 0.0], '-b', 'LineWidth',1)
        plot([VSneg(temp2) VSneg(temp2)], ...
             [0.0 nneg(temp2)], '-b', 'LineWidth',1)
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        text(5, 4, Aircraft_name)                                % Aircraft name inside the plot
        text(47.0, nmax-0.2, '\fontname{Courier} C')
        text(49.0, nmin+0.2, '\fontname{Courier} F')
        text(59.0, nmax-0.2, '\fontname{Courier} D')
        text(59.0, nmin+0.2, '\fontname{Courier} E')
        text(VSpos(x), nmax-0.2, '\fontname{Courier} A')
        text(VSneg(y), nmin-0.2, '\fontname{Courier} G')
        exportgraphics(obj,'vndiagram.pdf','ContentType','vector')
        exportgraphics(obj,'vndiagram.png','ContentType','vector')
        end
    end
    %% FUNCTIONS USED TO PLOT THE V - N DIAGRAM     
    properties
       gustenvelope 
        % CS - VLA 333 Flight envelope 
        % (c) Gust envelope 
        %     (1) The aeroplane is assumed to be subjected to symmetrical
        %         vertical gusts in level flight. The resulting limit load
        %         factors must correspond to the conditions determined as
        %         follows: 
        %         (i)  positive, i.e. up, and negative, i.e. down, gusts of
        %              15.24 m/s at VC must be considered; 
        %         (ii) positive and negative gusts of 7.62 m/s at VD must
        %              be considered. 
        %     (2) The following assumptions must be made:
        %         (i)  The shape of the gust is
        %              U = (Ude/2)*(1 - cos((2*pi*S)/(25*MAC)))
        %              where 
        %              S   = distance penetrated into gust in meters;
        %              MAC = mean geometric chord of wing in meters; and 
        %              Ude = derived gust velocity referred to in
        %                    sub-paragraph (c)(1) in meters per second
        %         (ii) Gust load factors vary linearly with speed between
        %              VC and VD.
    end
    methods
        %% GUST ENVELOPE - FIRST METHOD 
        function obj = calcmug(obj, WS, MAC, a, rho, g)
            % n = calckg(obj, nmax)
            %  Function that calculates gust alleviation factor Kg.
            %
            %  See page 41 of 190 EASA CS - VLA Easy Access
            %  CS - VLA 341 Gust load factors 
            %  In the absence of a more rational analysis, the gust load
            %  factors may be computed as follows: 
            %  
            %  n = 1 + (0.5*rho0*V*a*Kg*Ude)/(WS)
            % 
            %  Kg   = (0.88*mug)/(5.3 + mug) = gust alleviation factor;
            %  mug  = 2(M/S)/(rho*MAC*a) = aeroplanes mass ratio;
            %  Ude  = derived gust velocities referred to in CS-VLA 333(c)
            %         in meters per seconds
            %  rho0 = density of air at sea level (kg/m^3); 
            %  rho  = density of air (kg/m^3); 
            %  M/S  = wing loading (kg/m^2); 
            %  MAC  = mean geometric chord (m); 
            %  g    = acceleration due to gravity (m/s^2); 
            %  a    = slope of the aeroplane normal force coefficient curve
            %         CNA per radian if the gust loads are applied to the
            %         wings and horizontal tail surfaces simultaneously by
            %         a rational method. The wing lift curve slope CL per
            %         radian may be used when the gust load is applied to
            %         the wings only and the horizontal tail gust loads are
            %         treated as a separate condition.
            obj = 2*(WS/g)/(rho*MAC*a);
        end        
        %% GUST ENVELOPE - SECOND METHOD 
        function obj = calckg(obj, mug)
            % n = calckg(obj, nmax)
            %  Function that calculates gust alleviation factor Kg.
            %
            %  See page 41 of 190 EASA CS - VLA Easy Access
            %  CS - VLA 341 Gust load factors 
            %  In the absence of a more rational analysis, the gust load
            %  factors may be computed as follows: 
            %  
            %  n = 1 + (0.5*rho0*V*a*Kg*Ude)/(WS)
            % 
            %  Kg   = (0.88*mug)/(5.3 + mug) = gust alleviation factor;
            %  mug  = 2(M/S)/(rho*MAC*a) = aeroplanes mass ratio;
            %  Ude  = derived gust velocities referred to in CS-VLA 333(c)
            %         in meters per seconds
            %  rho0 = density of air at sea level (kg/m^3); 
            %  rho  = density of air (kg/m^3); 
            %  M/S  = wing loading (kg/m^2); 
            %  MAC  = mean geometric chord (m); 
            %  g    = acceleration due to gravity (m/s^2); 
            %  a    = slope of the aeroplane normal force coefficient curve
            %         CNA per radian if the gust loads are applied to the
            %         wings and horizontal tail surfaces simultaneously by
            %         a rational method. The wing lift curve slope CL per
            %         radian may be used when the gust load is applied to
            %         the wings only and the horizontal tail gust loads are
            %         treated as a separate condition.
            obj = (0.88*mug)/(5.3 + mug);
        end
        %% GUST ENVELOPE - THIRD METHOD 
        function obj = calcngust(obj, rho0, a, Kg, Ude, WS, VC, VD, caso)
            % n = calcn(obj, nmax)
            %  Function that calculates load factors values along the
            %  stall curve for gust envelope calculation.
            %
            %  See page 41 of 190 EASA CS - VLA Easy Access
            %  CS - VLA 341 Gust load factors 
            %  In the absence of a more rational analysis, the gust load
            %  factors may be computed as follows: 
            %  
            %  n = 1 + (0.5*rho0*V*a*Kg*Ude)/(WS)
            % 
            %  Kg   = (0.88*mug)/(5.3 + mug) = gust alleviation factor;
            %  mug  = 2(M/S)/(rho*MAC*a) = aeroplanes mass ratio;
            %  Ude  = derived gust velocities referred to in CS-VLA 333(c)
            %         in meters per seconds
            %  rho0 = density of air at sea level (kg/m^3); 
            %  rho  = density of air (kg/m^3); 
            %  M/S  = wing loading (kg/m^2); 
            %  MAC  = mean geometric chord (m); 
            %  g    = acceleration due to gravity (m/s^2); 
            %  a    = slope of the aeroplane normal force coefficient curve
            %         CNA per radian if the gust loads are applied to the
            %         wings and horizontal tail surfaces simultaneously by
            %         a rational method. The wing lift curve slope CL per
            %         radian may be used when the gust load is applied to
            %         the wings only and the horizontal tail gust loads are
            %         treated as a separate condition;
            %  V    = Generic airspeed; it must be less than VC if Ude in
            %         cruise is used, or it must be less than VD if Ude in
            %         diving is used;
            %  caso = A string containing the case that it is desired to
            %         analyze; it could be 
            %         --> 'positive_cruise'
            %         --> 'negative_cruise'
            %         --> 'positive_dive'
            %         --> 'negative_dive'
            
            % indexes = 500;
            indexes = 1e3;
            
            if Ude == abs(15.24) 
                V = linspace(0.0, VC, indexes)';
            elseif Ude == abs(7.62) 
                V = linspace(0.0, VD, indexes)';
            end
            % -------------------------------------------------------------
            switch (caso)
                case 'positive_cruise' 
                    obj = 1.0 + V*((0.5*rho0*a*Kg*Ude)/(WS));
                case 'negative_cruise' 
                    obj = 1.0 - V*((0.5*rho0*a*Kg*Ude)/(WS));
                case 'positive_dive'
                    obj = 1.0 + V*((0.5*rho0*a*Kg*Ude)/(WS));
                case 'negative_dive'
                    obj = 1.0 - V*((0.5*rho0*a*Kg*Ude)/(WS));
            end
        end
        %% GUST ENVELOPE - FOURTH METHOD
        function obj = Gust_envelope(obj, npos, nneg, VSpos, VSneg, VD, ...
                                     nmax, nmin, VG, V_cruise, V_dive, ...
                                     ngust_plus_cruise, ngust_neg_cruise, ...
                                     ngust_plus_dive, ngust_neg_dive, ...
                                     Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        % fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %    This function plot the V - n diagram, based on the applied regulation.
        %    The applied regulation is stored inside the local variable 'Reg' for
        %    convenience and it is used to automatically change the output figure
        %    title name. Also, the selected aircraft name is stored inside the
        %    variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %    This might be a useful feature. 
        %    INPUTS 
        %         npos          --> An array of positive load factors
        %         nneg          --> An array of negative load factors 
        %         VSpos         --> An array of positive stall speeds 
        %         VSneg         --> An array of negative stall speeds
        %         VD            --> Aircraft dive speed (positive side)
        %         VG            --> Aircraft dive speed (negative side)
        %         VA            --> Aircraft positive manoeuvring speed
        %         VE            --> Aircraft negative manoeuvring speed 
        %         Reg           --> Applied regulation from 'Aircraft' struct 
        %         Aircraft_name --> Aircraft name from 'Aircraft' struct
        %    OUTPUT
        %         fig2          --> The Gust Envelope
        %    
        %    FURTER REFERENCES
        %         The V-N diagram is based on: 
        %
        %         CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %         
        %         EASA Airworthiness rules can be find at 
        %         url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf
        %    
        obj = figure;
        hold on
        grid on 
        grid minor
        ylim([ngust_neg_cruise(end)-0.5 ngust_plus_cruise(end)+0.5])
        xlim([0 VD+10])
        plot(VSpos, npos, ':r', 'LineWidth',0.2)
        plot(VSneg, nneg, ':b', 'LineWidth',0.2)
        tol = 1E-2;
        temp1 = 1;
        temp2 = 1;
        for i = 1:length(npos)
            if abs(nmax - npos(i)) < tol
                temp1 = i;               
            end
        end
        for i = 1:length(nneg)
            if abs(nmin - nneg(i)) < tol
                temp2 = i;               
            end
        end
        plot([VSpos(temp1) VD], ...
             [nmax nmax], '-r', 'LineWidth',1)
        plot([VSneg(temp2) VG], ...
             [nmin nmin], '-b', 'LineWidth',1)
        plot([VD VG], ...
             [nmax 0.0], '-r', 'LineWidth',1)
        plot([VD VG], ...
             [0.0 nmin], '-b', 'LineWidth',1)
        for i = 1:length(npos) 
            if abs(1 - npos(i)) < tol 
                temp3 = i; 
            end
        end
        plot([VSpos(temp3) VSpos(temp3)], ...
             [npos(temp3) 0.0], '-r', 'LineWidth',1)
        for i = 1:length(nneg) 
            if abs(-1 - nneg(i)) < tol 
                temp4 = i; 
            end
        end         
        plot([VSneg(temp4) VSneg(temp4)], ...
             [0.0 nneg(temp4)], '-b', 'LineWidth',1)
        plot(VSpos(temp3:temp1), npos(temp3:temp1), '-r', 'LineWidth',1)
        plot(VSneg(temp4:temp2), nneg(temp4:temp2), '-b', 'LineWidth',1)
        plot(V_cruise, ngust_plus_cruise, 'color', '#80B3FF', 'LineWidth',1)
        plot(V_cruise, ngust_neg_cruise,'color', '#80B3FF', 'LineWidth',1)
        plot(V_dive, ngust_plus_dive, 'color', '#80B3FF', 'LineWidth',1)
        plot(V_dive, ngust_neg_dive, 'color', '#80B3FF' , 'LineWidth',1)  
        plot([V_cruise(end), V_dive(end)], [ngust_plus_cruise(end), ngust_plus_dive(end)], 'color', '#80B3FF')
        plot([V_cruise(end), V_dive(end)], [ngust_neg_cruise(end), ngust_neg_dive(end)], 'color', '#80B3FF')
        text(47.0, nmax-0.2, '\fontname{Courier} C')
        text(49.0, nmin+0.2, '\fontname{Courier} F')
        text(59.0, nmax-0.2, '\fontname{Courier} D')
        text(59.0, nmin+0.2, '\fontname{Courier} E')
        text(VSpos(temp1), nmax-0.2, '\fontname{Courier} A')
        text(VSneg(temp2), nmin-0.2, '\fontname{Courier} G')
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("Gust envelope per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        text(5, 4, Aircraft_name)                                % Aircraft name inside the plot
        exportgraphics(obj,'Gustenvelope.pdf','ContentType','vector')
        exportgraphics(obj,'Gustenvelope.png','ContentType','vector')
        end
    end
    %% FUNCTIONS USED TO TRACK THE FINAL ENVELOPE    
    properties
       finalenvelope 
        % CS - VLA 333 Flight envelope 
        % (c) Gust envelope 
        %     (1) The aeroplane is assumed to be subjected to symmetrical
        %         vertical gusts in level flight. The resulting limit load
        %         factors must correspond to the conditions determined as
        %         follows: 
        %         (i)  positive, i.e. up, and negative, i.e. down, gusts of
        %              15.24 m/s at VC must be considered; 
        %         (ii) positive and negative gusts of 7.62 m/s at VD must
        %              be considered. 
        %     (2) The following assumptions must be made:
        %         (i)  The shape of the gust is
        %              U = (Ude/2)*(1 - cos((2*pi*S)/(25*MAC)))
        %              where 
        %              S   = distance penetrated into gust in meters;
        %              MAC = mean geometric chord of wing in meters; and 
        %              Ude = derived gust velocity referred to in
        %                    sub-paragraph (c)(1) in meters per second
        %         (ii) Gust load factors vary linearly with speed between
        %              VC and VD.
    end    
    methods
        %% FINAL ENVELOPE - FIRST METHOD
        function obj = stall_speed_limit1(obj, VA, vstall, vgust, nstall, ...
                                          ngust, nmax, VC)
        % FUNCTION DETAILED DESCRIPTION 
        %  This function is able to obtain a stall speed vector which
        %  include the gust speed lines tracked with respect the cruise
        %  speed of the aircraft. This function can be used for positive
        %  and negative stall speed and load factors values. 
        %  INPUTS 
        %         VA      --> Aircraft positive manoeuvring speed
        %         vstall  --> Stall speed vector
        %         vgust   --> Gust speed vector 
        %         nstall  --> Stall load factors 
        %         ngust   --> Gust load factors 
        %         nmax    --> Maximum applicable load factor
        %  OUTPUTS
        %         [VS nS] --> A two-dimensional array containing the newly
        %                     calculated stall speed vector and the newly
        %                     calculated load factors vector
        %
        %  The objective is to track automatically all the curves of the
        %  flight envelope, as prescribed by applicable airworthiness
        %  regulation.
        
        temp1 = 1;
        temp2 = 1;
        temp3 = 1;
        temp4 = 1;
        temp5 = 1;
        temp6 = 1;
        tol  = 1E-3;
        vs    = abs(vstall);
        vg    = abs(vgust);
        va    = abs(VA); 
        vc    = abs(VC);
            % -------------------------------------
            for i = 1:length(vg) 
                if abs(va - vg(i)) < tol
                    temp1 = i; 
                end
            end
            for j = 1:length(vs)
                if abs(va - vs(j)) < tol
                    temp2 = j;
                end
            end
            for k = 1:length(vg)
                if abs(vc - vg(k)) < tol
                    temp5 = k;
                end
            end
            for n = 1:length(vs)
                if abs(vc - vs(n)) < tol
                    temp6 = n;
                end
            end
            % ------------------------------------
        % -------------------------------------
         ng    = abs(ngust);
         ns    = abs(nstall);
         nm    = abs(nmax);
        % -------------------------------------
             if abs(ng(temp1) - nm) < tol
                 disp('Stall speed is unchanged by gust');
             elseif abs(ng(temp1) - nm) > tol 
                 disp('Stall speed must be changed');
                        % tol  = 1E-4;
                 for i = 1:length(ns) 
                     for j = 1:length(ng) 
                         if abs(ns(i) - ng(j)) < tol
                             temp3 = i;
                         end
                     end
                 end
             end
        % -------------------------------------
        if nmax < 0
                for i = 1:length(ns) 
                    if abs(ns(i) - 1.0) < tol
                        temp4 = i;
                    end
                end
        elseif nmax > 0 
                for i = 1:length(ns) 
                    if abs(1.0 - ns(i)) < tol
                        temp4 = i;
                    end
                end
        end
        new_vstall = vstall(temp4:temp3);
        new_nstall = nstall(temp4:temp3); 
        obj = [new_vstall new_nstall];
        end
        %% FINAL ENVELOPE - SECOND METHOD
        function obj = back_envelope_points(obj, vgust, ngust, VD, ...
                                            vstall, nstall, nmax)      
        % FUNCTION DETAILED DESCRIPTION 
        %  This function is able to obtain a stall speed vector which
        %  include the gust speed lines tracked with respect the cruise
        %  speed of the aircraft. This function can be used for positive
        %  and negative stall speed and load factors values. 
        %  INPUTS 
        %         VD      --> Aircraft dive speed
        %         vstall  --> Stall speed vector
        %         vgust   --> Gust speed vector 
        %         nstall  --> Stall load factors 
        %         ngust   --> Gust load factors 
        %         nmax    --> Maximum applicable load factor
        %  OUTPUTS
        %         Curves or points that close the flight envelope.
        %
        %  The objective is to track automatically all the curves of the
        %  flight envelope, as prescribed by applicable airworthiness
        %  regulation.
        vg  = abs(vgust); 
        vs  = abs(vstall); 
        ng  = abs(ngust);
        ns  = abs(nstall);
        nm  = abs(nmax); 
        tol = 1E-3; 
            if abs(ng(end) - nm) < tol 
                disp('Case 1')
                disp('Gust load factor are nearly equal to max load factor')
                vAD = [vstall(end) VD];
                nAD = [nstall(end) nmax];
            elseif abs(ng(end) - nm) > tol
                disp('Case 2')
                disp('Gust load factor is greater or lower than max load factor')
                vAD = [vstall(end) vgust(end)];
                nAD = [nstall(end) ngust(end)];
                if abs(ngust(end)) < nm
                    nAD = [nstall(end) nm];
                end
            end
        obj = [vAD; nAD];
        end
        %% FINAL ENVELOPE - METHOD
        function obj = Final_envelope(obj, npos, nneg, VSpos, VSneg, VC, nC, ...
                                      V_fg, n_fg, VD, nD, VF, nF, VE, nE, VA, ...
                                      nA, VG, nG, Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        %  fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %  This function plot the V - n diagram, based on the applied regulation.
        %  The applied regulation is stored inside the local variable 'Reg' for
        %  convenience and it is used to automatically change the output figure
        %  title name. Also, the selected aircraft name is stored inside the
        %  variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %  This might be a useful feature. 
        %      INPUTS 
        %       +++ POSITIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++
        %       npos          --> An array of positive load factors
        %       VSpos         --> An array of positive stall speeds 
        %       VC            --> Max positive cruise speed
        %       VD            --> Aircraft dive speed (positive side) 
        %       +++ NEGATIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++ 
        %       nneg          --> An array of negative load factors 
        %       VSneg         --> An array of negative stall speeds
        %       VF            --> Max negative cruise speed
        %       VE            --> Aircraft dive speed (negative side)
        %       +++ INFORMATION RELATED TO AIRCRAFT AND REGULATION +++
        %       Reg           --> Applied regulation from 'Aircraft' struct 
        %       Aircraft_name --> Aircraft name from 'Aircraft' struct
        %      OUTPUT
        %       fig3          --> Final Flight Envelope
        %            
        %      FURTER REFERENCES
        %       The V-N diagram is based on: 
        %         
        %              CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %                 
        %       EASA Airworthiness rules can be find at 
        %        url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf

        obj = figure;
        hold on
        grid on 
        grid minor
        % ylim([nF-0.5 nC+0.5])
        % xlim([0 VD+10])
        plot(VSpos, npos, '-r', 'LineWidth', 1)
        plot(VSneg, nneg, '-b', 'LineWidth', 1)
        plot(VSpos(end), npos(end), 'k.', 'MarkerSize', 10)
        plot([VSpos(1) VSpos(1)], [npos(1) 0.0], '-r.', 'LineWidth', 1, 'MarkerSize', 10)
        plot([VSneg(1) VSneg(1)], [nneg(1) 0.0], '-b.', 'LineWidth', 1, 'MarkerSize', 10)
        plot(VA, nA, 'r.', 'MarkerSize', 10)
        plot([VC V_fg], ...
             [nC n_fg], '-r.', 'LineWidth', 1, 'MarkerSize', 10)
        plot([V_fg VD], [n_fg nD], '-r.', 'LineWidth', 1, 'MarkerSize', 10)
        plot([VF VD], ...
             [nF nE], '-b.', 'LineWidth', 1, 'MarkerSize', 10)
        plot(VG, nG, 'b.', 'MarkerSize', 10)
        plot([VD VD], ...
             [nD 0.0], '-r.', 'LineWidth', 1, 'MarkerSize', 10)  
        plot([VD VD], ...
             [0.0 nE], '-b.', 'LineWidth', 1, 'MarkerSize', 10)      
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("Final envelope per ", Reg, "Interpreter", "latex")     % Applied regulation from 'Aircraft' struct
        text(2.5, 5.2, Aircraft_name)                                 % Aircraft name inside the plot
        text(VC-1.0, nC+0.2, '\fontname{Courier}   C')
        text(VF+1.0, nF-0.2, '\fontname{Courier}   F')
        text(VD-0.5, nD+0.2, '\fontname{Courier}   D')
        text(VD-0.5, nE-0.2, '\fontname{Courier}   E')
        text(VA+0.0, nA+0.0, '\fontname{Courier}   A')
        text(VG+0.0, nG+0.1, '\fontname{Courier}   G')
        exportgraphics(obj,'Finalenvelope.pdf','ContentType','vector')
        exportgraphics(obj,'Finalenvelope.png','ContentType','vector')
        end
        %% BALANCING LOADS - METHOD
        function obj = Balancing_loads(obj, HT_Lift_posstall, VSpos, ...
                                            HT_Lift_negstall, VSneg, ... 
                                            HT_Lift_fromCtofg, V_fromCtofg, ...
                                            HT_Lift_fromfgtoD, V_fromfgtoD, ...
                                            HT_Lift_fromDtoE, V_fromDtoE, ...
                                            HT_Lift_fromFtoE, V_fromFtoE, ...
                                            HT_Lift_unit_load_factor, V_unit_load_factor, ...
                                            VA, VG, ...
                                            Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        %  fig1 = V_n_diagram(HT_Lift_posstall, VSpos, HT_Lift_negstall, VSneg, ...
        %                     HT_Lift_fromCtoD, V_fromCtoD, HT_Lift_fromDtoE, ... 
        %                     V_fromDtoE, HT_Lift_fromFtoE, V_fromFtoE, Reg, Aircraft_name)
        %
        %  This function plot the airloads acting on the horizontal tail of
        %  an aircraft, based on the applied regulation.
        %  The applied regulation is stored inside the local variable 'Reg' for
        %  convenience and it is used to automatically change the output figure
        %  title name. Also, the selected aircraft name is stored inside the
        %  variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %  This might be a useful feature. 
        %
        %      INPUTS 
        %       +++ POSITIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++
        %       HT_Lift_posstall --> An array of lift values, relative to a
        %                            flight condition associated with
        %                            positive values of the load factor
        %       VSpos            --> An array of positive stall speeds 
        %       HT_Lift_fromCtoD --> An array of lift values, from point C
        %                            to point D of the flight envelope 
        %       V_fromCtoD       --> An array of airspeeds, from point C to
        %                            point D of the flight envelope
        %       +++ NEGATIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++ 
        %       HT_Lift_negstall --> An array of lift values, relative to a
        %                            flight condition associated with
        %                            negative values of the load factor 
        %       VSneg            --> An array of negative stall speeds
        %       HT_Lift_fromFtoE --> An array of lift values, relative to a
        %                            flight condition associated with nega-
        %                            tive load factors, from point F to
        %                            point E of the flight envelope
        %       V_fromFtoE       --> An array of airspeeds, from point F to
        %                            point E of the flight envelope
        %       +++ INFORMATION RELATED TO AIRCRAFT AND REGULATION +++
        %       Reg              --> Applied regulation from 'Aircraft' struct 
        %       Aircraft_name    --> Aircraft name from 'Aircraft' struct
        %      OUTPUT
        %       fig5             --> Balancing loads on the horizontal tail
        %            
        %      FURTER REFERENCES
        %       The V-N diagram is based on: 
        %         
        %              CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %                 
        %       EASA Airworthiness rules can be find at 
        %        url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf

        obj = figure;
        hold on
        grid on 
        grid minor
        index_va = dsearchn(VSpos, VA);
        index_vg = dsearchn(VSneg, VG);
        % ylim([min(HT_Lift_posstall)-0.5 max(HT_Lift_fromDtoE)+0.5])
        xlim([18.0 max(V_fromDtoE)+5])
        plot(VSpos, HT_Lift_posstall, '-r', 'LineWidth', 1)
        plot(VSneg, HT_Lift_negstall, '-r', 'LineWidth', 1)
        plot(V_fromCtofg, HT_Lift_fromCtofg, '-r', 'LineWidth', 1)
        plot(V_fromfgtoD, HT_Lift_fromfgtoD, '-r', 'LineWidth', 1)
        plot(V_fromDtoE, HT_Lift_fromDtoE, '-r', 'LineWidth', 1)
        plot(V_fromFtoE, HT_Lift_fromFtoE, '-r', 'LineWidth', 1)
        plot(V_unit_load_factor, HT_Lift_unit_load_factor, '-.k', 'LineWidth', 2)
        plot(VSpos(1), HT_Lift_posstall(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(VSpos(index_va), HT_Lift_posstall(index_va),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromCtofg(1), HT_Lift_fromCtofg(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromfgtoD(end), HT_Lift_fromfgtoD(end),'k.','MarkerSize', 10,'LineStyle','none');
        plot(VSneg(index_vg), HT_Lift_negstall(index_vg),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromFtoE(1), HT_Lift_fromFtoE(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromFtoE(end), HT_Lift_fromFtoE(end),'k.','MarkerSize', 10,'LineStyle','none');
        % ---------------------------------------------------------------------
        text(VSpos(1), HT_Lift_posstall(1), '\fontname{Courier} Point S', 'FontSize', 6)
        text(VSpos(index_va), HT_Lift_posstall(index_va), '\fontname{Courier} Point A', 'FontSize', 6)
        text(41.5, -18, 'n = 1')
        text(V_fromCtofg(1), HT_Lift_fromCtofg(1), '\fontname{Courier} Point C', 'FontSize', 6)
        text(V_fromfgtoD(end), HT_Lift_fromfgtoD(end), '\fontname{Courier} Point D', 'FontSize', 6)
        text(VSneg(index_vg), HT_Lift_negstall(index_vg), '\fontname{Courier} Point G', 'FontSize', 6)
        text(V_fromFtoE(1), HT_Lift_fromFtoE(1), '\fontname{Courier} Point F', 'FontSize', 6)
        text(V_fromFtoE(end), HT_Lift_fromFtoE(end), '\fontname{Courier} Point E', 'FontSize', 6)
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Horizontal tail lift - $L_{ht}$ (daN)", "Interpreter", "latex")
        title("Horizontal empennage airloads per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        % text(51, -9, Aircraft_name)                                              % Aircraft name inside the plot
        exportgraphics(obj, 'Balancingloads.pdf', 'ContentType', 'vector')
        exportgraphics(obj, 'Balancingloads.png', 'ContentType', 'vector')
        end
        %% BALANCING LOADS - WING LOADS DIAGRAM
        function obj = Mainwing_loads(obj, WING_Lift_posstall, VSpos, ...
                                            WING_Lift_negstall, VSneg, ... 
                                            WING_Lift_fromCtofg, V_fromCtofg, ...
                                            WING_Lift_fromfgtoD, V_fromfgtoD, ...
                                            WING_Lift_fromDtoE, V_fromDtoE, ...
                                            WING_Lift_fromFtoE, V_fromFtoE, ...
                                            Wing_unit_load_factor, V_unit_load_factor, ...
                                            VA, VG, ...
                                            Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        %  fig1 = V_n_diagram(WING_Lift_posstall, VSpos, WING_Lift_negstall, VSneg, ...
        %                     WING_Lift_fromCtoD, V_fromCtoD, WING_Lift_fromDtoE, ... 
        %                     V_fromDtoE, WING_Lift_fromFtoE, V_fromFtoE, Reg, Aircraft_name)
        %
        %  This function plot the airloads acting on the horizontal tail of
        %  an aircraft, based on the applied regulation.
        %  The applied regulation is stored inside the local variable 'Reg' for
        %  convenience and it is used to automatically change the output figure
        %  title name. Also, the selected aircraft name is stored inside the
        %  variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %  This might be a useful feature. 
        %
        %      INPUTS 
        %       +++ POSITIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++
        %       WING_Lift_posstall --> An array of lift values, relative to 
        %                              a flight condition associated with
        %                              positive values of the load factor
        %       VSpos              --> An array of positive stall speeds 
        %       WING_Lift_fromCtoD --> An array of lift values, from point 
        %                              C to point D of the flight envelope 
        %       V_fromCtoD         --> An array of airspeeds, from point C 
        %                              to point D of the flight envelope
        %       +++ NEGATIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++ 
        %       WING_Lift_negstall --> An array of lift values, relative to 
        %                              a flight condition associated with
        %                              negative values of the load factor 
        %       VSneg              --> An array of negative stall speeds
        %       WING_Lift_fromFtoE --> An array of lift values, relative to 
        %                              a flight condition associated with 
        %                              negative load factors, from point F 
        %                              to point E of the flight envelope
        %       V_fromFtoE         --> An array of airspeeds, from point F 
        %                              to point E of the flight envelope
        %       +++ INFORMATION RELATED TO AIRCRAFT AND REGULATION +++
        %       Reg                --> Applied regulation from 'Aircraft'
        %                              struct 
        %       Aircraft_name      --> Aircraft name from 'Aircraft' struct
        %      OUTPUT
        %       fig5               --> Balancing loads on the horizontal
        %                              tail
        %            
        %      FURTER REFERENCES
        %       The V-N diagram is based on: 
        %         
        %              CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %                 
        %       EASA Airworthiness rules can be find at 
        %        url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf

        obj = figure;
        hold on
        grid on 
        grid minor
        index_va = dsearchn(VSpos, VA);
        index_vg = dsearchn(VSneg, VG);
        ylim([min(WING_Lift_fromFtoE)-20 max(WING_Lift_fromCtofg)+20])
        xlim([18 max(V_fromDtoE)+7])
        plot(VSpos, WING_Lift_posstall, '-r', 'LineWidth', 1)
        plot(VSneg, WING_Lift_negstall, '-r', 'LineWidth', 1)
        plot(V_fromCtofg, WING_Lift_fromCtofg, '-r', 'LineWidth', 1)
        plot(V_fromfgtoD, WING_Lift_fromfgtoD, '-r', 'LineWidth', 1)
        plot(V_fromDtoE, WING_Lift_fromDtoE, '-r', 'LineWidth', 1)
        plot(V_fromFtoE, WING_Lift_fromFtoE, '-r', 'LineWidth', 1)
        plot(V_unit_load_factor, Wing_unit_load_factor, '-.k', 'LineWidth', 2)
        plot(VSpos(1), WING_Lift_posstall(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(VSpos(index_va), WING_Lift_posstall(index_va),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromCtofg(1), WING_Lift_fromCtofg(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromfgtoD(end), WING_Lift_fromfgtoD(end),'k.','MarkerSize', 10,'LineStyle','none');
        plot(VSneg(index_vg), WING_Lift_negstall(index_vg),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromFtoE(1), WING_Lift_fromFtoE(1),'k.','MarkerSize', 10,'LineStyle','none');
        plot(V_fromFtoE(end), WING_Lift_fromFtoE(end),'k.','MarkerSize', 10,'LineStyle','none');
        % ---------------------------------------------------------------------
        text(VSpos(1), WING_Lift_posstall(1), '\fontname{Courier} Point S', 'FontSize', 6)
        text(VSpos(index_va), WING_Lift_posstall(index_va), '\fontname{Courier} Point A', 'FontSize', 6)
        text(V_fromCtofg(1), WING_Lift_fromCtofg(1), '\fontname{Courier} Point C', 'FontSize', 6)
        text(V_fromfgtoD(end), WING_Lift_fromfgtoD(end), '\fontname{Courier} Point D', 'FontSize', 6)
        text(VSneg(index_vg), WING_Lift_negstall(index_vg), '\fontname{Courier} Point G', 'FontSize', 6)
        text(V_fromFtoE(1), WING_Lift_fromFtoE(1), '\fontname{Courier} Point F', 'FontSize', 6)
        text(V_fromFtoE(end), WING_Lift_fromFtoE(end), '\fontname{Courier} Point E', 'FontSize', 6)  
        text(40.0, 90.0, 'n = 1') 
        % ---------------------------------------------------------------------
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Main wing lift - $L$ (daN)", "Interpreter", "latex")
        title("Main wing airloads per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        % text(16, 500, Aircraft_name)                                              % Aircraft name inside the plot
        exportgraphics(obj, 'Wingairloads.pdf', 'ContentType', 'vector')
        exportgraphics(obj, 'Wingairloads.png', 'ContentType', 'vector')
        end
    end
%% FLAPS DEPLOYED FLIGHT ENVELOPE
    properties
        flapsenvelope
    % CS - VLA 345 High lift devices 
    %  
    %  (a) If flaps or similar high lift devices to be used for take-off,
    %      approach or landing are installed, the aeroplane, with the flaps
    %      fully deflected at VF, is assumed to be subjected to symmetrical
    %      manoeuvres and gusts resulting in limit load factors within the
    %      range determined by 
    %      (1) Manoeuvring to a positive limit load factor of 2.0; and 
    %      (2) Positive and negative gust of 7.62 m/s acting normale to the
    %          flight path in level flight.
    %
    %  (b) VF must be assumed to be not less than 1.4*VS or 1.8*VSF, whichever
    %      is greater, where 
    %      VS --> Is the computed stalling speed with flaps retracted at the
    %             design weight; and 
    %     VSF --> Is the computed stalling speed with flaps fully extended at
    %             the design weight.
    %      However, if an automatic flap load limiting device is used, the
    %      aeroplane may be designed for the critical combinations of airspeed
    %      and flap position allowed by that device. 
    % 
    %  (c) In designing the flaps and supporting structures the following must
    %      be accounted for:
    %      (1) A head-on gust of 7.62 m/s (Equivalent airspeed).
    %      (2) The slipstream effects specified in CS - VLA 457 (b). 
    %
    %  (d) In determining external loads on the aeroplane as a whole, thrust, 
    %      slipstream and pitching acceleration may be assumed to be zero.
    %
    %  (e) The requirements of CS - VLA 457 and this paragraph may be complied
    %      with separately or in combination. 
    %
    % CS - VLA 457 Wing flaps 
    %  (a) The wing flpas, their operating mechanisms and their supporting
    %      structure must be designed for critical loads occurring in the
    %      flaps-extended flight conditions with the flaps in any position.
    %      However, if an automatic flap load limiting device is used, these
    %      components may be designed for the critical combinations of airspeed
    %      and flap position allowed by that device. 
    %
    %  (b) The effects of propeller slipstream, corresponding to take-off
    %      power, must be taken into account not less than 1.4*VS, where VS is 
    %      the computed stalling speed with flaps fully rectracted at the
    %      design weight. For the investigation of slipstream effects, the load
    %      factor may be assumed to be 1.0.
    end
    
    methods
        %% FLIGHT ENVELOPE - FIRST METHOD 
        function obj = calcnflap(obj, nmax)
            % n = calcn(obj, nmax)
            %  Function that calculates load factors values along the
            %  stall curve for flaps envelope calculation.
            %
            %  
            %  INPUT
            %  nmax = Appliable limit load factor 
            %  OUTPUT 
            %  n    = Vector of load factor values
            
            % indexes =500;
            indexes = 1e3;
            
            if nmax > 0.0
            obj = linspace(0.0, 2*nmax, indexes)';  
            elseif nmax < 0.0 
            obj = linspace(0.0, 2*nmax, indexes)';  
            end
        end
        % FLAP SPEED CALCULATION
        function obj = calcnVF(obj, VS, VS1)
        % CS - VLA 345 High lift devices 
        %  
        %  (a) If flaps or similar high lift devices to be used for take-off,
        %      approach or landing are installed, the aeroplane, with the flaps
        %      fully deflected at VF, is assumed to be subjected to symmetrical
        %      manoeuvres and gusts resulting in limit load factors within the
        %      range determined by 
        %      (1) Manoeuvring to a positive limit load factor of 2.0; and 
        %      (2) Positive and negative gust of 7.62 m/s acting normale to the
        %          flight path in level flight.
        %
        %  (b) VF must be assumed to be not less than 1.4*VS or 1.8*VSF, whichever
        %      is greater, where 
        %      VS --> Is the computed stalling speed with flaps retracted at the
        %             design weight; and 
        %     VSF --> Is the computed stalling speed with flaps fully extended at
        %             the design weight.
        %      However, if an automatic flap load limiting device is used, the
        %      aeroplane may be designed for the critical combinations of airspeed
        %      and flap position allowed by that device. 
        vs  = 1.4*VS;
        vs1 = 1.8*VS1; 
        
        if vs > vs1 
            VF = vs;
        elseif vs1 > vs 
            VF = vs1;
        end
        obj = VF;
        
        end
        %
        function obj = flapsenvelope_diagram(obj, npos, nmax, VSpos, VS, VF, Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        % fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %    This function plot the V - n diagram, based on the applied regulation.
        %    The applied regulation is stored inside the local variable 'Reg' for
        %    convenience and it is used to automatically change the output figure
        %    title name. Also, the selected aircraft name is stored inside the
        %    variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %    This might be a useful feature. 
        %    INPUTS 
        %         npos          --> An array of positive load factors
        %         nneg          --> An array of negative load factors 
        %         nmax          --> Positive maximum load factor
        %         nmin          --> Negative minimum load factor
        %         VSpos         --> An array of positive stall speeds 
        %         VSneg         --> An array of negative stall speeds
        %         VD            --> Aircraft dive speed (positive side)
        %         VG            --> Aircraft dive speed (negative side)
        %         VA            --> Aircraft positive manoeuvring speed
        %         VE            --> Aircraft negative manoeuvring speed 
        %         Reg           --> Applied regulation from 'Aircraft' struct 
        %         Aircraft_name --> Aircraft name from 'Aircraft' struct
        %    OUTPUT
        %         fig1          --> The V-N diagram
        %    
        %    FURTER REFERENCES
        %         The V-N diagram is based on: 
        %
        %         CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %         
        %         EASA Airworthiness rules can be find at 
        %         url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf
        %    
        obj = figure;
        hold on
        grid on 
        grid minor
        ylim([-0.5 nmax+0.5])
        xlim([0 VF+10])
        plot(VSpos, npos, ':r', 'LineWidth',0.2)
        tol = 1E-3;
        for i = 1:length(npos)
            if abs(nmax - npos(i)) < tol
                x = i;               
            end
        end
        temp1 = 1;
        for i = 1:length(npos)
            if abs(1 - npos(i)) < tol 
                temp1 = i;
            end
        end
        plot(VSpos(temp1:x), npos(temp1:x), '-r', 'LineWidth',1)
        plot([VSpos(x) VF], ...
             [nmax nmax], '-b', 'LineWidth',1)
        plot([VF VF], ...
             [nmax 0], '-b', 'LineWidth',1)
        plot([VSpos(temp1) VSpos(temp1)], ...
             [npos(temp1) 0.0], '-b', 'LineWidth',1)
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("Flaps envelope diagram per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        text(15, 1.8, Aircraft_name)                                % Aircraft name inside the plot
        text(VSpos(temp1)-2.0, 1.2, '\fontname{Courier} S')
        text(VF-2.0, nmax+0.2, '\fontname{Courier} F')
        exportgraphics(obj,'flapsenvelopediagram.pdf','ContentType','vector')
        exportgraphics(obj,'flapsenvelopediagram.png','ContentType','vector')
        end
        %
        function obj = flaps_gust_envelope_diagram(obj, npos, nmax, VSpos, ngust, Vgust, VS, VF, Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        % fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %    This function plot the V - n diagram, based on the applied regulation.
        %    The applied regulation is stored inside the local variable 'Reg' for
        %    convenience and it is used to automatically change the output figure
        %    title name. Also, the selected aircraft name is stored inside the
        %    variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %    This might be a useful feature. 
        %    INPUTS 
        %         npos          --> An array of positive load factors
        %         nneg          --> An array of negative load factors 
        %         nmax          --> Positive maximum load factor
        %         nmin          --> Negative minimum load factor
        %         VSpos         --> An array of positive stall speeds 
        %         VSneg         --> An array of negative stall speeds
        %         VD            --> Aircraft dive speed (positive side)
        %         VG            --> Aircraft dive speed (negative side)
        %         VA            --> Aircraft positive manoeuvring speed
        %         VE            --> Aircraft negative manoeuvring speed 
        %         Reg           --> Applied regulation from 'Aircraft' struct 
        %         Aircraft_name --> Aircraft name from 'Aircraft' struct
        %    OUTPUT
        %         fig1          --> The V-N diagram
        %    
        %    FURTER REFERENCES
        %         The V-N diagram is based on: 
        %
        %         CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %         
        %         EASA Airworthiness rules can be find at 
        %         url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf
        %    
        obj = figure;
        hold on
        grid on 
        grid minor
        ylim([-0.5 nmax+0.5])
        xlim([0 VF+10])
        plot(VSpos, npos, ':r', 'LineWidth',0.2)
        tol = 1E-3;
        for i = 1:length(npos)
            if abs(nmax - npos(i)) < tol
                x = i;               
            end
        end
        temp1 = 1;
        for i = 1:length(npos)
            if abs(1 - npos(i)) < tol 
                temp1 = i;
            end
        end
        plot(VSpos(temp1:x), npos(temp1:x), '-r', 'LineWidth',1)
        plot([VSpos(x) VF], ...
             [nmax nmax], '-b', 'LineWidth',1)
        plot([VF VF], ...
             [nmax 0], '-b', 'LineWidth',1)
        plot([VSpos(temp1) VSpos(temp1)], ...
             [npos(temp1) 0.0], '-b', 'LineWidth',1)
        plot(Vgust, ngust, '-k', 'LineWidth',1)
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("Flaps envelope diagram per ", Reg, "Interpreter", "latex") % Applied regulation from 'Aircraft' struct
        text(15, 1.8, Aircraft_name)                                % Aircraft name inside the plot
        text(VSpos(temp1)-2.5, 1.2, '\fontname{Courier} S')
        text(VF-2.5, nmax+0.2, '\fontname{Courier} F')
        exportgraphics(obj,'flaps_gust_envelopediagram.pdf','ContentType','vector')
        exportgraphics(obj,'flaps_gust_envelopediagram.png','ContentType','vector')
        end
        %
        function obj = Final_gust_envelope(obj, nmax, npos, VSpos, V_g, n_g, VS, nS, VF, nF, Reg, Aircraft_name)
        % FUNCTION DETAILED DESCRIPTION
        %  fig1 = V_n_diagram(npos, nneg, VSpos, VSneg, VD, VG, VA, VE, Reg, Aircraft_name)
        %  This function plot the V - n diagram, based on the applied regulation.
        %  The applied regulation is stored inside the local variable 'Reg' for
        %  convenience and it is used to automatically change the output figure
        %  title name. Also, the selected aircraft name is stored inside the
        %  variable 'Aircraft_name' and is inserted in the diagram as plain text.
        %  This might be a useful feature. 
        %      INPUTS 
        %       +++ POSITIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++
        %       npos          --> An array of positive load factors
        %       VSpos         --> An array of positive stall speeds 
        %       VC            --> Max positive cruise speed
        %       VD            --> Aircraft dive speed (positive side) 
        %       +++ NEGATIVE SIDE OF THE FLIGHT ENVELOPE DIAGRAM +++ 
        %       nneg          --> An array of negative load factors 
        %       VSneg         --> An array of negative stall speeds
        %       VF            --> Max negative cruise speed
        %       VE            --> Aircraft dive speed (negative side)
        %       +++ INFORMATION RELATED TO AIRCRAFT AND REGULATION +++
        %       Reg           --> Applied regulation from 'Aircraft' struct 
        %       Aircraft_name --> Aircraft name from 'Aircraft' struct
        %      OUTPUT
        %       fig3          --> Final Flight Envelope
        %            
        %      FURTER REFERENCES
        %       The V-N diagram is based on: 
        %         
        %              CS-VLA 333 FLIGHT ENVELOPE, pag. 39/190
        %                 
        %       EASA Airworthiness rules can be find at 
        %        url: https://www.easa.europa.eu/sites/default/files/dfu/Easy Access Rules CS-VLA (Amendment 1).pdf

        obj = figure;
        hold on
        grid on 
        grid minor
        % ylim([nF-0.5 nC+0.5])
        % xlim([0 VD+10])
        plot(VSpos, npos, ':r', 'LineWidth', 1)  
        tol = 1e-3;
        for i = 1:length(npos)
            if abs(nmax - npos(i)) < tol
                temp1 = i;               
            end
        end
        for i = 1:length(npos)
            x = n_g(i);
            y = abs(x - npos(i));
            if (y < tol) 
                temp2 = i;
            end
        end
        for i = 1:length(npos)
            if abs(1.0 - npos(i)) < tol
                temp3 = i;               
            end
        end
        plot(V_g, n_g, '--k', 'LineWidth', 0.25)
        plot(VSpos(temp3:temp2), npos(temp3:temp2), '-r', 'LineWidth', 1)
        plot([VSpos(temp2) VF], [npos(temp2) nmax], 'r', 'LineWidth', 1)
        plot([VF VF], [nmax 0.0], 'r', 'LineWidth', 1)
        plot([VSpos(temp3) VSpos(temp3)], [1.0 0.0], 'r', 'LineWidth', 1)
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("Final envelope per ", Reg, "Interpreter", "latex")     % Applied regulation from 'Aircraft' struct
        text(12.5, 1.5, Aircraft_name)                                 % Aircraft name inside the plot
        text(VSpos(temp3), 1.2, '\fontname{Courier} Point S')
        text(VF+1.0, nF+0.2, '\fontname{Courier} Point F')
        exportgraphics(obj,'Final_flap_envelope.pdf','ContentType','vector')
        exportgraphics(obj,'Final_flap_envelope.png','ContentType','vector')
     end
    end
end
