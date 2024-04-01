function alfa = alpha_fullmodel_inv(CL, CL_max_inv, CL0, CLalfa, alfa0l)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

        alpha_lin   = @(CL, CL0, CLalfa) (CL - CL0) / CLalfa;

            if abs(CL) <= abs(CL_max_inv) 
                alfa = alpha_lin(CL, CL0, CLalfa) - alfa0l;
            elseif abs(CL) > abs(CL_max_inv) 
                CL = CL_max_inv;
                alfa = alpha_lin(CL, CL0, CLalfa) - alfa0l;
            end

end