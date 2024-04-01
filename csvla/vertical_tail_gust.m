function [mu_g_vt, k_g_vt] = vertical_tail_gust(Mass, rho, MAC_vt, g, a_vt, S_vt, rad_of_gyr_vt, l_vt)

    % Vertical tail gust calculations - Quick function 
    %
    %   INPUT 
    %   Mass          --> Aircraft mass in [kg]
    %   rho           --> Standard atmosphere air density [kg/m^3]
    %   MAC_vt        --> Vertical tail mean aerodynamic chord [m]
    %   g             --> Gravity constant [m/s^2]
    %   a_vt          --> Normal force coefficient slope of the vertical tail
    %                     expressed in [1/rad]
    %   S_vt          --> Vertical tail surface [m^2]
    %   rad_of_gyr_vt --> Radius of gyration of the vertical tail [m]
    %   l_vt          --> Moment arm of the vertical tail [m]
    %
    %   OUTPUT 
    %   mu_g_vt --> Mass factor for the vertical tail 
    %   k_g_vt  --> Gust alleviation factor of the vertical tail

    mu_g_vt = (( 2 * Mass )/( rho * MAC_vt * g * a_vt * S_vt ))*( rad_of_gyr_vt / l_vt )^2;
    k_g_vt  = (( 0.88 ) * mu_g_vt)/(5.3 + mu_g_vt);

end