
%% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% Positive straight flight
for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i))
        case "Case 1"
            
                figure(n_figure);
                
                hold on; grid on; grid minor;
                ylim padded;
                xlim padded;
                

                hold on; grid on; grid minor;
                ylim padded;
                xlim padded;

                plot(V_unit_load_factor(:,i), L_ht_unit_load_factor(:,i), '--k', 'LineWidth', 0.8)
                
                plot(V_fromStoA(:,i),     L_ht_fromStoA(:,i),         '-r', 'LineWidth', 1)

                plot(V_from0toS(end,i),     L_ht_from0toS(end,i),     'k.', 'MarkerSize', 12)
                plot(V_fromStoA(end,i),     L_ht_fromStoA(end,i),     'k.', 'MarkerSize', 12)

                text(V_from0toS(end,i),     L_ht_from0toS(end,i),     'Point S',     'FontSize', 6)
                text(V_fromStoA(end,i),     L_ht_fromStoA(end,i),     'Point A',     'FontSize', 6)

                if max(npos_cruise_sea_level(:,i)) > nmax 

                    plot(V_fromAtoGust1(:,i), L_ht_fromAtoGust1(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust1toC(:,i), L_ht_fromGust1toC(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromCtoGust2(:,i), L_ht_fromCtoGust2(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust2toD(:,i), L_ht_fromGust2toD(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromDto0(:,i)    , L_ht_fromDto0(:,i)    , '-r', 'LineWidth', 1)

                    plot(V_fromGust1toC(end,i), L_ht_fromGust1toC(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust2toD(end,i), L_ht_fromGust2toD(end,i), 'k.', 'MarkerSize', 12)

                    text(V_fromGust1toC(end,i), L_ht_fromGust1toC(end,i), 'Point C', 'FontSize', 6)
                    text(V_fromGust2toD(end,i), L_ht_fromGust2toD(end,i), 'Point D', 'FontSize', 6)

                elseif max(npos_cruise_sea_level(:,i)) < nmax  

                    plot(V_fromAtoC(:,i), L_ht_fromAtoC(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromCtoD(:,i), L_ht_fromCtoD(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromDto0(:,i), L_ht_fromDto0(:,i), '-r', 'LineWidth', 1)

                    plot(V_fromAtoC(end,i), L_ht_fromAtoC(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromCtoD(end,i), L_ht_fromCtoD(end,i), 'k.', 'MarkerSize', 12)

                    text(V_fromAtoC(end,i), L_ht_fromAtoC(end,i), 'Point C', 'FontSize', 6)
                    text(V_fromCtoD(end,i), L_ht_fromCtoD(end,i), 'Point D', 'FontSize', 6)

                end
        case "Case 2" 

                figure(n_figure);
                
                hold on; grid on; grid minor;
                ylim padded;
                xlim padded;

                
                plot(V_unit_load_factor(:,i), L_ht_unit_load_factor(:,i), '--k', 'LineWidth', 0.8)
                
                plot(V_fromStoA(:,i)    , L_ht_fromStoA(:,i),     '-r', 'LineWidth', 1)
                plot(V_fromAtoGust1(:,i), L_ht_fromAtoGust1(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGust1toC(:,i), L_ht_fromGust1toC(:,i), '-r', 'LineWidth', 1)
                plot(V_fromCtoGust2(:,i), L_ht_fromCtoGust2(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGust2toD(:,i), L_ht_fromGust2toD(:,i), '-r', 'LineWidth', 1)
                plot(V_fromDto0(:,i)    , L_ht_fromDto0(:,i),     '-r', 'LineWidth', 1)   

                plot(V_from0toS(end,i)    , L_ht_from0toS(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromStoA(end,i)    , L_ht_fromStoA(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromGust1toC(end,i), L_ht_fromGust1toC(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromGust2toD(end,i), L_ht_fromGust2toD(end,i), 'k.', 'MarkerSize', 12)

                text(V_from0toS(end,i),     L_ht_from0toS(end,i),     'Point S',     'FontSize', 6)
                text(V_fromStoA(end,i),     L_ht_fromStoA(end,i),     'Point A',     'FontSize', 6)
                text(V_fromGust1toC(end,i), L_ht_fromGust1toC(end,i), 'Point C',     'FontSize', 6)
                text(V_fromGust2toD(end,i), L_ht_fromGust2toD(end,i), 'Point D',     'FontSize', 6)
                
    end
    n_figure       = n_figure + 1;
end

%% Inverted flight 
n_figure    = n_figure - n_Mass;
n_final_env = 1;

for i = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(i))
        case "Case 2"
            
                if abs(min(nneg_cruise_sea_level(:,i))) > abs(nmin)
                    
                    name_figure    = strcat('HorizontalTailLift', num2str(n_final_env));
                    figure(n_figure);
                    
                    % plot(V_from0toS_inv(:,i), L_ht_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromS_invtoG(:,i), L_ht_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGtoGust1(:,i), L_ht_fromGtoGust1(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust1toF(:,i), L_ht_fromGust1toF(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromFtoGust2(:,i), L_ht_fromFtoGust2(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust2toE(:,i), L_ht_fromGust2toE(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromEto0(:,i)    , L_ht_fromEto0(:,i)    , '-r', 'LineWidth', 1)

                    plot(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust1toF(end,i), L_ht_fromGust1toF(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust2toE(end,i), L_ht_fromGust2toE(end,i), 'k.', 'MarkerSize', 12)

                    text(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                    text(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                    text(V_fromGust1toF(end,i), L_ht_fromGust1toF(end,i), 'Point F'    , 'FontSize', 6) 
                    text(V_fromGust2toE(end,i), L_ht_fromGust2toE(end,i), 'Point E'    , 'FontSize', 6) 

                elseif abs(min(nneg_cruise_sea_level(:,i))) < abs(nmin)
                    
                    name_figure    = strcat('HorizontalTailLift', num2str(n_final_env));
                    figure(n_figure);
                    
                    % plot(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGtoF(end,i)    , L_ht_fromGtoF(end,i)    , 'k.', 'MarkerSize', 12)
                    plot(V_fromFtoE(end,i)    , L_ht_fromFtoE(end,i)    , 'k.', 'MarkerSize', 12)

                    text(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                    text(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                    text(V_fromGtoF(end,i)    , L_ht_fromGtoF(end,i)    , 'Point F'    , 'FontSize', 6)
                    text(V_fromFtoE(end,i)    , L_ht_fromFtoE(end,i)    , 'Point E'    , 'FontSize', 6)

                    plot(V_from0toS_inv(:,i), L_ht_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromS_invtoG(:,i), L_ht_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGtoF(:,i)    , L_ht_fromGtoF(:,i)    , '-r', 'LineWidth', 1)
                    plot(V_fromFtoE(:,i)    , L_ht_fromFtoE(:,i)    , '-r', 'LineWidth', 1)
                    plot(V_fromEto0(:,i)    , L_ht_fromEto0(:,i)    , '-r', 'LineWidth', 1)

                end
                
        case "Case 1" 
            
                name_figure    = strcat('HorizontalTailLift', num2str(n_final_env));
                figure(n_figure);

                % plot(V_from0toS_inv(:,i), L_ht_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                plot(V_fromS_invtoG(:,i), L_ht_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGtoF(:,i)    , L_ht_fromGtoF(:,i)    , '-r', 'LineWidth', 1)
                plot(V_fromFtoE(:,i)    , L_ht_fromFtoE(:,i)    , '-r', 'LineWidth', 1)
                plot(V_fromEto0(:,i)    , L_ht_fromEto0(:,i)    , '-r', 'LineWidth', 1)   

                plot(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromGtoF(end,i)    , L_ht_fromGtoF(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromFtoE(end,i)    , L_ht_fromFtoE(end,i)    , 'k.', 'MarkerSize', 12)

                text(V_from0toS_inv(end,i), L_ht_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                text(V_fromS_invtoG(end,i), L_ht_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                text(V_fromGtoF(end,i)    , L_ht_fromGtoF(end,i)    , 'Point F'    , 'FontSize', 6)
                text(V_fromFtoE(end,i)    , L_ht_fromFtoE(end,i)    , 'Point E'    , 'FontSize', 6)

    end
    
    xlabel("Airspeed - $V$ (m/s)"   , "Interpreter", "latex")
    ylabel("Horizontal tail Lift - $L_{ht}$ (daN)", "Interpreter", "latex")
    title("Horizontal tail Lift", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat(name_figure,'.fig');
    saveas(figure(n_figure), name_figure, 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
    n_figure    = n_figure + 1;
    n_final_env = n_final_env + 1; 
end
