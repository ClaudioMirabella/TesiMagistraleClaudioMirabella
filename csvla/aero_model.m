classdef aero_model
    %% aero_model - Tools for aerodynamic data interpolation 
    %   This class files are mainly devoted to define functions and methods
    %   that are able to conveniently interpolate all the aerodynamic data
    %   necessary to evluate horizontal tail balancing loads. Following
    %   airworthiness rules, it is possible to define balancing loads as
    %   follow (CS - VLA 421 Balancing loads, pag. 49/190): 
    %   
    %   (a) A horizontal tail balancing load is a load necessary to
    %       maintain equilibrium in any specified flight condition with no
    %       pitching acceleration. 
    %   (b) Horizontal tail surfaces must be designed for the balancing
    %       loads occurring at any point ON THE LIMIT MANOEUVRING ENVELOPE
    %       and IN THE FLAP CONDITIONS specified in CS - VLA 345. 
    %    
    %   This definition can be interpreted as a requirements about the
    %   structural sizing and design of the horizontal empennage in any
    %   possible flight condition that shows to be critical for structural
    %   integrity of the aircraft in static, non - accelerated flight
    %   conditions. Effects on structural sizing of accelerated flight are
    %   not taken into account in this particular case. 

%% Property 2
    properties
        pitch_equilibrium
        % Property defined to collect all the contributes related to 
        % aircraft pitching moment equilibrium. 
    end
    % ---------------------------------------------------------------------
    methods
        % -----------------------------------------------------------------
        function obj = CLWB_contrib(obj, CL, alpha, xac, xcg, bcg, MAC)
            
            % METHOD 1
            % Lift contribution to pitching mom. = CLWBcontrib(obj, CL, alpha, xac, xcg, bcg, MAC)
            % 
            %  This function is able to calculate the lift contribution
            %  related to the pitching moment equilibrium during a
            %  particular flight condition, defined in terms of airspeed V
            %  and load factor n. The equilibrium is taken about the
            %  aircraft center of gravity. This function take into account 
            %  all the terms that can be derived from simplified
            %  representation of the equilibrium condition; projection of 
            %  lift in a two dimensional fashion is performed, and all the 
            %  contributions are summed. 
            %  To be more specific, two contribution to the pitching moment
            %  are relate to the lift produced by the main lifting surface: 
            %  - a vertical component, which produce pitching moment if its
            %    arm with respect to the aircraft center of gravity is
            %    different from zero; 
            %  - an horizontal component, which produce pitching moment if
            %    its arm with respect to the aircraft center of gravity is
            %    different from zero. It must be remembered that, for a
            %    proper designed aircraft, the lift force horizontal
            %    component is relatively small.
            %  
            %  INPUTS 
            %  CL    --> Input lift coefficient, related to a particular
            %            flight condition which is completely defined in
            %            terms of airspeed V and load factor n (aircraft
            %            weight is a known quantity). It must be 
            %            remembered that the CL used here is relative to
            %            a wing - body configuration (wing - fuselage CL
            %            without horizontal empennage)
            %  alpha --> Input angle of attack, used in this function to
            %            correctly project along wind axes the lift force 
            %            components in its vertical and horizontal
            %            component
            %  xac   --> Position along the X - Axis of the aircraft 
            %            aerodynamic center; usually xac = 0.25 for a
            %            typical, subsonic airfoil when Xac is divided by
            %            the Mean Aerodynamic Chord.
            %  xcg   --> Position along the X - Axis of the aircraft center
            %            of gravity; for typical overall geom. arrangement
            %            and loading condition, the xcg could be anywhere
            %            between 0.2 and 0.5 when Xcg is divided by the
            %            Mean Aerodynamic chord
            %  bcg   --> Dimensional, vertical arm of the lift force
            %            horizontal component; this must be divided by the
            %            Mean Aerodynamic chord before to apply the
            %            equation for the pitching mom. equilibrium
            %  MAC   --> Mean Aerodynamic chord
            %
            %  OUTPUTS
            %  LIFT PITCHING MOMENT CONTRIBUTION
            %  It's the main lifting surface contribution to pitching
            %  moment and its lift.
            %
            %  The function calculates the lift coefficient contribution to 
            %  the pitching moment contribution is:
            %
            %                                                          bcg
            %  CLWB_contr = CL*cos(alpha)*(xac - xcg) - CL*sin(alpha)* ---
            %                                                          MAC  
            
            x    = bcg/MAC;
            y    = xac - xcg; 
            ter1 = cos(alpha);
            ter2 = sin(alpha);
            
            obj  = CL*ter1*y - CL*ter2*(x);
        end
        % -----------------------------------------------------------------
        function obj = CDWB_contrib(obj, CD, alpha, xac, xcg, bcg, MAC)
            
            % METHOD 2
            % Drag contribution to pitching mom. = CDWBcontrib(obj, CD, ...
            %                                    alpha, xac, xcg, bcg, MAC)
            % 
            %  This function is able to calculate the drag contribution
            %  related to the pitching moment equilibrium during a
            %  particular flight condition, defined in terms of airspeed V
            %  and load factor n. The equilibrium is taken about the
            %  aircraft center of gravity. This function take into account 
            %  all the terms that can be derived from simplified
            %  representation of the equilibrium condition; projection of 
            %  drag in a two dimensional fashion is performed, and all the 
            %  contributions are summed. 
            %  To be more specific, two contribution to the pitching moment
            %  are relate to the drag produced by the main lifting surface: 
            %  - a vertical component, which produce pitching moment if its
            %    arm with respect to the aircraft center of gravity is
            %    different from zero. It must be remembered that, for a
            %    typical design, the drag force vertical component is 
            %    relatively small;
            %  - an horizontal component, which produce pitching moment if
            %    its arm with respect to the aircraft center of gravity is
            %    different from zero. 
            %  
            %  INPUTS 
            %  CD    --> Input drag coefficient, related to a particular
            %            flight condition which is completely defined in
            %            terms of airspeed V and load factor n (aircraft
            %            weight is a known quantity). It must be 
            %            remembered that the CL used here is relative to
            %            a wing - body configuration (wing - fuselage CL
            %            without horizontal empennage)
            %  alpha --> Input angle of attack, used in this function to
            %            correctly project along wind axes the lift force 
            %            components in its vertical and horizontal
            %            component
            %  xac   --> Position along the X - Axis of the aircraft 
            %            aerodynamic center; usually xac = 0.25 for a
            %            typical, subsonic airfoil when Xac is divided by
            %            the Mean Aerodynamic Chord.
            %  xcg   --> Position along the X - Axis of the aircraft center
            %            of gravity; for typical overall geom. arrangement
            %            and loading condition, the xcg could be anywhere
            %            between 0.2 and 0.5 when Xcg is divided by the
            %            Mean Aerodynamic chord
            %  bcg   --> Dimensional, vertical arm of the lift force
            %            horizontal component; this must be divided by the
            %            Mean Aerodynamic chord before to apply the
            %            equation for the pitching mom. equilibrium
            %  MAC   --> Mean Aerodynamic chord
            %
            %  OUTPUTS
            %  DRAG PITCHING MOMENT CONTRIBUTION
            %  It's the main lifting surface contribution to pitching
            %  moment and its drag.
            %
            %  The function calculates the drag coefficient contribution to 
            %  the pitching moment contribution is:
            %
            %                              bcg
            %  CDWB_contr = CD*cos(alpha)* --- - CD*sin(alpha)*(xac - xcg)
            %                              MAC  
            
            obj  = CD*cos(alpha)*(bcg/MAC) - CD*sin(alpha)*(xac - xcg);
        end
        % -----------------------------------------------------------------
        function obj = CT_contr(obj, CD, h, MAC)
            % METHOD 3
            % Thrust contribution to pitching mom. = CTcontrib(obj, CD, h, MAC)
            % 
            %  This function is able to calculate the thrust contribution
            %  related to the pitching moment equilibrium during a
            %  particular flight condition, defined in terms of airspeed V
            %  and load factor n. The equilibrium is taken about the
            %  aircraft center of gravity. To model the thrust, we start 
            %  the obvious consideration that thrust must be at least equal
            %  to drag for sustained, levelled, steady flight; therefore,
            %  in this function the thrust coefficient is considered equal
            %  to the drag coefficient. The moment arm of thrust action 
            %  line with respect to the aircraft center of gravity is
            %  indicated with h.
            %  
            %  INPUTS 
            %  CD    --> Input drag coefficient, related to a particular
            %            flight condition which is completely defined in
            %            terms of airspeed V and load factor n (aircraft
            %            weight is a known quantity). It must be 
            %            remembered that the CD used here is relative to
            %            a wing - body configuration (wing - fuselage CD
            %            without horizontal empennage)
            %  h     --> Moment arm measured in meters of the thrust action
            %            line with respect to the center of gravity; this
            %            value must be divided by the Mean Aerodynamic
            %            chord 
            %  MAC   --> Mean Aerodynamic chord
            %
            %  OUTPUTS
            %  THRUST PITCHING MOMENT CONTRIBUTION
            %  It's the pitching moment contribution associated with thrust
            %  produced by the power train.
            %
            %  The function calculates the drag coefficient contribution to 
            %  the pitching moment contribution is:
            %
            %                  h
            %  CTcontr = CD * ---
            %                 MAC    
            
            obj = CD*(h/MAC);
        end
        % -----------------------------------------------------------------
        function obj = CM_aboutcg(obj, CM0, CM_landgear, CMCL, CL)
            % METHOD 4
            % Pitching mom. about c.g. = CM_aboutcg(obj, CM0, CM_landgear, CMCL, CL)
            % 
            %  This function is able to calculate the thrust contribution
            %  related to the pitching moment equilibrium during a
            %  particular flight condition, defined in terms of airspeed V
            %  and load factor n. The equilibrium is taken about the
            %  aircraft center of gravity. To model the thrust, we start 
            %  the obvious consideration that thrust must be at least equal
            %  to drag for sustained, levelled, steady flight; therefore,
            %  in this function the thrust coefficient is considered equal
            %  to the drag coefficient. The moment arm of thrust action 
            %  line with respect to the aircraft center of gravity is
            %  indicated with h.
            %  
            %  INPUTS 
            %  CM0         --> Zero - lift pitching moment of the wing -
            %                  body configuration 
            %  CM_landgear --> Pitching moment associated with the
            %                  extendend landing gear flight condition; it
            %                  is a constant value
            %  CMCL        --> Pitching moment curve slope, defined in
            %                  terms of lift coefficient variation
            %                                              d Cm
            %                  Pitching mom. curve slope = ----
            %                                              d CL
            %  CL          --> Input lift coefficient, related to a
            %                  particular flight condition which is 
            %                  completely defined in terms of airspeed V 
            %                  and load factor n (aircraft weight is a 
            %                  known quantity). It must be remembered that
            %                  the CL used here is relative to a 
            %                  wing - body configuration (wing - fuselage 
            %                  CL without horizontal empennage)
            %
            %  OUTPUTS
            %  PURE PITCHING MOMENT CONTRIBUTION
            %  Pure pitching moment associated with a typical flight 
            %  vehicle.
            %
            %  The function calculates the CM wing - body coefficient:
            %
            %                 d Cm
            %  CMcontr = CL * ---- + CM0 + (CM)_Landing_Gear
            %                 d CL
            
            obj = CM0 + CM_landgear + CL*(CMCL);
        end
        % -----------------------------------------------------------------
        function obj = CL_Tail(obj, CLwb_contr, CDwb_contr, CT_contr, CM, l_tail, MAC, xac, xcg, alpha)
            % METHOD 5
            % Horizontal tail lift coefficient = CL_Tail(obj, CLwb_contr, CDwb_contr, CT_contr, CM, l_tail, MAC, xac, xcg, alpha)
            % 
            %  This function is able to calculate the horizontal tail lift
            %  coefficient associated with the prescribed flight condition,
            %  defined in terms of airspeed V and load factor n. This lift
            %  coefficient is essential to correctly size the horizontal
            %  tail structure and to get a knowledge about the extra lift
            %  that the main lifting surface must produce to achieve
            %  steady, non - accelerated, levelled flight to compensate for
            %  the airloads acting on the horizontal tail. 
            %  
            %  INPUTS 
            %  CLwb_contr --> Pitching mom. contribution associated with
            %                 wing - body lift
            %  CDwb_contr --> Pitching mom. contribution associated with
            %                 wing - body drag
            %  CT_contr   --> Pitching mom. associated with non baricentral
            %                 thrust 
            %  CM         --> Pitching mom. of the wing body configuration 
            %  l_tail     --> Horizontal tail mom. arm 
            %  MAC        --> Mean Aerodynamic chord
            %  xac        --> Aerodynamic center position in unit of mean
            %                 aerodynamic chord
            %  xcg        --> Center of gravity position in unit of mean
            %                 aerodynamic chord
            %  alpha      --> Angle of attack at the prescribed flight
            %                 condition
            %
            %  OUTPUTS
            %  CL_Tail   ---> Tail lift coefficient
            %
            %  The function calculates the CL_Tail with the following
            %  equilibrium relationship:
            %
            %             (CLwb_contr + CDwb_contr + CT_contr + CM)
            %  CL_Tail =  -----------------------------------------
            %                l_tail    
            %               -------- + (xac - xcg) * cos(alpha)
            %                  MAC
            %
            
            obj = (CLwb_contr + CDwb_contr + CT_contr + CM)/((l_tail/MAC) + (xac - xcg)*cos(alpha));
        end
        % -----------------------------------------------------------------
    end
end

