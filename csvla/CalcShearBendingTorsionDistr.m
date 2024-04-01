
switch(Aircraft.Certification.Attributes.airload_case.value) 
    case 'OpenVSP' % < ---------------------------------------------------------------------------------------------------------------------
%% SHEAR, BENDING, TORSION DISTRIBUTION CALCULATIONS 
chord_distr      = Aircraft.Geometry.Wing.chord_distribution.value;
y_halfspan       = Aircraft.Geometry.Wing.half_span_stations.value;
y_flipped        = flip(y_halfspan);
root_twist_angle = Aircraft.Geometry.Wing.twist_angle_first.value;
stations         = length(chord_distr);

% Load calculation methods from a properly formatted class
obj2 = ShearBendingTorsion;

%% Initialization 

% Point S allocation 
cl_S             = ones(stations, n_Mass); 
cd_S             = ones(stations, n_Mass);  
cm_S             = ones(stations, n_Mass); 
alfaS            = ones(n_Mass, 1);
qS               = ones(n_Mass, 1);
cCl_distr_S      = ones(stations, n_Mass); 
cCd_distr_S      = ones(stations, n_Mass); 
AoA_ToT_deg_S    = ones(n_Mass, 1);
AoA_ToT_rad_S    = ones(n_Mass, 1);
cCz_S            = ones(stations, n_Mass);
cCa_S            = ones(stations, n_Mass);
Normal_force_S   = ones(stations, n_Mass);
Axial_force_S    = ones(stations, n_Mass);
Shear_distr_S    = ones(stations, n_Mass);
Bend_mom_distr_S = ones(stations, n_Mass);
m_distr_S        = ones(stations, n_Mass);
Tors_mom_distr_S = ones(stations, n_Mass);

% Point A allocation 
cl_A             = ones(stations, n_Mass); 
cd_A             = ones(stations, n_Mass);  
cm_A             = ones(stations, n_Mass); 
alfaA            = ones(n_Mass, 1);
qA               = ones(n_Mass, 1);
cCl_distr_A      = ones(stations, n_Mass); 
cCd_distr_A      = ones(stations, n_Mass); 
AoA_ToT_deg_A    = ones(n_Mass, 1);
AoA_ToT_rad_A    = ones(n_Mass, 1);
cCz_A            = ones(stations, n_Mass);
cCa_A            = ones(stations, n_Mass);
Normal_force_A   = ones(stations, n_Mass);
Axial_force_A    = ones(stations, n_Mass);
Shear_distr_A    = ones(stations, n_Mass);
Bend_mom_distr_A = ones(stations, n_Mass);
m_distr_A        = ones(stations, n_Mass);
Tors_mom_distr_A = ones(stations, n_Mass);

% Point C allocation 
cl_C             = ones(stations, n_Mass); 
cd_C             = ones(stations, n_Mass);  
cm_C             = ones(stations, n_Mass); 
alfaC            = ones(n_Mass, 1);
qC               = ones(n_Mass, 1);
cCl_distr_C      = ones(stations, n_Mass); 
cCd_distr_C      = ones(stations, n_Mass); 
AoA_ToT_deg_C    = ones(n_Mass, 1);
AoA_ToT_rad_C    = ones(n_Mass, 1);
cCz_C            = ones(stations, n_Mass);
cCa_C            = ones(stations, n_Mass);
Normal_force_C   = ones(stations, n_Mass);
Axial_force_C    = ones(stations, n_Mass);
Shear_distr_C    = ones(stations, n_Mass);
Bend_mom_distr_C = ones(stations, n_Mass);
m_distr_C        = ones(stations, n_Mass);
Tors_mom_distr_C = ones(stations, n_Mass);

% Point D allocation 
cl_D             = ones(stations, n_Mass); 
cd_D             = ones(stations, n_Mass);  
cm_D             = ones(stations, n_Mass); 
alfaD            = ones(n_Mass, 1);
qD               = ones(n_Mass, 1);
cCl_distr_D      = ones(stations, n_Mass); 
cCd_distr_D      = ones(stations, n_Mass); 
AoA_ToT_deg_D    = ones(n_Mass, 1);
AoA_ToT_rad_D    = ones(n_Mass, 1);
cCz_D            = ones(stations, n_Mass);
cCa_D            = ones(stations, n_Mass);
Normal_force_D   = ones(stations, n_Mass);
Axial_force_D    = ones(stations, n_Mass);
Shear_distr_D    = ones(stations, n_Mass);
Bend_mom_distr_D = ones(stations, n_Mass);
m_distr_D        = ones(stations, n_Mass);
Tors_mom_distr_D = ones(stations, n_Mass);

