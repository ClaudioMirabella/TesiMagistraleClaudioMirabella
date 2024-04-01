function Vstall = Vstall(WS, rho, CLmax, n)
    % STALL SPEED FUNCTION CALCULATOR
    % INPUT 
    % WS     --> Wing loading in N/m^2
    % rho    --> Air density per standard atmosphere
    % CLmax  --> Lift coefficient at the stall
    % n      --> Load factors
    % OUTPUT 
    % Vstall --> Stall airspeed
    
    Vstall = sqrt(WS * (2/rho) * (1/CLmax).*n); 
end