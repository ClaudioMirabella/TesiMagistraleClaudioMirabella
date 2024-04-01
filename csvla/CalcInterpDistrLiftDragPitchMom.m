
switch(Aircraft.Certification.Attributes.airload_case.value) 
    case 'OpenVSP' % < ---------------------------------------------------------------------------------------------------------------------
%% Interpolation of wing-body lift, drag and pitching moment coefficients along the wing semi-span

% Chord distribution and wing surface
chord_distr = Aircraft.Geometry.Wing.chord_distribution.value;
S_wing      = Aircraft.Geometry.Wing.S.value;

% Define non dimensional stations along the wing semi-span
y_halfspan   = Aircraft.OpenVSP.output.Yavg.value(:,1);
eta_halfspan = y_halfspan / (0.5 * Aircraft.Geometry.Wing.b.value); 

% Interpolation range along angle of attack
y_length     = length(Aircraft.OpenVSP.output.Yavg.value(:,1));
y_interp     = 1:y_length; 
y_interp     = y_interp';
alfa_length  = length(Aircraft.OpenVSP.output.Yavg.value(1,:));
alfa_interp  = 1:alfa_length;
alfa_interp  = alfa_interp';
yi_interp    = y_halfspan;
alfa_start   = Aircraft.OpenVSP.input.alfa_start.value;
alfa_stop    = Aircraft.OpenVSP.input.alfa_stop.value;
delta_alfa   = Aircraft.OpenVSP.input.delta_alfa.value;
alfai_interp = alfa_start:delta_alfa:alfa_stop;
alfai_interp = alfai_interp';

% Define bidimensional meshgrids
[ALFA, Y]   = meshgrid(alfa_interp, y_interp);
[ALFAi, Yi] = meshgrid(alfai_interp, yi_interp);

%% Interpolation using Interp2 - Lift Coefficient
Interpolated_cl = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFAi, Yi, 'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.OpenVSP.output.Interpolation.cl.value           = Interpolated_cl;
Aircraft.OpenVSP.output.Interpolation.cl.Attributes.unit = "Non dimensional"; 

