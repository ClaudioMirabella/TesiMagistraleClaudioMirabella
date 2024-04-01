function alfa_interp = alpha_fullmodel(CL, a2, b2, c2, CL_max, ...
                                       CL_star, CL0, CLalfa)
                                   
% alfa_interp = alpha_fullmodel(CL, a2, b2, c2, CL_max, CL_star, CL0, CLalfa)
%   Angle of attack calculator function. The previously defined aerodynamic
%   model is used to calculate angle of attack values from the actual lift
%   coefficient (wing-body).
%   
%   INPUT
%   CL      --> Actual lift coefficient calculated from airspeed and load 
%               factor values from the combined flight envelope
%   a2      --> Interpolation coefficient, quadratic term
%   b2      --> Interpolation coefficient, linear term
%   c2      --> Interpolation coefficient, constant term
%   CL_max  --> Maximum lift coefficient value calculated from the
%               aerodynamic model
%   CL_star --> Lift coefficient where the linear part of the lift curve
%               ends
%   CL0     --> Lift coefficient at alpha equals to zero calculated from 
%               the aerodynamic model
%   CLalfa  --> Lift curve slope coefficient (in 1/rad) calculated from the
%               aerodynamic model
%
%   OUTPUT 
%   alfa    --> Angle of attack, calculated from the linear or quadratic
%               lift coefficient curve, as defined by the aerodynamic model
%               interpolation coefficients.

        % FUNCTIONS THAT CALCULATE ALPHA FROM THE AERODYNAMIC MODEL
        alpha_lin   = @(CL, CL0, CLalfa) (CL - CL0) / CLalfa;
        alpha_plus  = @(CL, a, b, c) (-b + sqrt(b^2 - 4*a*(c - CL)))/(2*a);

        % CHECKING THE LIFT COEFFICIENT VALUE
        if CL > CL_max
            disp("ERROR: The code will stop now!")
            disp("WARNING: There is no solution for alpha with this lift coefficient! ")
            disp("CL = CLmax")
            CL = CL_max;
        end
        
            % BACK ENVELOPE ALONG THE WING LIFT CURVE 
            % If the lift coefficient is less than CL_star, the resulting
            % lift coefficient is calculated from the linear part of the
            % lift curve. If the lift coefficient is higher than CL_star,
            % the resulting lift coefficient is calculated from the
            % inerpolation data (parabolic curve-fitting).
            if CL <= CL_star 
                alfa_interp = alpha_lin(CL, CL0, CLalfa);
            elseif CL > CL_star
                alfa_interp = alpha_plus(CL, a2, b2, c2);
                if ~isreal(alfa_interp) == 1
                    disp(" WARNING: negative number under square root ")
                    disp("          CL is greater than CLmax wingbody ")
                    error("WARNING: There is no solution for alpha with this lift coefficient! ")
                elseif ~isreal(alfa_interp) == 0
                    alfa_interp = alpha_plus(CL, a2, b2, c2);
                end
            end

end

