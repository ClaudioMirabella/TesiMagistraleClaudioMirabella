function n = nGust(rho, V, CLalfa, Kg, Ude, WS)

% nGust : Gust load factor calculation
%   INPUT 
%   rho    --> Air density
%   V      --> Airspeed
%   CLalfa --> Lift curve slope per radians
%   Kg     --> Gust alleviation factor
%   Ude    --> Gust speed
%   WS     --> Wing loading
%   OUTPU 
%   n      --> Gust load factor 

n = 1 + (0.5 * rho * V * CLalfa * Kg * Ude)/(WS);
end