Wing_Body_Lift_Coeff_Distribution = cl_interpolation_graph(Aircraft.OpenVSP.output.Cl.value, Interpolated_cl, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Lift_Coeff_Distribution, 'ClInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Lift_Coeff_Distribution, 'ClInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving ClInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile ClInterpolation3dplot.pdf Output
movefile ClInterpolation3dplot.png Output

%% Interpolation using Interp2 - Drag Coefficient
Interpolated_cd = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFAi, Yi, 'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.OpenVSP.output.Interpolation.cd.value           = Interpolated_cd;
Aircraft.OpenVSP.output.Interpolation.cd.Attributes.unit = "Non dimensional"; 

Wing_Body_Drag_Coeff_Distribution = cd_interpolation_graph(Aircraft.OpenVSP.output.Cd.value, Interpolated_cd, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Drag_Coeff_Distribution, 'CdInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Drag_Coeff_Distribution, 'CdInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving CdInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile CdInterpolation3dplot.pdf Output
movefile CdInterpolation3dplot.png Output

%% Interpolation using Interp2 - Pitching moment
Interpolated_cm = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFAi, Yi,  'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.OpenVSP.output.Interpolation.cm.value           = Interpolated_cm;
Aircraft.OpenVSP.output.Interpolation.cm.Attributes.unit = "Non dimensional"; 

Wing_Body_Pitching_Coeff_Distribution = cm_interpolation_graph(Aircraft.OpenVSP.output.Cmy.value, Interpolated_cm, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Pitching_Coeff_Distribution, 'CmInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Pitching_Coeff_Distribution, 'CmInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving CmInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile CmInterpolation3dplot.pdf Output
movefile CmInterpolation3dplot.png Output

%% UNIT GLOBAL LIFT COEFFICIENT DISTRIBUTION
            
%     S_wing = Aircraft.Geometry.Wing.S.value;
% 
%     % Lift coefficient distribution at a global CL equal to one
%     % A simple function to evaluate the lift coefficient distribution along the
%     % span cl = cl(y) when the associated global lift coefficient of the whole
%     % wing is equal to 1.0; the function use a method similar to that suggested
%     % by Abbott in Theory of Wing Section. See the complete documentation
%     % inside the cl_unit_lift.m file
%     CL_equal_to_one = ones(y_length, n_Mass);
%     tol = 1e-2;
%     global_CL = ones(alfa_length, n_Mass);
%     for i = 1:n_Mass
%         for j = 1:alfa_length
%             global_CL(j,i) = (trapz(y_halfspan, Aircraft.OpenVSP.output.Cl.value(:,j)))/S_wing;
%             if (global_CL(j,i) >= 1.0-tol) && (global_CL(j,i) <= 1.0+tol)
%                 CL_equal_to_one(:,i) = Aircraft.OpenVSP.output.Cl.value(:,j);
%             end
%         end
%     end
%     bool_CL_check = global_CL < 1.0; 
%     if ~any(bool_CL_check) == 1  
%         error("ERROR: CL distribution along the wing semi-span does not contain the unit CL distribution!")
%     end
%     Aircraft.OpenVSP.output.cl_at_CL1.value           = CL_equal_to_one;
%     Aircraft.OpenVSP.output.cl_at_CL1.Attributes.unit = "Non dimensional"; 


% STORE INSIDE THE AIRCRAFT VARIABLE 

%% POSITIVE STRAIGHT FLIGHT 
for i = 1:n_Mass 
    % ---------------------------------------------------------------------------------------------------------------
    % Point S 
    alfaS_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.alfaS_deg.value(i,:);
    alfaSi_interp = alfaS_deg;
    ALFA_Si       = alfaS_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point S
    CLS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CLS.value(i);
    CDS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CDS.value(i);
    CMS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CMS_CG.value(i);

    % Interpolation - Point S
    Interpolated_clS = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Si, Yi(:,1), 'spline');
    global_CLS       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clS );
    if abs(global_CLS) < abs(CLS) 
        CLS_Ratio = CLS / global_CLS; 
        Interpolated_clS = Interpolated_clS * CLS_Ratio;
    end
    Interpolated_cdS = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Si, Yi(:,1), 'spline');
    global_CDS       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdS );
    if abs(global_CDS) < abs(CDS) 
        CDS_Ratio = CDS / global_CDS; 
        Interpolated_cdS = Interpolated_cdS * CDS_Ratio;
    end
    Interpolated_cmS = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Si, Yi(:,1), 'spline');
    global_CMS       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmS );
    if abs(global_CMS) < abs(CMS) || abs(global_CMS) > abs(CMS)
        CMS_Ratio = CMS / global_CMS; 
        Interpolated_cmS = Interpolated_cmS * CMS_Ratio;
    end
    
    % Store inside the Point S 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i)      = Interpolated_clS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i)      = Interpolated_cdS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i)      = Interpolated_cmS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point A
    alfaA_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.alfaA_deg.value(i,:);
    alfaAi_interp = alfaA_deg;
    ALFA_Ai       = alfaA_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point A
    CLA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CLA.value(i);
    CDA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CDA.value(i);
    CMA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CMA_CG.value(i);

    % Interpolation - Point A
    Interpolated_clA = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Ai, Yi(:,1), 'spline');
    global_CLA       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clA );
    if abs(global_CLA) < abs(CLA) 
        CLA_Ratio = CLA / global_CLA; 
        Interpolated_clA = Interpolated_clA * CLA_Ratio;
    end
    Interpolated_cdA = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Ai, Yi(:,1), 'spline');
    global_CDA       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdA );
    if abs(global_CDA) < abs(CDA) 
        CDA_Ratio = CDA / global_CDA; 
        Interpolated_cdA = Interpolated_cdA * CDA_Ratio;
    end
    Interpolated_cmA = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Ai, Yi(:,1), 'spline');
    global_CMA       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmA );
    if abs(global_CMA) < abs(CMA) || abs(global_CMA) > abs(CMA)
        CMA_Ratio = CMA / global_CMA; 
        Interpolated_cmA = Interpolated_cmA * CMA_Ratio;
    end
    
    % Store inside the Point A 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i)      = Interpolated_clA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i)      = Interpolated_cdA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i)      = Interpolated_cmA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point C
    alfaC_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.alfaC_deg.value(i,:);
    alfaCi_interp = alfaC_deg;
    ALFA_Ci       = alfaC_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point C
    CLC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CLC.value(i);
    CDC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CDC.value(i);
    CMC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CMC_CG.value(i);

    % Interpolation - Point C
    Interpolated_clC = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Ci, Yi(:,1), 'spline');
    global_CLC       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clC );
    if abs(global_CLC) < abs(CLC) 
        CLC_Ratio = CLC / global_CLC; 
        Interpolated_clC = Interpolated_clC * CLC_Ratio;
    end
    Interpolated_cdC = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Ci, Yi(:,1), 'spline');
    global_CDC       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdC );
    if abs(global_CDC) < abs(CDC) 
        CDC_Ratio = CDC / global_CDC; 
        Interpolated_cdC = Interpolated_cdC * CDC_Ratio;
    end
    Interpolated_cmC = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Ci, Yi(:,1), 'spline');
    global_CMC       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmC );
    if abs(global_CMC) < abs(CMC) || abs(global_CMC) > abs(CMC)
        CMC_Ratio = CMC / global_CMC; 
        Interpolated_cmC = Interpolated_cmC * CMC_Ratio;
    end
    
    % Store inside the Point C 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i)      = Interpolated_clC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i)      = Interpolated_cdC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i)      = Interpolated_cmC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point D
    alfaD_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.alfaD_deg.value(i,:); 
    alfaDi_interp = alfaD_deg;
    ALFA_Di       = alfaD_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point D
    CLD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CLD.value(i);
    CDD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CDD.value(i);
    CMD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CMD_CG.value(i);

    % Interpolation - Point D
    Interpolated_clD = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Di, Yi(:,1), 'spline');
    global_CLD       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clD );
    if abs(global_CLD) < abs(CLD) 
        CLD_Ratio = CLD / global_CLD; 
        Interpolated_clD = Interpolated_clD * CLD_Ratio;
    end
    Interpolated_cdD = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Di, Yi(:,1), 'spline');
    global_CDD       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdD );
    if abs(global_CDD) < abs(CDD) 
        CDD_Ratio = CDD / global_CDD; 
        Interpolated_cdD = Interpolated_cdD * CDD_Ratio;
    end
    Interpolated_cmD = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Di, Yi(:,1), 'spline');
    global_CMD       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmD );
    if abs(global_CMD) < abs(CMD) || abs(global_CMD) > abs(CMD)
        CMD_Ratio = CMD / global_CMD; 
        Interpolated_cmD = Interpolated_cmD * CMD_Ratio;
    end
    
    % Store inside the Point D 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i)      = Interpolated_clD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i)      = Interpolated_cdD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i)      = Interpolated_cmD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------
