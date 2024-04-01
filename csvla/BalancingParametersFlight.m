function [CL_wb, alfa, CD, q, CM_CL, CM_CD, CM_CT, CM_CG, CL_ht, CL_new, L_wb, L_new, L_ht] = BalancingParametersFlight(obj1, ...
                                                                                                        rho, V , WS, n, CLmax_aero_model, alfa0l, ...
                                                                                                        a2 , b2, c2, CL_star, CL0, CLalfa, p_CD, ...
                                                                                                        CL_max_inv, XAC, XCG, bCG, MAC, h, CM0, ...
                                                                                                        CM_landing_gear, CM_slope, S, l_ht)
                                                                                                    
% BalancingParametersStraightFligt(rho, V , WS, n, CLmax_aero_model , a2 , b2, c2, CL_star, CL0, CLalfa, p_CD, ...
%                                  XAC, XCG, bCG, MAC, Thrust_axes, CM0, CM_landing_gear, CM_slope, S, S_ht, l_ht) 
%   Function that calculates parameters related to equilibrium straight
%   flight. 
%
%   INPUT 
%   rho              --> Air density 
%   V                --> Airspeed from the flight envelope
%   WS               --> Wing loading 
%   n                --> Load factor from the flight envelope
%   CLmax_aero_model --> Max lift coefficient from the aerodynamic model
%   a2               --> Interpolation coefficient, quadratic term
%   b2               --> Interpolation coefficient, linear term
%   c2               --> Interpolation coefficient, constant term
%   CL_star          --> Lift coefficient at the end of the linear part of
%                        the lift curve
%   CL0              --> Lift at zero angle of attack
%   CLalfa           --> Lift curve slope in 1/deg
%   p_CD             --> Interpolation coefficients for the drag polar
%   XAC              --> Aerodynamic centre abscissa in MAC percentage
%   XCG              --> Centre of gravity absissa in MAC percentage
%   bCG              --> Dimensional, vertical arm of the lift force
%                        horizontal component; this must be divided by the
%                        Mean Aerodynamic chord before to apply the
%                        equation for the pitching mom. equilibrium
%   MAC              --> Mean aerodynamic chord
%   h                --> Moment arm measured in meters of the thrust action
%                        line with respect to the center of gravity; this
%                        value must be divided by the Mean Aerodynamic
%                        chord
%   CM0              --> Pitching moment coefficient at zero angle of
%                        attack
%   CM_landing_gear  --> Pitching moment contribute to the landing gear 
%   CM_slope         --> Slope of the pitching moment curve (a straight
%                        line)
%   S                --> Wing surface
%   S_ht             --> Horizontal tail surface
%   l_ht             --> Horizontal tail moment arm
%
%   OUTPUT
%   CL_wb  --> Wing body lift coefficient
%   alfa   --> Angle of attack
%   CD     --> Wing body drag coefficient 
%   q      --> Dynamic pressure
%   CM_CL  --> Lift pitching moment coefficient contribute
%   CM_CD  --> Drag pitching moment coefficient contribute
%   CM_CT  --> Thrust coefficient pitching moment coefficient contribute
%   CM_CG  --> Total pitching moment coefficient
%   CL_ht  --> Lift coefficient of the horizontal tail
%   CL_new --> Full-vehicle lift coefficient
%   L_wb   --> Wing-body lift in daN
%   L_new  --> Full-vehicle lift in daN
%   L_ht   --> Horizontal tail in daN

CL_wb = CL_max_function(rho, V, WS, n, CLmax_aero_model);                           % Non dimensional
if abs(CL_wb) > CLmax_aero_model
    CL_wb = CLmax_aero_model;
end

if n >= 0
    alfa  = alpha_fullmodel(CL_wb, a2, b2, c2, CLmax_aero_model, CL_star, CL0, CLalfa); % Degrees
elseif n < 0 
    alfa  = alpha_fullmodel_inv(CL_wb, CL_max_inv, CL0, CLalfa, alfa0l); % Degrees
end
CD    = polyval(p_CD, alfa);                                                        % Non dimensional
q     = 0.5* rho * V^2;                                                             % Pascals
CM_CL = CLWB_contrib(obj1, CL_wb, deg2rad(alfa), XAC, XCG, bCG, MAC);               % Non dimensional
CM_CD = CDWB_contrib(obj1, CD, deg2rad(alfa), XAC, XCG, bCG, MAC);                  % Non dimensional
CM_CT = CT_contr(obj1, CD, h, MAC);                                                 % Non dimensional
CM_CG = CM_aboutcg(obj1, CM0, CM_landing_gear, CM_slope, CL_wb);                    % Non dimensional
CL_ht = CL_Tail(obj1, CM_CL, CM_CD, CM_CT, CM_CG, ...                               % Non dimensional
                l_ht, MAC, XAC, XCG, deg2rad(alfa));
            
% FULL-VEHICLE LIFT COEFFICIENT   
% wb  = wing-body
% new = full-vehicle
% ht  = horizontal-tail
CL_new = CL_wb - CL_ht; % Starting full-vehicle coefficient
tol    = 1e-3;          % tolerance
k      = 1;             % counter

% ITERATION TO OBTAIN THE EQUILIBRIUM LIFT COEFFICIENT
    while abs(CL_wb - CL_new) > tol  
        if n >= 0
            alfa_new = alpha_fullmodel(CL_new, a2, b2, c2, CLmax_aero_model, CL_star, CL0, CLalfa); % Degrees
        elseif n < 0 
            alfa_new = alpha_fullmodel_inv(CL_new, CL_max_inv, CL0, CLalfa, alfa0l); % Degrees
        end
        CD_new    = polyval(p_CD, alfa_new);                                                     % Non dimensional
        CM_CL     = CLWB_contrib(obj1, CL_new, deg2rad(alfa_new), XAC, XCG, bCG, MAC);           % Non dimensional
        CM_CD     = CDWB_contrib(obj1, CD_new, deg2rad(alfa_new), XAC, XCG, bCG, MAC);           % Non dimensional
        CM_CT     = CT_contr(obj1, CD_new, h, MAC);                                              % Non dimensional
        CM_CG     = CM_aboutcg(obj1, CM0, CM_landing_gear, CM_slope, CL_new);                    % Non dimensional
        CL_ht_new = CL_Tail(obj1, CM_CL, CM_CD, CM_CT, CM_CG, ...                                % Non dimensional
                            l_ht, MAC, XAC, XCG, deg2rad(alfa_new));
        CL_ht     = CL_ht_new;                                                                   % Non dimensional
        CL_new    = CL_wb - CL_ht;                                                               % Non dimensional
        CL_wb     = CL_wb + (CL_new - CL_wb) * 1e-1;                                             % Non dimensional
        
        % Update counter
        k         = k + 1;        
        % Check the counter
        if k == 20  
            break
        end
    end 

% LIFT CALCULATION
L_wb  = q * S * CL_wb  * 1e-1;
L_new = q * S * CL_new * 1e-1;
L_ht  = q * S * CL_ht * 1e-1;

end