% Point S inverted allocation 
cl_S_inv             = ones(stations, n_Mass); 
cd_S_inv             = ones(stations, n_Mass);  
cm_S_inv             = ones(stations, n_Mass); 
alfaS_inv            = ones(n_Mass, 1);
qS_inv               = ones(n_Mass, 1);
cCl_distr_S_inv      = ones(stations, n_Mass); 
cCd_distr_S_inv      = ones(stations, n_Mass); 
AoA_ToT_deg_S_inv    = ones(n_Mass, 1);
AoA_ToT_rad_S_inv    = ones(n_Mass, 1);
cCz_S_inv            = ones(stations, n_Mass);
cCa_S_inv            = ones(stations, n_Mass);
Normal_force_S_inv   = ones(stations, n_Mass);
Axial_force_S_inv    = ones(stations, n_Mass);
Shear_distr_S_inv    = ones(stations, n_Mass);
Bend_mom_distr_S_inv = ones(stations, n_Mass);
m_distr_S_inv        = ones(stations, n_Mass);
Tors_mom_distr_S_inv = ones(stations, n_Mass);

% Point G allocation 
cl_G             = ones(stations, n_Mass); 
cd_G             = ones(stations, n_Mass);  
cm_G             = ones(stations, n_Mass); 
alfaG            = ones(n_Mass, 1);
qG               = ones(n_Mass, 1);
cCl_distr_G      = ones(stations, n_Mass); 
cCd_distr_G      = ones(stations, n_Mass); 
AoA_ToT_deg_G    = ones(n_Mass, 1);
AoA_ToT_rad_G    = ones(n_Mass, 1);
cCz_G            = ones(stations, n_Mass);
cCa_G            = ones(stations, n_Mass);
Normal_force_G   = ones(stations, n_Mass);
Axial_force_G    = ones(stations, n_Mass);
Shear_distr_G    = ones(stations, n_Mass);
Bend_mom_distr_G = ones(stations, n_Mass);
m_distr_G        = ones(stations, n_Mass);
Tors_mom_distr_G = ones(stations, n_Mass);

% Point F allocation 
cl_F             = ones(stations, n_Mass); 
cd_F             = ones(stations, n_Mass);  
cm_F             = ones(stations, n_Mass); 
alfaF            = ones(n_Mass, 1);
qF               = ones(n_Mass, 1);
cCl_distr_F      = ones(stations, n_Mass); 
cCd_distr_F      = ones(stations, n_Mass); 
AoA_ToT_deg_F    = ones(n_Mass, 1);
AoA_ToT_rad_F    = ones(n_Mass, 1);
cCz_F            = ones(stations, n_Mass);
cCa_F            = ones(stations, n_Mass);
Normal_force_F   = ones(stations, n_Mass);
Axial_force_F    = ones(stations, n_Mass);
Shear_distr_F    = ones(stations, n_Mass);
Bend_mom_distr_F = ones(stations, n_Mass);
m_distr_F        = ones(stations, n_Mass);
Tors_mom_distr_F = ones(stations, n_Mass);

% Point E allocation 
cl_E             = ones(stations, n_Mass); 
cd_E             = ones(stations, n_Mass);  
cm_E             = ones(stations, n_Mass); 
alfaE            = ones(n_Mass, 1);
qE               = ones(n_Mass, 1);
cCl_distr_E      = ones(stations, n_Mass); 
cCd_distr_E      = ones(stations, n_Mass); 
AoA_ToT_deg_E    = ones(n_Mass, 1);
AoA_ToT_rad_E    = ones(n_Mass, 1);
cCz_E            = ones(stations, n_Mass);
cCa_E            = ones(stations, n_Mass);
Normal_force_E   = ones(stations, n_Mass);
Axial_force_E    = ones(stations, n_Mass);
Shear_distr_E    = ones(stations, n_Mass);
Bend_mom_distr_E = ones(stations, n_Mass);
m_distr_E        = ones(stations, n_Mass);
Tors_mom_distr_E = ones(stations, n_Mass);