end

%% NEGATIVE INVERTED FLIGHT 
for i = 1:n_Mass 
    % ---------------------------------------------------------------------------------------------------------------
    % Point S INVERTED
    alfaSinv_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.alfaSinv_deg.value(i,:);
    alfaSinvi_interp = alfaSinv_deg;
    ALFA_Sinvi       = alfaSinv_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point S INVERTED
    CLSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CLSinv.value(i);
    CDSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CDSinv.value(i);
    CMSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CMSinv_CG.value(i);

    % Interpolation - Point S INVERTED
    Interpolated_clSinv = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Sinvi, Yi(:,1), 'spline');
    global_CLSinv       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clSinv );
    if abs(global_CLSinv) < abs(CLSinv) 
        CLSinv_Ratio = CLSinv / global_CLSinv; 
        Interpolated_clSinv = Interpolated_clSinv * CLSinv_Ratio;
    end
    Interpolated_cdSinv = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Sinvi, Yi(:,1), 'spline');
    global_CDSinv       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdSinv );
    if abs(global_CDSinv) < abs(CDSinv) 
        CDSinv_Ratio = CDSinv / global_CDSinv; 
        Interpolated_cdSinv = Interpolated_cdSinv * CDSinv_Ratio;
    end
    Interpolated_cmSinv = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Sinvi, Yi(:,1), 'spline');
    global_CMSinv       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmSinv );
    if abs(global_CMSinv) < abs(CMSinv) || abs(global_CMSinv) > abs(CMSinv)
        CMSinv_Ratio = CMSinv / global_CMSinv; 
        Interpolated_cmSinv = Interpolated_cmSinv * CMSinv_Ratio;
    end
    
    % Store inside the Point S INVERTED
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i)      = Interpolated_clSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i)      = Interpolated_cdSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i)      = Interpolated_cmSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point G 
    alfaG_deg     = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.alfaG_deg.value(i,:);
    alfaGi_interp = alfaG_deg;
    ALFA_Gi       = alfaG_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point G
    CLG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CLG.value(i);
    CDG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CDG.value(i);
    CMG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CMG_CG.value(i);

    % Interpolation - Point G
    Interpolated_clG = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Gi, Yi(:,1), 'spline');
    global_CLG       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clG );
    if abs(global_CLG) < abs(CLG) 
        CLG_Ratio = CLG / global_CLG; 
        Interpolated_clG = Interpolated_clG * CLG_Ratio;
    end
    Interpolated_cdG = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Gi, Yi(:,1), 'spline');
    global_CDG       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdG );
    if abs(global_CDG) < abs(CDG) 
        CDG_Ratio = CDG / global_CDG; 
        Interpolated_cdG = Interpolated_cdG * CDG_Ratio;
    end
    Interpolated_cmG = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Gi, Yi(:,1), 'spline');
    global_CMG       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmG );
    if abs(global_CMG) < abs(CMG) || abs(global_CMG) > abs(CMG)
        CMG_Ratio = CMG / global_CMG; 
        Interpolated_cmG = Interpolated_cmG * CMG_Ratio;
    end
    
    % Store inside the Point G
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i)      = Interpolated_clG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i)      = Interpolated_cdG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i)      = Interpolated_cmG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point F 
    alfaF_deg    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.alfaF_deg.value(i,:);
    alfaFi_interp = alfaF_deg;
    ALFA_Fi       = alfaF_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point F
    CLF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CLF.value(i);
    CDF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CDF.value(i);
    CMF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CMF_CG.value(i);

    % Interpolation - Point F
    Interpolated_clF = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Fi, Yi(:,1), 'spline');
    global_CLF       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clF );
    if abs(global_CLF) < abs(CLF) 
        CLF_Ratio = CLF / global_CLF; 
        Interpolated_clF = Interpolated_clF * CLF_Ratio;
    end
    Interpolated_cdF = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Fi, Yi(:,1), 'spline');
    global_CDF       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdF );
    if abs(global_CDF) < abs(CDF) 
        CDF_Ratio = CDF / global_CDF; 
        Interpolated_cdF = Interpolated_cdF * CDF_Ratio;
    end
    Interpolated_cmF = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Fi, Yi(:,1), 'spline');
    global_CMF       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmF );
    if abs(global_CMF) < abs(CMF) || abs(global_CMF) > abs(CMF)
        CMF_Ratio = CMF / global_CMF; 
        Interpolated_cmF = Interpolated_cmF * CMF_Ratio;
    end
    
    % Store inside the Point F
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i)      = Interpolated_clF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i)      = Interpolated_cdF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i)      = Interpolated_cmF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point E 
    alfaE_deg    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.alfaE_deg.value(i,:);
    alfaEi_interp = alfaE_deg;
    ALFA_Ei       = alfaE_deg * ones(length(Yi(:,1)), 1);

    % Lift coefficient at Point E
    CLE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.CLE.value(i);
    CDE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.CDE.value(i);
    CME = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.CME_CG.value(i);

    % Interpolation - Point E
    Interpolated_clE = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cl.value, ALFA_Ei, Yi(:,1), 'spline');
    global_CLE       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_clE );
    if abs(global_CLE) < abs(CLE) 
        CLE_Ratio = CLE / global_CLE; 
        Interpolated_clE = Interpolated_clE * CLF_Ratio;
    end
    Interpolated_cdE = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cd.value, ALFA_Ei, Yi(:,1), 'spline');
    global_CDE       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cdE );
    if abs(global_CDE) < abs(CDE) 
        CDE_Ratio = CDE / global_CDE; 
        Interpolated_cdE = Interpolated_cdE * CDE_Ratio;
    end
    Interpolated_cmE = interp2(ALFAi, Yi, Aircraft.OpenVSP.output.Cmy.value, ALFA_Ei, Yi(:,1), 'spline');
    global_CME       = (2 / S_wing) * trapz( y_halfspan, chord_distr.*Interpolated_cmE );
    if abs(global_CME) < abs(CME) || abs(global_CME) > abs(CME)
        CME_Ratio = CME / global_CME; 
        Interpolated_cmE = Interpolated_cmE * CME_Ratio;
    end
    
    % Store inside the Point E
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i)      = Interpolated_clE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i)      = Interpolated_cdE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i)      = Interpolated_cmE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------
end
    
