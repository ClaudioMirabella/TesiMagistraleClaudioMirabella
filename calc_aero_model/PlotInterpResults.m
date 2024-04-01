% LIFT COEFFICIENT
AOA_aux            = Aircraft.Certification.Aerodynamic_data.Interpolation.AOA_aux_fullmodel.value;
alfa_interp_values = Aircraft.Certification.Aerodynamic_data.alfa_wb.value;
CL_fullmodel       = Aircraft.Certification.Aerodynamic_data.Interpolation.CL_fullmodel.value;
CL_interp_values   = Aircraft.Certification.Aerodynamic_data.cl_wb.value;

% DRAG COEFFICIENT
CD_fullmodel = Aircraft.Certification.Aerodynamic_data.Interpolation.CD_fullmodel.value;
CD_interp_values = Aircraft.Certification.Aerodynamic_data.cd_wb.value;

% PITCHING MOMENT COEFFICIENT
CM_fullmodel = Aircraft.Certification.Aerodynamic_data.Interpolation.CM_fullmodel.value;
CM_interp_values = Aircraft.Certification.Aerodynamic_data.cm_wb.value;

% LIFT CURVE 
CL_fullmodel_diagram = figure('Name', 'Lift curve');
hold on; grid on; grid minor; 
plot(alfa_interp_values, CL_interp_values, 'k.', 'MarkerSize', 4)
plot(AOA_aux           , CL_fullmodel    , 'r')
ylabel("Lift coefficient - $C_{L_{wb}}$" , "Interpreter", "latex")
xlabel("Angle of attack - $\alpha$ (deg)", "Interpreter", "latex")
title("Wing body lift curve"             , "Interpreter", "latex")
ylim padded 
xlim padded

% SAVING FIGURES
exportgraphics(CL_fullmodel_diagram, 'FullLiftModelInterpolation.pdf', 'ContentType', 'vector');
exportgraphics(CL_fullmodel_diagram, 'FullLiftModelInterpolation.png', 'ContentType', 'vector');

% Saving figures inside correct folder
fprintf('Saving FullLiftModelInterpolation.pdf in: ');
fprintf('\n'); 
% fprintf('%s\n', SaveFolder);
% Moving file inside correct folder
movefile FullLiftModelInterpolation.pdf Output
movefile FullLiftModelInterpolation.png Output    


% DRAG CURVE 
CD_fullmodel_diagram = figure('Name', 'Drag curve');
hold on; grid on; grid minor; 
plot(alfa_interp_values, CD_interp_values, 'k.', 'MarkerSize', 4)
plot(AOA_aux           , CD_fullmodel    , 'r')
ylabel("Drag coefficient - $C_{D_{wb}}$" , "Interpreter", "latex")
xlabel("Angle of attack - $\alpha$ (deg)", "Interpreter", "latex")
title("Wing body drag curve"             , "Interpreter", "latex")
ylim padded 
xlim padded

% SAVING FIGURES
exportgraphics(CD_fullmodel_diagram, 'FullDragModelInterpolation.pdf', 'ContentType', 'vector');
exportgraphics(CD_fullmodel_diagram, 'FullDragModelInterpolation.png', 'ContentType', 'vector');

% Saving figures inside correct folder
fprintf('Saving FullDragModelInterpolation.pdf in: ');
fprintf('\n'); 
% fprintf('%s\n', SaveFolder);
% Moving file inside correct folder
movefile FullDragModelInterpolation.pdf Output
movefile FullDragModelInterpolation.png Output  

% LIFT CURVE 
CM_fullmodel_diagram = figure('Name', 'Pitching moment curve');
hold on; grid on; grid minor; 
plot(CL_interp_values, CM_interp_values, 'k.', 'MarkerSize', 4)
plot(CL_fullmodel    , CM_fullmodel    , 'r')
xlabel("Lift coefficient - $C_{L_{wb}}$"         , "Interpreter", "latex")
ylabel("Pitching mom. coefficient - $C_{M_{wb}}$", "Interpreter", "latex")
title("Wing body pitching moment curve"          , "Interpreter", "latex")
ylim padded 
xlim padded

% SAVING FIGURES
exportgraphics(CM_fullmodel_diagram, 'FullPitchingMomModelInterpolation.pdf', 'ContentType', 'vector');
exportgraphics(CM_fullmodel_diagram, 'FullPitchingMomModelInterpolation.png', 'ContentType', 'vector');

% Saving figures inside correct folder
fprintf('Saving FullPitchingMomModelInterpolation.pdf in: ');
fprintf('\n'); 
% fprintf('%s\n', SaveFolder);
% Moving file inside correct folder
movefile FullPitchingMomModelInterpolation.pdf Output
movefile FullPitchingMomModelInterpolation.png Output  