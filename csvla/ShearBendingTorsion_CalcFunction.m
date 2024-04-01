function [cCl_distr, cCd_distr, AoA_ToT_deg, AoA_ToT_rad, ...
          cCz, cCa, Normal_force, Axial_force, Shear_distr, ...
          Bend_mom_distr, m_distr, Tors_mom_distr] = ShearBendingTorsion_CalcFunction(obj2, chord_distr, half_span, cl, cd, cm, alfa, ...
                                                                                      twist_angle, q, Point, numb_case, graph_name)

% ShearBendingTorsion_CalcFunction(obj2, chord_distr, cl, cd, cm, alfa, twist_angle, q)
% A function that calculates forces and moments distributions along the
% wing semi-span. 
%
%   The function accepts as inputs 
%   obj2        --> Class with calculation methods 
%   chord_distr --> Chord distribution along the wing semi-span 
%   cl          --> Lift coefficient distribution along the wing semi-span 
%   cd          --> Drag coefficient distribution along the wing semi-span 
%   cm          --> Pitching mom. coefficient distribution along the wing 
%                   semi-span 
%   alfa        --> Flight, wing-body angle of attack extracted from final 
%                   flight envelope points
%   twist_angle --> Wing twist angle 
%   q           --> Dynamic pressure evaluated at final flight envelope 
%                   points
%
%   The function returns 
%   cCl_distr     --> Chord times lift coefficient distribution along the wing
%                     semi-span
%   cCd_distr     --> Chord times drag coefficient distribution along the wing 
%                     semi-span 
%   AoA_ToT_deg   --> Angle of attack in degrees 
%   AoA_ToT_rad   --> Angle of attack in radians 
%   cCz           --> Chord times normal force coefficient distribution along
%                     the wing semi-span
%   cCa           --> Chord times axial force coefficient distribution along
%                     the wing semi-span
%  Normal_force   --> Normal force distribution along the wing semi-span 
%  Axial_force    --> Axial force distribution along the wing semi-span
%  Shear_distr    --> Shear distribution along the wing semi-span
%  Bend_mom_distr --> Benging moment distribution along the wing semi-span
%  m_distr        --> Pitching moment distribution along the wing semi-span
%                     per unit lenght
%  Tors_mom_distr --> Torsion moment distribution along the wing semi-span


            % PRODUCT C(y)*Cl(y) AND C(y)*Cd(y)
            % In this section of the code two vectors are defined to store the product 
            % c(y)*Cl(y) and c(y)*Cd(y) inside the struct variable 'Aircraft'
            cCl_distr = times(chord_distr, cl);
            cCd_distr = times(chord_distr, cd);

            % AoA_Tot = AoA + Twist_angle of the main wing
            AoA_ToT_deg = alfa + twist_angle;
            AoA_ToT_rad = deg2rad(AoA_ToT_deg); 

            % Calculation of the normal force coefficient
            % N = calc_normal_force(AoA_Tot, cCl, cCd)
            % This function will be used to evaluate the normal force coefficients
            % distribution along the span; it is possible to fin a complete
            % documentation inside the class file ShearBendingTorsion.m 
            cCz = calc_normal_force(obj2, AoA_ToT_deg, cCl_distr, cCd_distr);

            % Calculation of the axial force coefficient 
            % A = calc_normal_force(AoA_ToT_deg, cCl, cCd)
            % This function will be used to evaluate the axial force coefficients
            % distribution along the span; it is possible to fin a complete
            % documentation inside the class file ShearBendingTorsion.m 
            cCa = calc_axial_force(obj2, AoA_ToT_deg, cCl_distr, cCd_distr);

            % Normal force 
            Normal_force = cCz * q;

            % Axial force 
            Axial_force = cCa * q;       

            % SHEAR FORCE CALCULATION 
            % A = calc_shear_force(AoA_ToT_deg, y, cCZ)
            % A complete description of this function is available inside the class
            % file ShearBendingTorsion.m 
            Shear_distr = calc_shear_force(obj2, half_span, Normal_force)*(1e-1);

            % BENDING MOMENT CALCULATION 
            % BM = calc_bend_mom(y, S)
            % A complete description of this function is included inside the class file
            % ShearBendingTorsion.m
            Bend_mom_distr = calc_bend_mom(obj2, half_span, Shear_distr);

            % PLANS FOR THE STRUCTURAL DIMENSIONING
            % To correctly size the aerostructures of the main lifting surface 
            % it is necessary to apply the procedure just developed to the 
            % critical points coming from the V-N diagram. Those point represents 
            % the most demanding flight conditions that our aircraft could survive. 
            % Those points are all stored inside: 
            % --> Aircraft.Certification.Regulation.SubpartC.Flightloads.Final_envelope
            % Retrieve the values and apply formulas to them. 

            % Pitching moment per unit length
            m_distr = zeros(length(cm), 1);
            for i = 1:length(cm)
                m_distr(i) = cm(i) * q *((chord_distr(i))^2);
            end 

            % Torque applied
            % T = calc_tors_mom(obj, y, m)
            % A complete distribution of this function is included inside the class
            % file ShearBendingTorsion.m
            Tors_mom_distr = calc_tors_mom(obj2, half_span, m_distr)*(1e-1);

            disp(" ")
            display_figure_name = strcat(' ++++ SHEAR, BENDING, TORSION - ', Point, ' ++++ ');
            display_figure_name = convertCharsToStrings(display_figure_name);
            disp(display_figure_name);
            
            if contains(Point,'PointSstraight') || contains(Point,'PointA') || contains(Point,'PointC') || contains(Point,'PointD')
                Shear_BendMom_diagram = Shear_Bending_Torsion_diag(obj2, flip(half_span), Shear_distr, Bend_mom_distr, ...
                                                               Tors_mom_distr, graph_name);
            elseif contains(Point,'PointSinverted') || contains(Point,'PointG') || contains(Point,'PointF') || contains(Point,'PointE')
                Shear_BendMom_diagram = Shear_Bending_Torsion_diag(obj2, flip(half_span), Shear_distr, Bend_mom_distr, ...
                                                               abs(Tors_mom_distr), graph_name);
            end

            mass_iteration  = num2str(numb_case);                                               
            figure_name_pdf = strcat('ShearBendingTorsionDiagramPoint', mass_iteration, Point, '.pdf');                                              
            exportgraphics(Shear_BendMom_diagram, figure_name_pdf, 'ContentType', 'vector')
            figure_name_png = strcat('ShearBendingTorsionDiagramPoint', mass_iteration, Point, '.png');  
            exportgraphics(Shear_BendMom_diagram, figure_name_png, 'ContentType', 'vector')

            % Saving figures inside correct folder
            fprintf('\n'); 
            % Moving file inside correct folder
            disp(" Store files inside Output folder ")
            movefile(figure_name_pdf, 'Output')
            movefile(figure_name_png, 'Output')       
            % =================================================================  
            
end