%% Plot results 

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(4,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   clS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   clA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   clC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   clD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   clS_inv = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i)), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   clG    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i))      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   clF    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i))      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   clE    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i))      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 6);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Lift coefficients - $C_{l} = C_{l}(y)$", "Interpreter", "latex")
   title("Lift coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('LiftCoeffDistr','.fig');
    saveas(figure(n_figure), 'LiftCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
    n_figure = n_figure + 1;
end

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   cdS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   cdA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   cdC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   cdD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   cdS_inv = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   cdG    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i)      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   cdF    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i)      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   cdE    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i)      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 6);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Drag coefficients - $C_{d} = C_{d}(y)$", "Interpreter", "latex")
   title("Drag coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('DragCoeffDistr','.fig');
    saveas(figure(n_figure), 'DragCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
   n_figure = n_figure + 1;
end

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   cmS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   cmA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   cmC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   cmD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   cmS_inv = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   cmG    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i)      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   cmF    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i)      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   cmE    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i)      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 4);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Pitch. mom. coefficients - $C_{m} = C_{m}(y)$", "Interpreter", "latex")
   title("Pitch. mom. coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('PitchMomCoeffDistr','.fig');
    saveas(figure(n_figure), 'PitchMomCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
   n_figure = n_figure + 1;
end
    case 'Schrenk' % < ---------------------------------------------------------------------------------------------------------------------
%% Interpolation of wing-body lift, drag and pitching moment coefficients along the wing semi-span

% Chord distribution and wing surface
chord_distr = Aircraft.Geometry.Wing.chord_distribution.value;
S_wing      = Aircraft.Geometry.Wing.S.value;

% Define non dimensional stations along the wing semi-span
y_halfspan   = Aircraft.Geometry.Wing.half_span_stations.value;
eta_halfspan = Aircraft.Geometry.Wing.eta_half_span.value; 

% Unit aerodynamic coefficients half-span distributions 
Unit_Cl = Aircraft.Schrenk.output.Unit_Cl.value;
cd      = Aircraft.Schrenk.output.cd.value;
cm      = Aircraft.Schrenk.output.cm.value;

%% UNIT GLOBAL LIFT COEFFICIENT DISTRIBUTION
            
%     S_wing = Aircraft.Geometry.Wing.S.value;
% 
%     % Lift coefficient distribution at a global CL equal to one
%     % A simple function to evaluate the lift coefficient distribution along the
%     % span cl = cl(y) when the associated global lift coefficient of the whole
%     % wing is equal to 1.0; the function use a method similar to that suggested
%     % by Abbott in Theory of Wing Section. See the complete documentation
%     % inside the cl_unit_lift.m file
%     CL_equal_to_one = ones(y_length, n_Mass);
%     tol = 1e-2;
%     global_CL = ones(alfa_length, n_Mass);
%     for i = 1:n_Mass
%         for j = 1:alfa_length
%             global_CL(j,i) = (trapz(y_halfspan, Aircraft.OpenVSP.output.Cl.value(:,j)))/S_wing;
%             if (global_CL(j,i) >= 1.0-tol) && (global_CL(j,i) <= 1.0+tol)
%                 CL_equal_to_one(:,i) = Aircraft.OpenVSP.output.Cl.value(:,j);
%             end
%         end
%     end
%     bool_CL_check = global_CL < 1.0; 
%     if ~any(bool_CL_check) == 1  
%         error("ERROR: CL distribution along the wing semi-span does not contain the unit CL distribution!")
%     end
%     Aircraft.OpenVSP.output.cl_at_CL1.value           = CL_equal_to_one;
%     Aircraft.OpenVSP.output.cl_at_CL1.Attributes.unit = "Non dimensional"; 


% STORE INSIDE THE AIRCRAFT VARIABLE 

%% POSITIVE STRAIGHT FLIGHT 
for i = 1:n_Mass 
    % ---------------------------------------------------------------------------------------------------------------
    % Point S 

    % Lift coefficient at Point S
    CLS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CLS.value(i);
    CDS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CDS.value(i);
    CMS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.CMS_CG.value(i);

    % Interpolation - Point S
    Interpolated_clS = CLS * Unit_Cl;
    Interpolated_cdS = CDS * cd;
    Interpolated_cmS = abs(CMS) * cm;
    
    % Store inside the Point S 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i)      = Interpolated_clS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i)      = Interpolated_cdS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i)      = Interpolated_cmS;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point A

    % Lift coefficient at Point A
    CLA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CLA.value(i);
    CDA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CDA.value(i);
    CMA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.CMA_CG.value(i);

    % Interpolation - Point A
    Interpolated_clA = CLA * Unit_Cl;
    Interpolated_cdA = CDA * cd;
    Interpolated_cmA = abs(CMA) * cm;
    
    % Store inside the Point A 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i)      = Interpolated_clA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i)      = Interpolated_cdA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i)      = Interpolated_cmA;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point C

    % Lift coefficient at Point C
    CLC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CLC.value(i);
    CDC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CDC.value(i);
    CMC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.CMC_CG.value(i);

    % Interpolation - Point C
    Interpolated_clC = CLC * Unit_Cl;
    Interpolated_cdC = CDC * cd;
    Interpolated_cmC = abs(CMC) * cm;
    
    % Store inside the Point C 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i)      = Interpolated_clC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i)      = Interpolated_cdC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i)      = Interpolated_cmC;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point D

    % Lift coefficient at Point D
    CLD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CLD.value(i);
    CDD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CDD.value(i);
    CMD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.CMD_CG.value(i);

    % Interpolation - Point D
    Interpolated_clD = CLD * Unit_Cl;
    Interpolated_cdD = CDD * cd;
    Interpolated_cmD = abs(CMD) * cm;
    
    % Store inside the Point D 
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i)      = Interpolated_clD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i)      = Interpolated_cdD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i)      = Interpolated_cmD;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------
end

