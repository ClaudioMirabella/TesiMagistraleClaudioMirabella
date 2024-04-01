function CLmax = CL_max_function(rho, V, WS, n, CLmax_aero_model)

% CLmax = CL_max_function(rho, V, WS, n)
%   A function that calculates the maximum lift coefficient from airspeed
%   and load factor values. The user must check the calculated values to
%   avoid that the maximum equilibrium lift coefficient results higher than
%   the maximum lift coefficient defined in the aerodynamic model.
%
%   INPUT 
%   rho   --> Air density (typically sea level)
%   V     --> Airspeed values from the combined flight envelope
%   WS    --> Wing loading expressed in N/m^2 
%   n     --> Load factor values from the combined flight envelope
%
%   OUTPUT
%   CLmax --> Maximum equilibrium lift coefficient values; the resulting 
%             lift  coefficient values  are related  to the wing - body 
%             configuration 

    % MAXIMUM LIFT COEFFICIENT 
    eq_lift_coeff = (2 / rho) * (1 / V.^2) * (WS) * n;
    
    % CHECKING LIFT COEFFICIENT VALUE AGAINST THE AERO MODEL 
    if eq_lift_coeff <= CLmax_aero_model 
        CLmax = eq_lift_coeff;
    elseif eq_lift_coeff >= CLmax_aero_model 
        CLmax = CLmax_aero_model;
    end
    
end

