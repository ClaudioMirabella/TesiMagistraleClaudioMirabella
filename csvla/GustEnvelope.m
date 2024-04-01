function GustEnvelope = GustEnvelope(n_from0toS, n_fromStoA, n_fromAtoC, n_fromCtoD, n_fromDto0, ...
                                                       n_from0toS_inv, n_fromS_invtoG, n_fromGtoF, n_fromFto0, nE, ...
                                                       V_from0toS, V_fromStoA, V_fromAtoC, V_fromCtoD, V_fromDto0, ...
                                                       V_from0toS_inv, V_fromS_invtoG, V_fromGtoF, V_fromFto0, VE, ...
                                                       V_gust_cruise, V_gust_dive, ...
                                                       npos_cruise_sea_level, nneg_cruise_sea_level, ...
                                                       npos_dive_sea_level, nneg_dive_sea_level, ...
                                                       Reg)

% Gust envelope diagram 
%   INPUT 
%   Load factors and airspeeds from the flight envelope.
%   Gust loads and gust airspeeds.
%   Certification specifications name.
%   OUTPUT 
%   Gust envelope diagram.

    GustEnvelope = figure('Name', 'Gust envelope'); 
    hold on; grid on; grid minor;
    ylim padded;
    xlim padded;
    
    plot(V_from0toS,     n_from0toS,         '-r', 'LineWidth', 1)
    plot(V_fromStoA,     n_fromStoA,         '-r', 'LineWidth', 1)
    plot(V_fromAtoC,     n_fromAtoC,         '-r', 'LineWidth', 1)
    plot(V_fromCtoD,     n_fromCtoD,         '-r', 'LineWidth', 1)
    plot(V_fromDto0,     n_fromDto0,         '-r', 'LineWidth', 1)
    plot(V_from0toS_inv, n_from0toS_inv,     '-r', 'LineWidth', 1)
    plot(V_fromS_invtoG, n_fromS_invtoG,     '-r', 'LineWidth', 1)
    plot(V_fromGtoF,     n_fromGtoF,         '-r', 'LineWidth', 1)
    plot(V_fromFto0,     n_fromFto0,         '-r', 'LineWidth', 1)
    
    plot(V_from0toS(end),     n_from0toS(end),     'k.', 'MarkerSize', 12)
    plot(V_fromStoA(end),     n_fromStoA(end),     'k.', 'MarkerSize', 12)
    plot(V_fromAtoC(end),     n_fromAtoC(end),     'k.', 'MarkerSize', 12)
    plot(V_fromCtoD(end),     n_fromCtoD(end),     'k.', 'MarkerSize', 12)
    plot(V_from0toS_inv(end), n_from0toS_inv(end), 'k.', 'MarkerSize', 12)
    plot(V_fromS_invtoG(end), n_fromS_invtoG(end), 'k.', 'MarkerSize', 12)
    plot(V_fromGtoF(end),     n_fromGtoF(end),     'k.', 'MarkerSize', 12)
    plot(VE,                  nE,                  'k.', 'MarkerSize', 12)
    
    text(V_from0toS(end),     n_from0toS(end),     'Point S',     'FontSize', 6)
    text(V_fromStoA(end),     n_fromStoA(end),     'Point A',     'FontSize', 6)
    text(V_fromAtoC(end),     n_fromAtoC(end),     'Point C',     'FontSize', 6)
    text(V_fromCtoD(end),     n_fromCtoD(end),     'Point D',     'FontSize', 6)
    text(V_from0toS_inv(end), n_from0toS_inv(end), 'Point S inv', 'FontSize', 6)
    text(V_fromS_invtoG(end), n_fromS_invtoG(end), 'Point G',     'FontSize', 6)
    text(V_fromGtoF(end),     n_fromGtoF(end),     'Point F',     'FontSize', 6)
    text(VE,                  nE,                  'Point E',     'FontSize', 6)
    
    % GUST VALUES
    plot(V_gust_cruise, npos_cruise_sea_level, '--k', 'LineWidth', 0.25)
    plot(V_gust_cruise, nneg_cruise_sea_level, '--k', 'LineWidth', 0.25)
    plot(V_gust_dive,   npos_dive_sea_level,   '--k', 'LineWidth', 0.25)
    plot(V_gust_dive,   nneg_dive_sea_level,   '--k', 'LineWidth', 0.25)
    
    plot( [V_gust_cruise(end) V_gust_dive(end)], ...
          [npos_cruise_sea_level(end) npos_dive_sea_level(end)], '-.k', 'LineWidth', 0.2)
    plot( [V_gust_cruise(end) V_gust_dive(end)], ...
          [nneg_cruise_sea_level(end) nneg_dive_sea_level(end)], '-.k', 'LineWidth', 0.2)

    xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
    ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
    title("Gust envelope ", Reg, "Interpreter", "latex")
end