%% NEGATIVE INVERTED FLIGHT 
for i = 1:n_Mass 
    % ---------------------------------------------------------------------------------------------------------------
    % Point S INVERTED

    % Lift coefficient at Point S INVERTED
    CLSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CLSinv.value(i);
    CDSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CDSinv.value(i);
    CMSinv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.CMSinv_CG.value(i);

    % Interpolation - Point S INVERTED
    Interpolated_clSinv = CLSinv * Unit_Cl;
    Interpolated_cdSinv = CDSinv * cd;
    Interpolated_cmSinv = abs(CMSinv) * cm;
    
    % Store inside the Point S INVERTED
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i)      = Interpolated_clSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i)      = Interpolated_cdSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i)      = Interpolated_cmSinv;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point G 

    % Lift coefficient at Point G
    CLG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CLG.value(i);
    CDG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CDG.value(i);
    CMG = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.CMG_CG.value(i);

    % Interpolation - Point G
    Interpolated_clG = CLG * Unit_Cl;
    Interpolated_cdG = CDG * cd;
    Interpolated_cmG = abs(CMG) * cm;
    
    % Store inside the Point G
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i)      = Interpolated_clG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i)      = Interpolated_cdG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i)      = Interpolated_cmG;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point F 

    % Lift coefficient at Point F
    CLF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CLF.value(i);
    CDF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CDF.value(i);
    CMF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CMF_CG.value(i);

    % Interpolation - Point F
    Interpolated_clF = CLF * Unit_Cl;
    Interpolated_cdF = CDF * cd;
    Interpolated_cmF = abs(CMF) * cm;
    
    % Store inside the Point F
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i)      = Interpolated_clF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i)      = Interpolated_cdF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i)      = Interpolated_cmF;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    % ---------------------------------------------------------------------------------------------------------------
    % Point E 

    % Lift coefficient at Point E
    CLE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CLF.value(i);
    CDE = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CDF.value(i);
    CME = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.CMF_CG.value(i);

    % Interpolation - Point E
    Interpolated_clE = CLE * Unit_Cl;
    Interpolated_cdE = CDE * cd;
    Interpolated_cmE = abs(CME) * cm;
    
    % Store inside the Point E
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i)      = Interpolated_clE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i)      = Interpolated_cdE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.Attributes.unit = "Non dimensional";
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i)      = Interpolated_cmE;
    Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.Attributes.unit = "Non dimensional";
    % ---------------------------------------------------------------------------------------------------------------

    %% Interpolation of wing-body lift, drag and pitching moment coefficients along the wing semi-span 

