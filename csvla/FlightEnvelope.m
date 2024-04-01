function FlightEnvelope = FlightEnvelope(n_from0toS, n_fromStoA, n_fromAtoC, n_fromCtoD, n_fromDto0, ...
                                         n_from0toS_inv, n_fromS_invtoG, n_fromGtoF, n_fromFto0, nE, ...
                                         V_from0toS, V_fromStoA, V_fromAtoC, V_fromCtoD, V_fromDto0, ...
                                         V_from0toS_inv, V_fromS_invtoG, V_fromGtoF, V_fromFto0, VE, ...
                                         Reg)
% FlightEnvelope - Function that plot the Flight envelope
%   INPUT
%   Flight loads and airspeed for straight and inverted flight.
%
%   OUTPUT
%   Flight envelope diagram.

FlightEnvelope = figure('Name', 'Flight envelope');
hold on; grid on; grid minor; 
ylim padded 
xlim padded 

            plot(V_from0toS    , n_from0toS,     'r')
            plot(V_fromStoA    , n_fromStoA,     'r')
            plot(V_fromAtoC    , n_fromAtoC,     'r')
            plot(V_fromCtoD    , n_fromCtoD,     'r')
            plot(V_fromDto0    , n_fromDto0,     'r')
            plot(V_from0toS_inv, n_from0toS_inv, 'r')
            plot(V_fromS_invtoG, n_fromS_invtoG, 'r')
            plot(V_fromGtoF    , n_fromGtoF,     'r')
            plot(V_fromFto0    , n_fromFto0,     'r')

            plot(V_from0toS(end)    , n_from0toS(end),     'k.', 'MarkerSize', 8)
            plot(V_fromStoA(end)    , n_fromStoA(end),     'k.', 'MarkerSize', 8)
            plot(V_fromAtoC(end)    , n_fromAtoC(end),     'k.', 'MarkerSize', 8)
            plot(V_fromCtoD(end)    , n_fromCtoD(end),     'k.', 'MarkerSize', 8)
            plot(V_from0toS_inv(end), n_from0toS_inv(end), 'k.', 'MarkerSize', 8)
            plot(V_fromS_invtoG(end), n_fromS_invtoG(end), 'k.', 'MarkerSize', 8)
            plot(V_fromGtoF(end)    , n_fromGtoF(end),     'k.', 'MarkerSize', 8)
            plot(VE                 , nE,                  'k.', 'MarkerSize', 8)

            text(V_from0toS(end)    , n_from0toS(end)    , 'Point S', 'FontSize',     6)
            text(V_fromStoA(end)    , n_fromStoA(end)    , 'Point A', 'FontSize',     6)
            text(V_fromAtoC(end)    , n_fromAtoC(end)    , 'Point C', 'FontSize',     6)
            text(V_fromCtoD(end)    , n_fromCtoD(end)    , 'Point D', 'FontSize',     6)
            text(V_from0toS_inv(end), n_from0toS_inv(end), 'Point S inv', 'FontSize', 6)
            text(V_fromS_invtoG(end), n_fromS_invtoG(end), 'Point G'    , 'FontSize', 6)
            text(V_fromGtoF(end)    , n_fromGtoF(end)    , 'Point F'    , 'FontSize', 6)
            text(VE                 , nE                 , 'Point E'    , 'FontSize', 6)


xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
title("V~-~n diagram per ", Reg, "Interpreter", "latex")

end

