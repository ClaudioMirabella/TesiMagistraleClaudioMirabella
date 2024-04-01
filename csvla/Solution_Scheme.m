function [d2thetadt2, dthetadt, delta_v, delta_theta_rad, alpha_new_horiz_rad] = Solution_Scheme(time_vector, n_Mass, A0, alpha_prime_horiz_rad, ...
                                                                                                 time_step, l_ht, damping_factor, VA)

    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    d2thetadt2          = zeros(length(time_vector), n_Mass);
    dthetadt            = zeros(length(time_vector), n_Mass);
    alpha_new_horiz_rad = zeros(length(time_vector), n_Mass);
    delta_theta_rad     = zeros(length(time_vector), n_Mass);
    delta_v             = zeros(length(time_vector), n_Mass);

    % SOLUTION SCHEME 
    for i = 1:n_Mass
        for j = 2:length(time_vector)
            d2thetadt2(j,i)          = A0(i) * (alpha_prime_horiz_rad(j) - delta_theta_rad(j-1,i));
            dthetadt(j,i)            = dthetadt(j-1,i) + 0.5 * (d2thetadt2(j-1,i) + d2thetadt2(j,i))*(time_step);
            delta_v(j,i)             = dthetadt(j,i) * l_ht(i);
            delta_theta_rad(j,i)     = delta_v(j,i) * (damping_factor / VA(i));
            alpha_new_horiz_rad(j,i) = alpha_prime_horiz_rad(j)  - delta_theta_rad(j,i);
        end
    end
end