% Interpolation range along angle of attack
y_length     = length(y_halfspan);
y_interp     = 1:y_length; 
y_interp     = y_interp';
alfa_interp  = 1:8;
alfa_interp  = alfa_interp';
yi_interp    = y_halfspan;
alfa_start   = -10.0;
alfa_stop    = 20;
delta_alfa   = 4;
alfai_interp = alfa_start:delta_alfa:alfa_stop;
alfai_interp = alfai_interp';

% Build the CL interpolation collection
Int_Cl_distr = [Interpolated_clD, abs(Interpolated_clF), abs(Interpolated_clE), abs(Interpolated_clSinv), ...
                abs(Interpolated_clG), Interpolated_clC, Interpolated_clS, Interpolated_clA];
% Build the CD interpolation collection
Int_Cd_distr = [Interpolated_cdC, Interpolated_cdS, Interpolated_cdA, Interpolated_cdD, ...
                Interpolated_cdF, Interpolated_cdE, Interpolated_cdSinv, Interpolated_cdG];
% Build the CM interpolation collection
Int_Cm_distr = [Interpolated_cmSinv, Interpolated_cmG, Interpolated_cmE, Interpolated_cmF, ...
                Interpolated_cmD   , Interpolated_cmC, Interpolated_cmS, Interpolated_cmA];