%% Actual calculation - Straight and inverted flight 
for i = 1:n_Mass
    
    %% Point S - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i); 
    cd_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i); 
    cm_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i); 
    alfaS(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.alfaS_deg.value(i,1);
    qS(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.qS.value(i,1);
    point_name = 'PointSstraight';
    graph_name = 'Point S';
    
    [cCl_distr_S(:,i), cCd_distr_S(:,i), AoA_ToT_deg_S(i,1), AoA_ToT_rad_S(i,1), ...
     cCz_S(:,i), cCa_S(:,i), Normal_force_S(:,i), Axial_force_S(:,i), Shear_distr_S(:,i), ...
     Bend_mom_distr_S(:,i), m_distr_S(:,i), Tors_mom_distr_S(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_S(:,i), cd_S(:,i), ...
                                                                                                      cm_S(:,i), alfaS(i,1), root_twist_angle, qS(i,1), ...
                                                                                                      point_name, i, graph_name);
                                                                                                  
    %% Point A - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i); 
    cd_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i); 
    cm_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i); 
    alfaA(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.alfaA_deg.value(i,1);
    qA(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value(i,1);
    point_name = 'PointA';
    graph_name = 'Point A';
    
    [cCl_distr_A(:,i), cCd_distr_A(:,i), AoA_ToT_deg_A(i,1), AoA_ToT_rad_A(i,1), ...
     cCz_A(:,i), cCa_A(:,i), Normal_force_A(:,i), Axial_force_A(:,i), Shear_distr_A(:,i), ...
     Bend_mom_distr_A(:,i), m_distr_A(:,i), Tors_mom_distr_A(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_A(:,i), cd_A(:,i), ...
                                                                                                      cm_A(:,i), alfaA(i,1), root_twist_angle, qA(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point C - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i); 
    cd_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i); 
    cm_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i); 
    alfaC(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.alfaC_deg.value(i,1);
    qC(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.qC.value(i,1);
    point_name = 'PointC';
    graph_name = 'Point C';
    
    [cCl_distr_C(:,i), cCd_distr_C(:,i), AoA_ToT_deg_C(i,1), AoA_ToT_rad_C(i,1), ...
     cCz_C(:,i), cCa_C(:,i), Normal_force_C(:,i), Axial_force_C(:,i), Shear_distr_C(:,i), ...
     Bend_mom_distr_C(:,i), m_distr_C(:,i), Tors_mom_distr_C(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_C(:,i), cd_C(:,i), ...
                                                                                                      cm_C(:,i), alfaC(i,1), root_twist_angle, qC(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point D - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i); 
    cd_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i); 
    cm_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i); 
    alfaD(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.alfaD_deg.value(i,1);
    qD(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.qD.value(i,1);
    point_name = 'PointD';
    graph_name = 'Point D';
    
    [cCl_distr_D(:,i), cCd_distr_D(:,i), AoA_ToT_deg_D(i,1), AoA_ToT_rad_D(i,1), ...
     cCz_D(:,i), cCa_D(:,i), Normal_force_D(:,i), Axial_force_D(:,i), Shear_distr_D(:,i), ...
     Bend_mom_distr_D(:,i), m_distr_D(:,i), Tors_mom_distr_D(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_D(:,i), cd_D(:,i), ...
                                                                                                      cm_D(:,i), alfaD(i,1), root_twist_angle, qD(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point S inverted - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_S_inv(:,i)  = -Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i); 
    cd_S_inv(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i); 
    cm_S_inv(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i); 
    alfaS_inv(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.alfaSinv_deg.value(i,1);
    qS_inv(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.qSinv.value(i,1);
    point_name = 'PointSinverted';
    graph_name = 'Point S inverted';
    
    [cCl_distr_S_inv(:,i), cCd_distr_S_inv(:,i), AoA_ToT_deg_S_inv(i,1), AoA_ToT_rad_S_inv(i,1), ...
     cCz_S_inv(:,i), cCa_S_inv(:,i), Normal_force_S_inv(:,i), Axial_force_S_inv(:,i), Shear_distr_S_inv(:,i), ...
     Bend_mom_distr_S_inv(:,i), m_distr_S_inv(:,i), Tors_mom_distr_S_inv(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_S_inv(:,i), cd_S_inv(:,i), ...
                                                                                                      cm_S_inv(:,i), alfaS_inv(i,1), root_twist_angle, qS_inv(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point G - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_G(:,i)  = -Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i); 
    cd_G(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i); 
    cm_G(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i); 
    alfaG(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.alfaG_deg.value(i,1);
    qG(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.qG.value(i,1);
    point_name = 'PointG';
    graph_name = 'Point G';
    
    [cCl_distr_G(:,i), cCd_distr_G(:,i), AoA_ToT_deg_G(i,1), AoA_ToT_rad_G(i,1), ...
     cCz_G(:,i), cCa_G(:,i), Normal_force_G(:,i), Axial_force_G(:,i), Shear_distr_G(:,i), ...
     Bend_mom_distr_G(:,i), m_distr_G(:,i), Tors_mom_distr_G(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_G(:,i), cd_G(:,i), ...
                                                                                                      cm_G(:,i), alfaG(i,1), root_twist_angle, qG(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point F - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_F(:,i)  = -Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i); 
    cd_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i); 
    cm_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i); 
    alfaF(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.alfaF_deg.value(i,1);
    qF(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.qF.value(i,1);
    point_name = 'PointF';
    graph_name = 'Point F';
    
    [cCl_distr_F(:,i), cCd_distr_F(:,i), AoA_ToT_deg_F(i,1), AoA_ToT_rad_F(i,1), ...
     cCz_F(:,i), cCa_F(:,i), Normal_force_F(:,i), Axial_force_F(:,i), Shear_distr_F(:,i), ...
     Bend_mom_distr_F(:,i), m_distr_F(:,i), Tors_mom_distr_F(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_F(:,i), cd_F(:,i), ...
                                                                                                      cm_F(:,i), alfaF(i,1), root_twist_angle, qF(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point E - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_E(:,i)  = -Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i); 
    cd_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i); 
    cm_E(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i); 
    alfaE(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.alfaE_deg.value(i,1);
    qE(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.qE.value(i,1);
    point_name = 'PointE';
    graph_name = 'Point E';
    
    [cCl_distr_E(:,i), cCd_distr_E(:,i), AoA_ToT_deg_E(i,1), AoA_ToT_rad_E(i,1), ...
     cCz_E(:,i), cCa_E(:,i), Normal_force_E(:,i), Axial_force_E(:,i), Shear_distr_E(:,i), ...
     Bend_mom_distr_E(:,i), m_distr_E(:,i), Tors_mom_distr_E(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_E(:,i), cd_E(:,i), ...
                                                                                                      cm_E(:,i), alfaE(i,1), root_twist_angle, qE(i,1), ...
                                                                                                      point_name, i, graph_name);
                                                                                                                                                                                                                                                                                                                                                                                                    
end

%% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% SHEAR BENDING TORSION COMPARISONS
ShearBendingTorsionComparisonGraph

%% STORE INSIDE THE AIRCRAFT STRUCT VARIABLE 

% POINT S STRAIGHT 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCl_distr_S.value      = cCl_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCd_distr_S.value      = cCd_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCz_S.value            = cCz_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCa_S.value            = cCa_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Normal_force_S.value   = Normal_force_S; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Axial_force_S.value    = Axial_force_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Shear_distr_S.value    = Shear_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Bend_mom_distr_S.value = Bend_mom_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.m_distr_S.value        = m_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Tors_mom_distr_S.value = Tors_mom_distr_S;

% POINT A 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCl_distr_A.value      = cCl_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCd_distr_A.value      = cCd_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCz_A.value            = cCz_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCa_A.value            = cCa_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Normal_force_A.value   = Normal_force_A; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Axial_force_A.value    = Axial_force_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Shear_distr_A.value    = Shear_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Bend_mom_distr_A.value = Bend_mom_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.m_distr_A.value        = m_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Tors_mom_distr_A.value = Tors_mom_distr_A;

% POINT C 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCl_distr_C.value      = cCl_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCd_distr_C.value      = cCd_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCz_C.value            = cCz_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCa_C.value            = cCa_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Normal_force_C.value   = Normal_force_C; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Axial_force_C.value    = Axial_force_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Shear_distr_C.value    = Shear_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Bend_mom_distr_C.value = Bend_mom_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.m_distr_C.value        = m_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Tors_mom_distr_C.value = Tors_mom_distr_C;

% POINT D 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCl_distr_D.value      = cCl_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCd_distr_D.value      = cCd_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCz_D.value            = cCz_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCa_D.value            = cCa_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Normal_force_D.value   = Normal_force_D; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Axial_force_D.value    = Axial_force_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Shear_distr_D.value    = Shear_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Bend_mom_distr_D.value = Bend_mom_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.m_distr_D.value        = m_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Tors_mom_distr_D.value = Tors_mom_distr_D;

% POINT S INVERTED
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCl_distr_Sinv.value      = cCl_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCd_distr_Sinv.value      = cCd_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCz_Sinv.value            = cCz_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCa_Sinv.value            = cCa_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Normal_force_Sinv.value   = Normal_force_S_inv; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Axial_force_Sinv.value    = Axial_force_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Shear_distr_Sinv.value    = Shear_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Bend_mom_distr_Sinv.value = Bend_mom_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.m_distr_Sinv.value        = m_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Tors_mom_distr_Sinv.value = Tors_mom_distr_S_inv;

% POINT G 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCl_distr_G.value      = cCl_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCd_distr_G.value      = cCd_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCz_G.value            = cCz_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCa_G.value            = cCa_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Normal_force_G.value   = Normal_force_G; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Axial_force_G.value    = Axial_force_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Shear_distr_G.value    = Shear_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Bend_mom_distr_G.value = Bend_mom_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.m_distr_G.value        = m_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Tors_mom_distr_G.value = Tors_mom_distr_G;

% POINT F 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCl_distr_F.value      = cCl_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCd_distr_F.value      = cCd_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCz_F.value            = cCz_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCa_F.value            = cCa_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Normal_force_F.value   = Normal_force_F; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Axial_force_F.value    = Axial_force_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Shear_distr_F.value    = Shear_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Bend_mom_distr_F.value = Bend_mom_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.m_distr_F.value        = m_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Tors_mom_distr_F.value = Tors_mom_distr_F;

% POINT E 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCl_distr_E.value      = cCl_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCd_distr_E.value      = cCd_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCz_E.value            = cCz_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCa_E.value            = cCa_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Normal_force_E.value   = Normal_force_E; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Axial_force_E.value    = Axial_force_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Shear_distr_E.value    = Shear_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Bend_mom_distr_E.value = Bend_mom_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.m_distr_E.value        = m_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Tors_mom_distr_E.value = Tors_mom_distr_E;
    case 'Schrenk' % < ---------------------------------------------------------------------------------------------------------------------
%% SHEAR, BENDING, TORSION DISTRIBUTION CALCULATIONS 
chord_distr      = Aircraft.Geometry.Wing.chord_distribution.value;
y_halfspan       = Aircraft.Geometry.Wing.half_span_stations.value;
y_flipped        = flip(y_halfspan);
root_twist_angle = Aircraft.Geometry.Wing.twist_angle_first.value;
stations         = length(chord_distr);

% Load calculation methods from a properly formatted class
obj2 = ShearBendingTorsion;

%% Initialization 

% Point S allocation 
cl_S             = ones(stations, n_Mass); 
cd_S             = ones(stations, n_Mass);  
cm_S             = ones(stations, n_Mass); 
alfaS            = ones(n_Mass, 1);
qS               = ones(n_Mass, 1);
cCl_distr_S      = ones(stations, n_Mass); 
cCd_distr_S      = ones(stations, n_Mass); 
AoA_ToT_deg_S    = ones(n_Mass, 1);
AoA_ToT_rad_S    = ones(n_Mass, 1);
cCz_S            = ones(stations, n_Mass);
cCa_S            = ones(stations, n_Mass);
Normal_force_S   = ones(stations, n_Mass);
Axial_force_S    = ones(stations, n_Mass);
Shear_distr_S    = ones(stations, n_Mass);
Bend_mom_distr_S = ones(stations, n_Mass);
m_distr_S        = ones(stations, n_Mass);
Tors_mom_distr_S = ones(stations, n_Mass);

% Point A allocation 
cl_A             = ones(stations, n_Mass); 
cd_A             = ones(stations, n_Mass);  
cm_A             = ones(stations, n_Mass); 
alfaA            = ones(n_Mass, 1);
qA               = ones(n_Mass, 1);
cCl_distr_A      = ones(stations, n_Mass); 
cCd_distr_A      = ones(stations, n_Mass); 
AoA_ToT_deg_A    = ones(n_Mass, 1);
AoA_ToT_rad_A    = ones(n_Mass, 1);
cCz_A            = ones(stations, n_Mass);
cCa_A            = ones(stations, n_Mass);
Normal_force_A   = ones(stations, n_Mass);
Axial_force_A    = ones(stations, n_Mass);
Shear_distr_A    = ones(stations, n_Mass);
Bend_mom_distr_A = ones(stations, n_Mass);
m_distr_A        = ones(stations, n_Mass);
Tors_mom_distr_A = ones(stations, n_Mass);

% Point C allocation 
cl_C             = ones(stations, n_Mass); 
cd_C             = ones(stations, n_Mass);  
cm_C             = ones(stations, n_Mass); 
alfaC            = ones(n_Mass, 1);
qC               = ones(n_Mass, 1);
cCl_distr_C      = ones(stations, n_Mass); 
cCd_distr_C      = ones(stations, n_Mass); 
AoA_ToT_deg_C    = ones(n_Mass, 1);
AoA_ToT_rad_C    = ones(n_Mass, 1);
cCz_C            = ones(stations, n_Mass);
cCa_C            = ones(stations, n_Mass);
Normal_force_C   = ones(stations, n_Mass);
Axial_force_C    = ones(stations, n_Mass);
Shear_distr_C    = ones(stations, n_Mass);
Bend_mom_distr_C = ones(stations, n_Mass);
m_distr_C        = ones(stations, n_Mass);
Tors_mom_distr_C = ones(stations, n_Mass);

% Point D allocation 
cl_D             = ones(stations, n_Mass); 
cd_D             = ones(stations, n_Mass);  
cm_D             = ones(stations, n_Mass); 
alfaD            = ones(n_Mass, 1);
qD               = ones(n_Mass, 1);
cCl_distr_D      = ones(stations, n_Mass); 
cCd_distr_D      = ones(stations, n_Mass); 
AoA_ToT_deg_D    = ones(n_Mass, 1);
AoA_ToT_rad_D    = ones(n_Mass, 1);
cCz_D            = ones(stations, n_Mass);
cCa_D            = ones(stations, n_Mass);
Normal_force_D   = ones(stations, n_Mass);
Axial_force_D    = ones(stations, n_Mass);
Shear_distr_D    = ones(stations, n_Mass);
Bend_mom_distr_D = ones(stations, n_Mass);
m_distr_D        = ones(stations, n_Mass);
Tors_mom_distr_D = ones(stations, n_Mass);

% Point S inverted allocation 
cl_S_inv             = ones(stations, n_Mass); 
cd_S_inv             = ones(stations, n_Mass);  
cm_S_inv             = ones(stations, n_Mass); 
alfaS_inv            = ones(n_Mass, 1);
qS_inv               = ones(n_Mass, 1);
cCl_distr_S_inv      = ones(stations, n_Mass); 
cCd_distr_S_inv      = ones(stations, n_Mass); 
AoA_ToT_deg_S_inv    = ones(n_Mass, 1);
AoA_ToT_rad_S_inv    = ones(n_Mass, 1);
cCz_S_inv            = ones(stations, n_Mass);
cCa_S_inv            = ones(stations, n_Mass);
Normal_force_S_inv   = ones(stations, n_Mass);
Axial_force_S_inv    = ones(stations, n_Mass);
Shear_distr_S_inv    = ones(stations, n_Mass);
Bend_mom_distr_S_inv = ones(stations, n_Mass);
m_distr_S_inv        = ones(stations, n_Mass);
Tors_mom_distr_S_inv = ones(stations, n_Mass);

% Point G allocation 
cl_G             = ones(stations, n_Mass); 
cd_G             = ones(stations, n_Mass);  
cm_G             = ones(stations, n_Mass); 
alfaG            = ones(n_Mass, 1);
qG               = ones(n_Mass, 1);
cCl_distr_G      = ones(stations, n_Mass); 
cCd_distr_G      = ones(stations, n_Mass); 
AoA_ToT_deg_G    = ones(n_Mass, 1);
AoA_ToT_rad_G    = ones(n_Mass, 1);
cCz_G            = ones(stations, n_Mass);
cCa_G            = ones(stations, n_Mass);
Normal_force_G   = ones(stations, n_Mass);
Axial_force_G    = ones(stations, n_Mass);
Shear_distr_G    = ones(stations, n_Mass);
Bend_mom_distr_G = ones(stations, n_Mass);
m_distr_G        = ones(stations, n_Mass);
Tors_mom_distr_G = ones(stations, n_Mass);

% Point F allocation 
cl_F             = ones(stations, n_Mass); 
cd_F             = ones(stations, n_Mass);  
cm_F             = ones(stations, n_Mass); 
alfaF            = ones(n_Mass, 1);
qF               = ones(n_Mass, 1);
cCl_distr_F      = ones(stations, n_Mass); 
cCd_distr_F      = ones(stations, n_Mass); 
AoA_ToT_deg_F    = ones(n_Mass, 1);
AoA_ToT_rad_F    = ones(n_Mass, 1);
cCz_F            = ones(stations, n_Mass);
cCa_F            = ones(stations, n_Mass);
Normal_force_F   = ones(stations, n_Mass);
Axial_force_F    = ones(stations, n_Mass);
Shear_distr_F    = ones(stations, n_Mass);
Bend_mom_distr_F = ones(stations, n_Mass);
m_distr_F        = ones(stations, n_Mass);
Tors_mom_distr_F = ones(stations, n_Mass);

% Point E allocation 
cl_E             = ones(stations, n_Mass); 
cd_E             = ones(stations, n_Mass);  
cm_E             = ones(stations, n_Mass); 
alfaE            = ones(n_Mass, 1);
qE               = ones(n_Mass, 1);
cCl_distr_E      = ones(stations, n_Mass); 
cCd_distr_E      = ones(stations, n_Mass); 
AoA_ToT_deg_E    = ones(n_Mass, 1);
AoA_ToT_rad_E    = ones(n_Mass, 1);
cCz_E            = ones(stations, n_Mass);
cCa_E            = ones(stations, n_Mass);
Normal_force_E   = ones(stations, n_Mass);
Axial_force_E    = ones(stations, n_Mass);
Shear_distr_E    = ones(stations, n_Mass);
Bend_mom_distr_E = ones(stations, n_Mass);
m_distr_E        = ones(stations, n_Mass);
Tors_mom_distr_E = ones(stations, n_Mass);

%% Actual calculation - Straight and inverted flight 
for i = 1:n_Mass
    
    %% Point S - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.clS.value(:,i); 
    cd_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cdS.value(:,i); 
    cm_S(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cmS.value(:,i); 
    alfaS(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.alfaS_deg.value(i,1);
    qS(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.qS.value(i,1);
    point_name = 'PointSstraight';
    graph_name = 'Point S';
    
    [cCl_distr_S(:,i), cCd_distr_S(:,i), AoA_ToT_deg_S(i,1), AoA_ToT_rad_S(i,1), ...
     cCz_S(:,i), cCa_S(:,i), Normal_force_S(:,i), Axial_force_S(:,i), Shear_distr_S(:,i), ...
     Bend_mom_distr_S(:,i), m_distr_S(:,i), Tors_mom_distr_S(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_S(:,i), cd_S(:,i), ...
                                                                                                      cm_S(:,i), alfaS(i,1), root_twist_angle, qS(i,1), ...
                                                                                                      point_name, i, graph_name);
                                                                                                  
    %% Point A - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.clA.value(:,i); 
    cd_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cdA.value(:,i); 
    cm_A(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cmA.value(:,i); 
    alfaA(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.alfaA_deg.value(i,1);
    qA(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.qA.value(i,1);
    point_name = 'PointA';
    graph_name = 'Point A';
    
    [cCl_distr_A(:,i), cCd_distr_A(:,i), AoA_ToT_deg_A(i,1), AoA_ToT_rad_A(i,1), ...
     cCz_A(:,i), cCa_A(:,i), Normal_force_A(:,i), Axial_force_A(:,i), Shear_distr_A(:,i), ...
     Bend_mom_distr_A(:,i), m_distr_A(:,i), Tors_mom_distr_A(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_A(:,i), cd_A(:,i), ...
                                                                                                      cm_A(:,i), alfaA(i,1), root_twist_angle, qA(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point C - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.clC.value(:,i); 
    cd_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cdC.value(:,i); 
    cm_C(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cmC.value(:,i); 
    alfaC(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.alfaC_deg.value(i,1);
    qC(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.qC.value(i,1);
    point_name = 'PointC';
    graph_name = 'Point C';
    
    [cCl_distr_C(:,i), cCd_distr_C(:,i), AoA_ToT_deg_C(i,1), AoA_ToT_rad_C(i,1), ...
     cCz_C(:,i), cCa_C(:,i), Normal_force_C(:,i), Axial_force_C(:,i), Shear_distr_C(:,i), ...
     Bend_mom_distr_C(:,i), m_distr_C(:,i), Tors_mom_distr_C(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_C(:,i), cd_C(:,i), ...
                                                                                                      cm_C(:,i), alfaC(i,1), root_twist_angle, qC(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point D - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.clD.value(:,i); 
    cd_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cdD.value(:,i); 
    cm_D(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cmD.value(:,i); 
    alfaD(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.alfaD_deg.value(i,1);
    qD(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.qD.value(i,1);
    point_name = 'PointD';
    graph_name = 'Point D';
    
    [cCl_distr_D(:,i), cCd_distr_D(:,i), AoA_ToT_deg_D(i,1), AoA_ToT_rad_D(i,1), ...
     cCz_D(:,i), cCa_D(:,i), Normal_force_D(:,i), Axial_force_D(:,i), Shear_distr_D(:,i), ...
     Bend_mom_distr_D(:,i), m_distr_D(:,i), Tors_mom_distr_D(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_D(:,i), cd_D(:,i), ...
                                                                                                      cm_D(:,i), alfaD(i,1), root_twist_angle, qD(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point S inverted - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_S_inv(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.clSinv.value(:,i); 
    cd_S_inv(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cdSinv.value(:,i); 
    cm_S_inv(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cmSinv.value(:,i); 
    alfaS_inv(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.alfaSinv_deg.value(i,1);
    qS_inv(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.qSinv.value(i,1);
    point_name = 'PointSinverted';
    graph_name = 'Point S inverted';
    
    [cCl_distr_S_inv(:,i), cCd_distr_S_inv(:,i), AoA_ToT_deg_S_inv(i,1), AoA_ToT_rad_S_inv(i,1), ...
     cCz_S_inv(:,i), cCa_S_inv(:,i), Normal_force_S_inv(:,i), Axial_force_S_inv(:,i), Shear_distr_S_inv(:,i), ...
     Bend_mom_distr_S_inv(:,i), m_distr_S_inv(:,i), Tors_mom_distr_S_inv(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_S_inv(:,i), cd_S_inv(:,i), ...
                                                                                                      cm_S_inv(:,i), alfaS_inv(i,1), root_twist_angle, qS_inv(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point G - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_G(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.clG.value(:,i); 
    cd_G(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cdG.value(:,i); 
    cm_G(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cmG.value(:,i); 
    alfaG(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.alfaG_deg.value(i,1);
    qG(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.qG.value(i,1);
    point_name = 'PointG';
    graph_name = 'Point G';
    
    [cCl_distr_G(:,i), cCd_distr_G(:,i), AoA_ToT_deg_G(i,1), AoA_ToT_rad_G(i,1), ...
     cCz_G(:,i), cCa_G(:,i), Normal_force_G(:,i), Axial_force_G(:,i), Shear_distr_G(:,i), ...
     Bend_mom_distr_G(:,i), m_distr_G(:,i), Tors_mom_distr_G(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_G(:,i), cd_G(:,i), ...
                                                                                                      cm_G(:,i), alfaG(i,1), root_twist_angle, qG(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point F - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.clF.value(:,i); 
    cd_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cdF.value(:,i); 
    cm_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cmF.value(:,i); 
    alfaF(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.alfaF_deg.value(i,1);
    qF(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.qF.value(i,1);
    point_name = 'PointF';
    graph_name = 'Point F';
    
    [cCl_distr_F(:,i), cCd_distr_F(:,i), AoA_ToT_deg_F(i,1), AoA_ToT_rad_F(i,1), ...
     cCz_F(:,i), cCa_F(:,i), Normal_force_F(:,i), Axial_force_F(:,i), Shear_distr_F(:,i), ...
     Bend_mom_distr_F(:,i), m_distr_F(:,i), Tors_mom_distr_F(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_F(:,i), cd_F(:,i), ...
                                                                                                      cm_F(:,i), alfaF(i,1), root_twist_angle, qF(i,1), ...
                                                                                                      point_name, i, graph_name);

    %% Point E - Shear, Bending, Torsion
    % Coefficient distribution along the wing semi-span
    cl_E(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.clE.value(:,i); 
    cd_F(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cdE.value(:,i); 
    cm_E(:,i)  = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cmE.value(:,i); 
    alfaE(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.alfaE_deg.value(i,1);
    qE(i,1)    = Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.qE.value(i,1);
    point_name = 'PointE';
    graph_name = 'Point E';
    
    [cCl_distr_E(:,i), cCd_distr_E(:,i), AoA_ToT_deg_E(i,1), AoA_ToT_rad_E(i,1), ...
     cCz_E(:,i), cCa_E(:,i), Normal_force_E(:,i), Axial_force_E(:,i), Shear_distr_E(:,i), ...
     Bend_mom_distr_E(:,i), m_distr_E(:,i), Tors_mom_distr_E(:,i)] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, y_halfspan, cl_E(:,i), cd_E(:,i), ...
                                                                                                      cm_E(:,i), alfaE(i,1), root_twist_angle, qE(i,1), ...
                                                                                                      point_name, i, graph_name);
                                                                                                                                                                                                                                                                                                                                                                                                    
end

%% Number of figures already opened
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number + 1;

%% SHEAR BENDING TORSION COMPARISONS
ShearBendingTorsionComparisonGraph

%% STORE INSIDE THE AIRCRAFT STRUCT VARIABLE 

% POINT S STRAIGHT 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCl_distr_S.value      = cCl_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCd_distr_S.value      = cCd_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCz_S.value            = cCz_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.cCa_S.value            = cCa_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Normal_force_S.value   = Normal_force_S; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Axial_force_S.value    = Axial_force_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Shear_distr_S.value    = Shear_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Bend_mom_distr_S.value = Bend_mom_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.m_distr_S.value        = m_distr_S;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS.Tors_mom_distr_S.value = Tors_mom_distr_S;

% POINT A 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCl_distr_A.value      = cCl_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCd_distr_A.value      = cCd_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCz_A.value            = cCz_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.cCa_A.value            = cCa_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Normal_force_A.value   = Normal_force_A; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Axial_force_A.value    = Axial_force_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Shear_distr_A.value    = Shear_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Bend_mom_distr_A.value = Bend_mom_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.m_distr_A.value        = m_distr_A;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointA.Tors_mom_distr_A.value = Tors_mom_distr_A;

% POINT C 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCl_distr_C.value      = cCl_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCd_distr_C.value      = cCd_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCz_C.value            = cCz_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.cCa_C.value            = cCa_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Normal_force_C.value   = Normal_force_C; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Axial_force_C.value    = Axial_force_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Shear_distr_C.value    = Shear_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Bend_mom_distr_C.value = Bend_mom_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.m_distr_C.value        = m_distr_C;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointC.Tors_mom_distr_C.value = Tors_mom_distr_C;

% POINT D 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCl_distr_D.value      = cCl_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCd_distr_D.value      = cCd_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCz_D.value            = cCz_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.cCa_D.value            = cCa_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Normal_force_D.value   = Normal_force_D; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Axial_force_D.value    = Axial_force_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Shear_distr_D.value    = Shear_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Bend_mom_distr_D.value = Bend_mom_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.m_distr_D.value        = m_distr_D;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointD.Tors_mom_distr_D.value = Tors_mom_distr_D;

% POINT S INVERTED
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCl_distr_Sinv.value      = cCl_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCd_distr_Sinv.value      = cCd_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCz_Sinv.value            = cCz_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.cCa_Sinv.value            = cCa_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Normal_force_Sinv.value   = Normal_force_S_inv; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Axial_force_Sinv.value    = Axial_force_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Shear_distr_Sinv.value    = Shear_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Bend_mom_distr_Sinv.value = Bend_mom_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.m_distr_Sinv.value        = m_distr_S_inv;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointS_inv.Tors_mom_distr_Sinv.value = Tors_mom_distr_S_inv;

% POINT G 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCl_distr_G.value      = cCl_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCd_distr_G.value      = cCd_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCz_G.value            = cCz_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.cCa_G.value            = cCa_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Normal_force_G.value   = Normal_force_G; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Axial_force_G.value    = Axial_force_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Shear_distr_G.value    = Shear_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Bend_mom_distr_G.value = Bend_mom_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.m_distr_G.value        = m_distr_G;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointG.Tors_mom_distr_G.value = Tors_mom_distr_G;

% POINT F 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCl_distr_F.value      = cCl_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCd_distr_F.value      = cCd_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCz_F.value            = cCz_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.cCa_F.value            = cCa_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Normal_force_F.value   = Normal_force_F; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Axial_force_F.value    = Axial_force_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Shear_distr_F.value    = Shear_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Bend_mom_distr_F.value = Bend_mom_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.m_distr_F.value        = m_distr_F;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointF.Tors_mom_distr_F.value = Tors_mom_distr_F;

% POINT E 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCl_distr_E.value      = cCl_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCd_distr_E.value      = cCd_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCz_E.value            = cCz_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.cCa_E.value            = cCa_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Normal_force_E.value   = Normal_force_E; 
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Axial_force_E.value    = Axial_force_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Shear_distr_E.value    = Shear_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Bend_mom_distr_E.value = Bend_mom_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.m_distr_E.value        = m_distr_E;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.PointE.Tors_mom_distr_E.value = Tors_mom_distr_E;
end