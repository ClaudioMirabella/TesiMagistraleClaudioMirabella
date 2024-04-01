function gust_load_vt = Gust_loads_vt(k_g_vt, U_de, V, a_vt, S_vt)

    % Gust_loads - Summary of this function goes here
    %
    %   INPUT 
    %   k_g_vt --> Gust alleviation factor 
    %   U_de   --> Gust reference speed (discrete theory) [m/s]
    %   V      --> Airspeed condition [m/s]
    %   a_vt   --> Normal force curve slope in [1/rad]
    %   S_vt   --> Vertical tail surface [m^2]
    % 
    %   OUTPUT 
    %   gust_load_vt --> Gust load for the vertical tail
    %
    % NOTE: The gust load must be summed with other loads conditions

    gust_load_vt = (k_g_vt * U_de * V * a_vt * S_vt)/(16.3);

end