% Define bidimensional meshgrids
[ALFA, Y]   = meshgrid(alfa_interp, y_interp);
[ALFAi, Yi] = meshgrid(alfai_interp, yi_interp);

%% Interpolation using Interp2 - Lift Coefficient
Interpolated_cl = interp2(ALFAi, Yi, Int_Cl_distr, ALFAi, Yi, 'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Schrenk.output.Interpolation.cl.value           = Interpolated_cl;
Aircraft.Schrenk.output.Interpolation.cl.Attributes.unit = "Non dimensional"; 

Wing_Body_Lift_Coeff_Distribution = cl_interpolation_graph(Int_Cl_distr, Interpolated_cl, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Lift_Coeff_Distribution, 'ClInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Lift_Coeff_Distribution, 'ClInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving ClInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile ClInterpolation3dplot.pdf Output
movefile ClInterpolation3dplot.png Output

%% Interpolation using Interp2 - Drag Coefficient
Interpolated_cd = interp2(ALFAi, Yi, Int_Cd_distr, ALFAi, Yi, 'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Schrenk.output.Interpolation.cd.value           = Interpolated_cd;
Aircraft.Schrenk.output.Interpolation.cd.Attributes.unit = "Non dimensional"; 

Wing_Body_Drag_Coeff_Distribution = cd_interpolation_graph(Int_Cd_distr, Interpolated_cd, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Drag_Coeff_Distribution, 'CdInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Drag_Coeff_Distribution, 'CdInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving CdInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile CdInterpolation3dplot.pdf Output
movefile CdInterpolation3dplot.png Output

%% Interpolation using Interp2 - Pitching moment
Interpolated_cm = interp2(ALFAi, Yi, Int_Cm_distr, ALFAi, Yi,  'spline');

% STORE INSIDE THE STRUCT VARIABLE
Aircraft.Schrenk.output.Interpolation.cm.value           = Interpolated_cm;
Aircraft.Schrenk.output.Interpolation.cm.Attributes.unit = "Non dimensional"; 

Wing_Body_Pitching_Coeff_Distribution = cm_interpolation_graph(Int_Cm_distr, Interpolated_cm, Yi, ALFAi);
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
exportgraphics(Wing_Body_Pitching_Coeff_Distribution, 'CmInterpolation3dplot.pdf', 'ContentType', 'vector')
exportgraphics(Wing_Body_Pitching_Coeff_Distribution, 'CmInterpolation3dplot.png', 'ContentType', 'vector')
% +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% Saving figures inside correct folder
fprintf('Saving CmInterpolation3dplot.pdf in: ');
fprintf('\n'); 
% Moving file inside correct folder
movefile CmInterpolation3dplot.pdf Output
movefile CmInterpolation3dplot.png Output

end
 

%% Plot results 

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   clS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   clA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   clC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   clD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   clS_inv = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i)), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   clG    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i))      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   clF    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i))      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   clE    = plot(y_halfspan, abs(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i))      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 6);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Lift coefficients - $C_{l} = C_{l}(y)$", "Interpreter", "latex")
   title("Lift coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('LiftCoeffDistr','.fig');
    saveas(figure(n_figure), 'LiftCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
    n_figure = n_figure + 1;
end

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   cdS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   cdA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   cdC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   cdD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   cdS_inv = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   cdG    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i)      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   cdF    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i)      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   cdE    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i)      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 6);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Drag coefficients - $C_{d} = C_{d}(y)$", "Interpreter", "latex")
   title("Drag coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('DragCoeffDistr','.fig');
    saveas(figure(n_figure), 'DragCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
   n_figure = n_figure + 1;
end

% Figure number
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

for i = 1:n_Mass
   figure(n_figure) 
   
   hold on; grid on; grid minor;
   ylim padded;
   xlim padded;

   cmS = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i), '-r', 'LineWidth', 1);
   l1  = "Point S"; 
   cmA = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i), '-g', 'LineWidth', 1);
   l2  = "Point A"; 
   cmC = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i), '-b', 'LineWidth', 1);
   l3  = "Point C"; 
   cmD = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i), '-c', 'LineWidth', 1);
   l4  = "Point D"; 
   
   cmS_inv = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i), '-m', 'LineWidth', 1);
   l5  = "Point S inverted"; 
   cmG    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i)      , '-y', 'LineWidth', 1);
   l6  = "Point G"; 
   cmF    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i)      , '-k', 'LineWidth', 1);
   l7  = "Point F"; 
   cmE    = plot(y_halfspan, Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i)      , '-r', 'LineWidth', 1);
   l8  = "Point E"; 
   
   legend([clS, clA, clC, clD, clS_inv, clG, clF, clE], ...
          [l1 , l2 , l3 , l4 , l5    , l6 , l7 ,  l8], 'FontSize', 4);
   
   xlabel("Half wing stations - $y$ (m)"   , "Interpreter", "latex")
   ylabel("Pitch. mom. coefficients - $C_{m} = C_{m}(y)$", "Interpreter", "latex")
   title("Pitch. mom. coefficients distributions", "Interpreter", "latex")
    
    % SAVING FIGURES
    filename = strcat('PitchMomCoeffDistr','.fig');
    saveas(figure(n_figure), 'PitchMomCoeffDistr', 'fig');
    movefile(filename, 'Output')

    % EXPORT FIGURE
    filename = strcat(name_figure,'.pdf');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    filename = strcat(name_figure,'.png');
    exportgraphics(figure(n_figure), filename, 'ContentType', 'vector')
    movefile(filename, 'Output')
    
   n_figure = n_figure + 1;
end
end