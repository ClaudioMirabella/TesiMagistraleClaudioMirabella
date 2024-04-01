function out1 = Schrenk_load_distr(b, S, c_y, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%   TEST CASE: 
%   S      = 66.5 squared feet |  S      = 6.178052 squared meters
%   b      = 19.0 feet         |  b      = 5.7912 meters
%   c_root = 5.0 feet          |  c_root = 1.524 meters
%   c_tip  = 2.0 feet          |  c_tip  = 0.6096 meters

   % Ellipse 
   eta = y/(b/2);
   % Chord distr. for tapered wing 
   ell_height   = ((4*S)/(pi*b));
   x            = sqrt(1 - (eta.^2));
   Ellipse      = ell_height*x;
   Schrenk_cCl  = zeros(length(c_y),1);
   for i = 1:length(c_y)-1
       Schrenk_cCl(i)  = (c_y(i) + Ellipse(i))*0.5;
   end
   Schrenk_cCl(end) = 0;
   global_CL        = (2/S) * trapz(y, Schrenk_cCl);
   if global_CL < 1.0 || global_CL > 1.0
       global_CL   = ( 1.0 / global_CL );
       Unit_Cl     = (global_CL * Schrenk_cCl)./(c_y);
       Schrenk_cCl = Unit_Cl.*c_y;
   end
   % Unit_Cl      = (Schrenk_cCl)./(c_y);
   disp(" ++++ CHECK ++++ ")
   disp(" Cl = Cl(y) ")
   fprintf(" %f", (2/S) * trapz(y, Schrenk_cCl))
   out1 = [eta Ellipse Schrenk_cCl Unit_Cl];
   
end