function W_wing = WingWeightCESSNA(MTOW, S_wing, nmax, AR, wing_type_flag)

% WingWeightCESSNA Cessna method for quick wing weight estimation

%   Function that implements the wing weight estimation method proposed by
%   Cessna's engineers. The following equations should be applied only to
%   small, relatively low performance type airplanes with max speeds below
%   200 knots. The equations apply to wings of two types: 
%   1. Cantilever wings 
%   2. Strut braced wings
%   Both equations include: weight of wing tip fairing, wing control
%   surfaces. 
%   Both equations exclude: fuel tanks, wing/fuselage spar carry-through
%   structure, effect of sweep angle.
%   
%   INPUT 
%   MTOW   --> Maximum takeoff weight in [lb]
%   S_wing --> Wing area in [ft^2]
%   nmax   --> Limit load factor; it must be multiplied by the safety
%              factor 1.25
%   AR     --> Wing aspect ratio
%
%   OUTPUT
%   W_wing --> Wing weight in [lb]

MTOW_lb   = MTOW * 2.20462;
S_wing_ft = S_wing * 10.7639;

    switch(wing_type_flag)
        case "Cantilever_wing"
            a  = 0.04674; 
            c1 = 0.397;
            c2 = 0.360;
            c3 = 0.397;
            c4 = 1.712; 
            W_wing = a * (MTOW_lb^(c1)) * (S_wing_ft^(c2)) * ((1.25 * nmax)^(c3)) * (AR^(c4));
        case "Strut_braced_wing"
            a  = 0.002933; 
            c1 = 1.018; 
            c2 = 2.473; 
            c3 = 0.611; 
            W_wing = a * (S_wing_ft^c1) * (AR^c2) * ((1.25 * nmax)^c3);
    end
W_wing = W_wing / 2.20462; % Conversione to kilograms
end

