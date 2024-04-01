
%% FIGURE NUMBER
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% UNSYMMETRICAL TORSION - CM DIAGRAMS 

% Initialization 
y_flipped        = flip(half_span);

% Pitching moments
cmA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value;
cmC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value;
cmD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value;

% Torsions - Symmetrical distributions
Tors_mom_distr_A = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Tors_mom_distr_A.value;
Tors_mom_distr_C = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Tors_mom_distr_C.value;
Tors_mom_distr_D = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Tors_mom_distr_D.value;

for i = 1:n_Mass
    
    % POINT A - PITCHING MOMENT COEFFICIENTS COMPARISONS 
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(half_span, cm_unsymmA(:,i), '-r' , 'LineWidth', 1.0)
    plot(half_span, cmA(:,i)       , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical $c_{m} = c_{m}(y)$"   , "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"              , "Interpreter", "latex")
    title("Pitching moment comparison - Point A", "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('UnsymmPitchingMomentCoefficientsACase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
    % POINT A - FULL UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionFullA(:,i)    , '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_A(:,i), '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)", "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                             , "Interpreter", "latex")
    title("Full unsymmetrical torsion - Point A"               , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('FullUnsymmTorsionPointACase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
    % POINT A - SEVENTY PERCENT UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionSeventyPercentA(:,i), '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_A(:,i)      , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)", "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                             , "Interpreter", "latex")
    title("$70\,\%$ unsymmetrical torsion - Point A"           , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('SeventyPercentUnsymmTorsionPointACase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;   
    
    % POINT C - PITCHING MOMENT COEFFICIENTS COMPARISONS 
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(half_span, cm_unsymmC(:,i), '-r' , 'LineWidth', 1.0)
    plot(half_span, cmC(:,i)       , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical $c_{m} = c_{m}(y)$"   , "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"              , "Interpreter", "latex")
    title("Pitching moment comparison - Point C", "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('UnsymmPitchingMomentCoefficientsCCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
    % POINT C - FULL UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionFullC(:,i)    , '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_C(:,i), '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)", "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                             , "Interpreter", "latex")
    title("Full unsymmetrical torsion - Point C"               , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('FullUnsymmTorsionPointCCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
    % POINT C - SEVENTY PERCENT UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionSeventyPercentC(:,i), '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_C(:,i)      , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)", "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                             , "Interpreter", "latex")
    title("$70\,\%$ unsymmetrical torsion - Point C"           , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('SeventyPercentUnsymmTorsionPointCCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;  
    
    % POINT D - PITCHING MOMENT COEFFICIENTS COMPARISONS 
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(half_span, cm_unsymmD(:,i), '-r' , 'LineWidth', 1.0)
    plot(half_span, cmD(:,i)       , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical $c_{m} = c_{m}(y)$"   , "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"              , "Interpreter", "latex")
    title("Pitching moment comparison - Point D", "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('UnsymmPitchingMomentCoefficientsDCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1; 
    
    % POINT D - FULL UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionFullD(:,i)    , '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_D(:,i), '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)"  , "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                               , "Interpreter", "latex")
    title("Full unsymmetrical torsion - Point D"                 , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('FullUnsymmTorsionPointDCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
    % POINT D - SEVENTY PERCENT UNSYMMETRICAL LOADS
    figure(n_figure)
    
    hold on; grid on; grid minor;
    
    ylim padded;
    xlim padded;
    
    plot(y_flipped, TorsionSeventyPercentD(:,i), '-r' , 'LineWidth', 1.0)
    plot(y_flipped, Tors_mom_distr_D(:,i)      , '--k', 'LineWidth', 0.5)
     
    ylabel("Unsymmetrical torsion - $T = T(y)$ ($daN \cdot m$)", "Interpreter", "latex")
    xlabel("Semi-span - $y$ ($m$)"                             , "Interpreter", "latex")
    title("$70\,\%$ unsymmetrical torsion - Point D"           , "Interpreter", "latex")

    % SAVING FIGURES
    figure_name = strcat('SeventyPercentUnsymmTorsionPointDCase', num2str(i));
    export_tag  = strcat(figure_name, '.pdf');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    export_tag  = strcat(figure_name, '.png');
    exportgraphics(figure(n_figure), export_tag, 'ContentType', 'vector');
    movefile(export_tag, 'Output');
    
    n_figure = n_figure + 1;
    
end