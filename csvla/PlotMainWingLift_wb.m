
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

                plot(V_from0toS(:,i),     L_wb_from0toS(:,i),         '-r', 'LineWidth', 1)
                plot(V_fromStoA(:,i),     L_wb_fromStoA(:,i),         '-r', 'LineWidth', 1)

                plot(V_from0toS(end,i),     L_wb_from0toS(end,i),     'k.', 'MarkerSize', 12)
                plot(V_fromStoA(end,i),     L_wb_fromStoA(end,i),     'k.', 'MarkerSize', 12)

                text(V_from0toS(end,i),     L_wb_from0toS(end,i),     'Point S',     'FontSize', 6)
                text(V_fromStoA(end,i),     L_wb_fromStoA(end,i),     'Point A',     'FontSize', 6)

                if max(npos_cruise_sea_level(:,i)) > nmax 

                    plot(V_fromAtoGust1(:,i), L_wb_fromAtoGust1(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust1toC(:,i), L_wb_fromGust1toC(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromCtoGust2(:,i), L_wb_fromCtoGust2(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust2toD(:,i), L_wb_fromGust2toD(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromDto0(:,i)    , L_wb_fromDto0(:,i)    , '-r', 'LineWidth', 1)

                    plot(V_fromGust1toC(end,i), L_wb_fromGust1toC(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust2toD(end,i), L_wb_fromGust2toD(end,i), 'k.', 'MarkerSize', 12)

                    text(V_fromGust1toC(end,i), L_wb_fromGust1toC(end,i), 'Point C', 'FontSize', 6)
                    text(V_fromGust2toD(end,i), L_wb_fromGust2toD(end,i), 'Point D', 'FontSize', 6)

                elseif max(npos_cruise_sea_level(:,i)) < nmax  

                    plot(V_fromAtoC(:,i), L_wb_fromAtoC(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromCtoD(:,i), L_wb_fromCtoD(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromDto0(:,i), L_wb_fromDto0(:,i), '-r', 'LineWidth', 1)

                    plot(V_fromAtoC(end,i), L_wb_fromAtoC(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromCtoD(end,i), L_wb_fromCtoD(end,i), 'k.', 'MarkerSize', 12)

                    text(V_fromAtoC(end,i), L_wb_fromAtoC(end,i), 'Point C', 'FontSize', 6)
                    text(V_fromCtoD(end,i), L_wb_fromCtoD(end,i), 'Point D', 'FontSize', 6)

                end
        case "Case 2" 

                figure(n_figure);
                
                hold on; grid on; grid minor;
                ylim padded;
                xlim padded;

                plot(V_from0toS(:,i)    , L_wb_from0toS(:,i),     '-r', 'LineWidth', 1)
                plot(V_fromStoA(:,i)    , L_wb_fromStoA(:,i),     '-r', 'LineWidth', 1)
                plot(V_fromAtoGust1(:,i), L_wb_fromAtoGust1(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGust1toC(:,i), L_wb_fromGust1toC(:,i), '-r', 'LineWidth', 1)
                plot(V_fromCtoGust2(:,i), L_wb_fromCtoGust2(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGust2toD(:,i), L_wb_fromGust2toD(:,i), '-r', 'LineWidth', 1)
                plot(V_fromDto0(:,i)    , L_wb_fromDto0(:,i),     '-r', 'LineWidth', 1)   

                plot(V_from0toS(end,i)    , L_wb_from0toS(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromStoA(end,i)    , L_wb_fromStoA(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromGust1toC(end,i), L_wb_fromGust1toC(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromGust2toD(end,i), L_wb_fromGust2toD(end,i), 'k.', 'MarkerSize', 12)

                text(V_from0toS(end,i),     L_wb_from0toS(end,i),     'Point S',     'FontSize', 6)
                text(V_fromStoA(end,i),     L_wb_fromStoA(end,i),     'Point A',     'FontSize', 6)
                text(V_fromGust1toC(end,i), L_wb_fromGust1toC(end,i), 'Point C',     'FontSize', 6)
                text(V_fromGust2toD(end,i), L_wb_fromGust2toD(end,i), 'Point D',     'FontSize', 6)
                
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
                    
                    name_figure    = strcat('WingBodyLift', num2str(n_final_env));

                    figure(n_figure);
                    
                    plot(V_from0toS_inv(:,i), L_wb_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromS_invtoG(:,i), L_wb_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGtoGust1(:,i), L_wb_fromGtoGust1(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust1toF(:,i), L_wb_fromGust1toF(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromFtoGust2(:,i), L_wb_fromFtoGust2(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGust2toE(:,i), L_wb_fromGust2toE(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromEto0(:,i)    , L_wb_fromEto0(:,i)    , '-r', 'LineWidth', 1)

                    plot(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust1toF(end,i), L_wb_fromGust1toF(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGust2toE(end,i), L_wb_fromGust2toE(end,i), 'k.', 'MarkerSize', 12)

                    text(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                    text(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                    text(V_fromGust1toF(end,i), L_wb_fromGust1toF(end,i), 'Point F'    , 'FontSize', 6) 
                    text(V_fromGust2toE(end,i), L_wb_fromGust2toE(end,i), 'Point E'    , 'FontSize', 6) 

                elseif abs(min(nneg_cruise_sea_level(:,i))) < abs(nmin)
                    
                    name_figure    = strcat('WingBodyLift', num2str(n_final_env));
                    figure(n_figure);
                    
                    plot(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                    plot(V_fromGtoF(end,i)    , L_wb_fromGtoF(end,i)    , 'k.', 'MarkerSize', 12)
                    plot(V_fromFtoE(end,i)    , L_wb_fromFtoE(end,i)    , 'k.', 'MarkerSize', 12)

                    text(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                    text(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                    text(V_fromGtoF(end,i)    , L_wb_fromGtoF(end,i)    , 'Point F'    , 'FontSize', 6)
                    text(V_fromFtoE(end,i)    , L_wb_fromFtoE(end,i)    , 'Point E'    , 'FontSize', 6)

                    plot(V_from0toS_inv(:,i), L_wb_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromS_invtoG(:,i), L_wb_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                    plot(V_fromGtoF(:,i)    , L_wb_fromGtoF(:,i)    , '-r', 'LineWidth', 1)
                    plot(V_fromFtoE(:,i)    , L_wb_fromFtoE(:,i)    , '-r', 'LineWidth', 1)
                    plot(V_fromEto0(:,i)    , L_wb_fromEto0(:,i)    , '-r', 'LineWidth', 1)

                end
                
        case "Case 1" 
            
                name_figure    = strcat('WingBodyLift', num2str(n_final_env));

                figure(n_figure);

                plot(V_from0toS_inv(:,i), L_wb_from0toS_inv(:,i), '-r', 'LineWidth', 1)
                plot(V_fromS_invtoG(:,i), L_wb_fromS_invtoG(:,i), '-r', 'LineWidth', 1)
                plot(V_fromGtoF(:,i)    , L_wb_fromGtoF(:,i)    , '-r', 'LineWidth', 1)
                plot(V_fromFtoE(:,i)    , L_wb_fromFtoE(:,i)    , '-r', 'LineWidth', 1)
                plot(V_fromEto0(:,i)    , L_wb_fromEto0(:,i)    , '-r', 'LineWidth', 1)   

                plot(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'k.', 'MarkerSize', 12)
                plot(V_fromGtoF(end,i)    , L_wb_fromGtoF(end,i)    , 'k.', 'MarkerSize', 12)
                plot(V_fromFtoE(end,i)    , L_wb_fromFtoE(end,i)    , 'k.', 'MarkerSize', 12)

                text(V_from0toS_inv(end,i), L_wb_from0toS_inv(end,i), 'Point S inv', 'FontSize', 6)
                text(V_fromS_invtoG(end,i), L_wb_fromS_invtoG(end,i), 'Point G'    , 'FontSize', 6)
                text(V_fromGtoF(end,i)    , L_wb_fromGtoF(end,i)    , 'Point F'    , 'FontSize', 6)
                text(V_fromFtoE(end,i)    , L_wb_fromFtoE(end,i)    , 'Point E'    , 'FontSize', 6)

    end
    
    xlabel("Airspeed - $V$ (m/s)"   , "Interpreter", "latex")
    ylabel("Wing-Body Lift - $L_{wb}$ (daN)", "Interpreter", "latex")
    title("Wing-Body Lift", "Interpreter", "latex")
    
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
