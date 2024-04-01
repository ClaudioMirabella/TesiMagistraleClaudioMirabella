%% FINAL ENVELOPE
% Now we must develop a systematic approach to the final envelope, due to
% the fact that the gust envelope and flight envelope must be combined to
% obtain the final envelope. 

% Max and min load factor
nmax = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmax.value;
nmin = Aircraft.Certification.Regulation.SubpartC.Flightloads.nmin.value;

% Gust load factors
npos_cruise_sea_level = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_cruise_sea_level.value;
nneg_cruise_sea_level = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_cruise_sea_level.value;
npos_dive_sea_level   = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.npos_dive_sea_level.value;
nneg_dive_sea_level   = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.nneg_dive_sea_level.value;

% Gust airspeed
V_gust_cruise = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_cruise.value;
V_gust_dive   = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Airspeed_dive.value;

% NUMBER OF ELEMENTS X AND Y
numb   = 1e3;
n_Mass = Aircraft.Mass.Vector_length.value;

% GUST SPEED - CRUISE 
Ude_cruise = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_cruise.value;
Ude_dive   = Aircraft.Certification.Regulation.SubpartC.Flightloads.Ude_dive.value;

% Manoeuvring airspeed and load factor
VA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.VA.value;
nA = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointA.nA.value;
% Manoeuvring airspeed and load factor in inverted flight
VG           = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.VG.value;
nG           = ones(n_Mass, 1);
for i = 1:n_Mass
    nG(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointG.nG.value;
end
nE           = ones(n_Mass, 1);
for i = 1:n_Mass
    nE(i,1) = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointE.nE.value;
end
% Cruise airspeed and load factor
VC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.VC.value;
nC = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointC.nC.value;
% Cruise airspeed and load factor in inverted flight
VF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.VF.value;
nF = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointF.nF.value;
% Dive airspeed and load factor
VD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.VD.value;
nD = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointD.nD.value;
% Point S in inverted flight
VS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.VS_inv.value;
nS_inv = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS_inv.nS_inv.value;

% Air density
rho0   = Aircraft.Standard_atmosphere.Sea_level.rho.value;
rho_op = Aircraft.Standard_atmosphere.Operative_ceiling.rho.value;
rho_th = Aircraft.Standard_atmosphere.Theoretical_ceiling.rho.value;

% Lift coefficients
CLmax_clean    = Aircraft.Certification.Aerodynamic_data.CL_max_clean.value;
CLmax_inverted = Aircraft.Certification.Aerodynamic_data.CL_max_inverted.value;

% LIFT CURVE SLOPE IN 1/RAD
CLalfa_rad = Aircraft.Certification.Aerodynamic_data.Interpolation.CLalfa_rad.value;

% Wing loading 
WS = Aircraft.Performance.Wing_loading.value;

% Gust alleviation factor
Kg_sea_level = Aircraft.Certification.Regulation.SubpartC.Flightloads.GustEnvelope.Kg_sea_level.value;

%%  POSITIVE SIDE OF THE FINAL ENVELOPE
new_VA        = ones(n_Mass, 1);
for i = 1:n_Mass
    syms a b c V
    a              = rho0 * CLmax_clean;
    b              = rho0 * CLalfa_rad * Kg_sea_level(i) * Ude_cruise;
    c              = 2 * WS(i); 
    eqn            = a * V^2 - b * V - c ;
    Solution       = vpasolve(eqn, V);
    n_solution     = length(Solution);
    for j = 1:n_solution
        check_val   = cast(Solution(j), 'double');
        if check_val > 0
            new_VA(i) = check_val;
        end
    end
end
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VA.value           = new_VA;
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VA.Attributes.unit = "m/s";

%% FINAL ENVELOPE CALCULATIONS 

nC_new = ones(n_Mass,1);
nA_new = ones(n_Mass,1);
VA_new = ones(n_Mass,1);
nGust1 = ones(n_Mass,1);
VGust1 = ones(n_Mass,1);
VGust2 = ones(n_Mass,1);
nGust2 = ones(n_Mass,1);
% nG     = ones(n_Mass,1);

% Initialization
V_from0toS = ones(numb, n_Mass);
n_from0toS = ones(numb, n_Mass);
V_fromStoA = ones(numb, n_Mass);
n_fromStoA = ones(numb, n_Mass);

% Initialization
V_fromAtoGust1 = ones(numb, n_Mass);
n_fromAtoGust1 = ones(numb, n_Mass);
V_fromAtoC     = ones(numb, n_Mass);
n_fromAtoC     = ones(numb, n_Mass);
V_fromCtoD     = ones(numb, n_Mass);
n_fromCtoD     = ones(numb, n_Mass);
V_fromGust1toC = ones(numb, n_Mass);
n_fromGust1toC = ones(numb, n_Mass);
V_fromCtoGust2 = ones(numb, n_Mass);
n_fromCtoGust2 = ones(numb, n_Mass);
V_fromGust2toD = ones(numb, n_Mass);
n_fromGust2toD = ones(numb, n_Mass);
V_fromDto0     = ones(numb, n_Mass);
n_fromDto0     = ones(numb, n_Mass);

% Initialization
V_from0toS_inv = ones(numb, n_Mass);
n_from0toS_inv = ones(numb, n_Mass);
V_fromS_invtoG = ones(numb, n_Mass);
n_fromS_invtoG = ones(numb, n_Mass);
V_fromGtoF     = ones(numb, n_Mass);
n_fromGtoF     = ones(numb, n_Mass);
V_fromFtoE     = ones(numb, n_Mass);
n_fromFtoE     = ones(numb, n_Mass);
V_fromEto0     = ones(numb, n_Mass);
n_fromEto0     = ones(numb, n_Mass);
n_fromGtoGust1 = ones(numb, n_Mass);
V_fromGtoGust1 = ones(numb, n_Mass);
n_fromGust1toF = ones(numb, n_Mass);
V_fromGust1toF = ones(numb, n_Mass);
n_fromFtoGust2 = ones(numb, n_Mass); 
V_fromFtoGust2 = ones(numb, n_Mass);
n_fromGust2toE = ones(numb, n_Mass);
V_fromGust2toE = ones(numb, n_Mass);

airload_flag_pos_cruise = 'positive_cruise';
airload_flag_neg_cruise = 'negative_cruise';
airload_flag_pos_dive   = 'positive_dive';
airload_flag_neg_dive   = 'negative_dive';

Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value = strings(n_Mass,1);
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.Attributes.unit = "flag";

for i = 1:n_Mass 
   if new_VA(i) > VA(i) 
       
       % CASE 1
       Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i)        = "Case 1";
       
       % FROM 0 TO S
       nS = Aircraft.Certification.Regulation.SubpartC.Flightloads.FlightEnvelope.PointS.nS.value;
       V_from0toS(:,i) = VS(i) * ones(numb, 1);
       n_from0toS(:,i) = linspace(0.0, nS, numb)';
       
       % FROM S TO A 
       n_fromStoA(:,i) = linspace(nS, nA, numb)';
       V_fromStoA(:,i) = Vstall(WS(i), rho0, CLmax_clean, n_fromStoA(:,i));
       
       if max(npos_cruise_sea_level(:,i)) > nmax       
           
           V_Test = linspace(VS(i), VC(i), numb)';
           n_Test = nGust(rho0, V_Test, CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
           tol    = 1e-3; 
           for k = 1:numb
               ntest = n_Test(k); 
               check = ntest - nmax;
               if abs(check) < tol
                   row       = k; 
                   VGust1(i) = V_Test(row);
               end
           end
           % FROM A TO GUST1
           nGust1(i)           = nmax; 
           n_fromAtoGust1(:,i) = nmax * ones(numb, 1); 
           V_fromAtoGust1(:,i) = linspace(VA(i), VGust1(i), numb)';
           VGust1(i)           = V_fromAtoGust1(end,i);   
           
           % FROM GUST1 TO C
           V_fromGust1toC(:,i) = linspace(VGust1(i), VC(i), numb)';
           n_fromGust1toC(:,i) = nGust(rho0, V_fromGust1toC(:,i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
           nC(i)               = n_fromGust1toC(end,i);
           
           % FROM C TO GUST2 
           p                   = polyfit([npos_cruise_sea_level(end, i) npos_dive_sea_level(end, i)], ...
                                         [V_gust_cruise(end, i) V_gust_dive(end, i)], 1);
           n_fromCtoGust2(:,i) = linspace(nC(i), nmax, numb)';
           V_fromCtoGust2(:,i) = polyval(p, n_fromCtoGust2(:,i));
           VGust2(i)           = V_fromCtoGust2(end,i);
           nGust2(i)           = n_fromCtoGust2(end,i);
           
           % FROM GUST2 TO D
           n_fromGust2toD(:,i) = nmax * ones(numb, 1); 
           V_fromGust2toD(:,i) = linspace(VGust2(i), VD(i), numb)';
           
           % FROM D TO 0
           n_fromDto0(:,i) = linspace(nmax, 0.0, numb)';
           V_fromDto0(:,i) = VD(i) * ones(numb, 1); 
           
       elseif max(npos_cruise_sea_level(:,i)) < nmax
           
                % FROM A TO C 
                V_fromAtoC(:,i) = linspace(VA(i), VC(i), numb)';
                n_fromAtoC(:,i) = nmax * ones(numb, 1);
                VC(i)           = V_fromAtoC(end);
                nC(i)           = nmax;
                
                % FROM C TO D 
                V_fromCtoD(:,i) = linspace(VC(i), VD(i), numb)';
                n_fromCtoD(:,i) = nmax * ones(numb, 1);
                
                % FROM D TO 0
                V_fromDto0(:,i) = VD(i) * ones(numb, 1);
                n_fromDto0(:,i) = linspace(nD, 0.0, numb)';
                
       end
       
   elseif new_VA(i) < VA(i)
       
       % CASE 2
       Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(i) = "Case 2";
       
       % MANOEUVRING AIRSPEED
       VA_new(i) = new_VA(i); 
       nA_new(i) = nGust(rho0, VA(i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
       
       % FROM 0 TO S
       n_from0toS(:,i) = linspace(0.0, nS, numb)';
       V_from0toS(:,i) = VS(i) * ones(numb, 1); 
       
       % FROM S TO A 
       n_fromStoA(:,i) = linspace(nS, nA, numb)';
       V_fromStoA(:,i) = Vstall(WS(i), rho0, CLmax_clean, n_fromStoA(:,i));
       
       % FROM A TO GUST1 
       n_fromAtoGust1(:,i) = nA * ones(numb,1); 
       V_Test              = linspace(VA(i), VC(i), numb)';
       n_Test              = nGust(rho0, V_Test, CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
       tol                 = 1e-3;
       index_Gust1         = find(abs(n_Test - n_fromAtoGust1(:,i)) <= tol);
       if isempty(index_Gust1) == 0
           % FROM A TO GUST1
           index_gust1         = index_Gust1(end-1);
           VGust1              = V_Test(index_gust1);
           V_fromAtoGust1(:,i) = linspace(VA(i), VGust1, numb)';

           % FROM GUST1 TO C 
           V_fromGust1toC(:,i) = linspace(VGust1, VC(i), numb)';
           n_fromGust1toC(:,i) = nGust(rho0, V_fromGust1toC(:,i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
           nC_new(i)           = n_fromGust1toC(end,i);
           
           % FROM C TO GUST2
           p                   = polyfit([npos_cruise_sea_level(end, i) npos_dive_sea_level(end, i)], ...
                                     [V_gust_cruise(end, i) V_gust_dive(end, i)], 1);
           n_fromCtoGust2(:,i) = linspace(nC_new(i), nmax, numb)';
           V_fromCtoGust2(:,i) = polyval(p, n_fromCtoGust2(:,i));     
           VGust2(i)           = V_fromCtoGust2(end,i);

           % FROM GUST2 TO D 
           n_fromGust2toD(:,i) = nmax * ones(numb,1);
           V_fromGust2toD(:,i) = linspace(VGust2(i), VD(i), numb)';
       elseif isempty(index_Gust1) == 1
           % FROM A TO GUST1
           VGust1    = zeros(length(n_Mass));
           VGust1(i) = VC(i) - 0.1*VA(i);
           V_fromAtoGust1(:,i) = linspace(VA(i), VGust1(i), numb)';

           % FROM GUST1 TO C 
           V_fromGust1toC(:,i) = linspace(VGust1(i), VC(i), numb)';
           n_fromGust1toC(:,i) = nA * ones(numb,1);
           nC_new(i)           = nC;

           % FROM C TO GUST2
           n_fromCtoGust2(:,i) = nA * ones(numb,1);
           VGust2              = zeros(n_Mass);
           VGust2(i)           = VC(i) + 0.1*VA(i);
           V_fromCtoGust2(:,i) = linspace(VC(i), VGust2(i), numb)';  

           % FROM GUST2 TO D
           n_fromGust2toD(:,i) = nA * ones(numb,1);
           V_fromGust2toD(:,i) = linspace(VGust2(i), VD(i), numb)';
       end

       % FROM D TO 0
       n_fromDto0(:,i) = linspace(nmax, 0.0, numb)';
       V_fromDto0(:,i) = VD(i) * ones(numb,1); 
       
   end
end

%% STORE INSIDE THE STRUCTURED VARIABLE
for j = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag.value(j)) 
        case "Case 1" 
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM 0 TO S
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.value               = V_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.Attributes.unit     = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.value               = n_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.Attributes.unit     = "g";
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM S TO A
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.value               = V_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.Attributes.unit     = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.value               = n_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.Attributes.unit     = "g";
            if max(npos_cruise_sea_level(:,i)) > nmax   
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM A TO GUST1
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value           = V_fromAtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value           = n_fromAtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.Attributes.unit = "g";  
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST1 TO C 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value           = V_fromGust1toC;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value           = n_fromGust1toC;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM C TO GUST2 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value           = V_fromCtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value           = n_fromCtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST2 TO D 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value           = V_fromGust2toD;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value           = n_fromGust2toD;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM D TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value               = V_fromDto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value               = n_fromDto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.Attributes.unit     = "g"; 
            elseif max(npos_cruise_sea_level(:,i)) < nmax 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM A TO C
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoC.value               = V_fromAtoC;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoC.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoC.value               = n_fromAtoC;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoC.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM C TO D
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoD.value               = V_fromCtoD;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoD.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoD.value               = n_fromCtoD;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoD.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM D TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value               = V_fromDto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value               = n_fromDto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.Attributes.unit     = "g"; 
            end
        case "Case 2" 
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM 0 TO S
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.value               = V_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS.Attributes.unit     = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.value               = n_from0toS;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS.Attributes.unit     = "g";
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM S TO A
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.value               = V_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromStoA.Attributes.unit     = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.value               = n_fromStoA;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromStoA.Attributes.unit     = "g";
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM A TO GUST1
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.value           = V_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromAtoGust1.Attributes.unit = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.value           = n_fromAtoGust1;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromAtoGust1.Attributes.unit = "g"; 
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST1 TO C
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.value           = V_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toC.Attributes.unit = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.value           = n_fromGust1toC;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toC.Attributes.unit = "g"; 
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM C TO GUST2
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.value           = V_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromCtoGust2.Attributes.unit = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.value           = n_fromCtoGust2;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromCtoGust2.Attributes.unit = "g";
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST2 TO D
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.value           = V_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toD.Attributes.unit = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.value           = n_fromGust2toD;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toD.Attributes.unit = "g";  
            % STORE INSIDE THE STRUCTURED VARIABLE - FROM D TO 0
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.value               = V_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromDto0.Attributes.unit     = "m/s";
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.value               = n_fromDto0;
            Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromDto0.Attributes.unit     = "g";  
    end  
end
%% INVERTED FLIGHT SIDE OF THE FINAL ENVELOPE

new_VG        = ones(n_Mass, 1);
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value           = strings(n_Mass,1);
Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.Attributes.unit = "flag";

for i = 1:n_Mass
    syms a b c V
    a              = rho0 * CLmax_inverted;
    b              = rho0 * CLalfa_rad * Kg_sea_level(i) * Ude_cruise;
    c              = 2 * WS(i); 
    eqn            = a * V^2 + b * V - c ;
    Solution       = vpasolve(eqn, V);
    check_solution = isreal(Solution);
    disp(" ")
    disp(" Check solution: Inverted flight conditions ")
    if check_solution == 1
        
        % CASE 
        Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(i) = "Case 1";
        
        n_solution     = length(Solution);
        for j = 1:n_solution
            check_val   = cast(Solution(j), 'double');
            if (check_val > 0) && (check_val > VG(i))
                
                % Manoeuvring speed
                new_VG(i) = abs(check_val);
                nG(i)     = nGustInverted(rho0, new_VG(i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VG.value           = new_VG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VG.Attributes.unit = "m/s";
                
                % FROM 0 TO S INVERTED 
                n_from0toS_inv(:,i) = linspace(0.0, nS_inv, numb)';
                V_from0toS_inv(:,i) = VS_inv(i) * ones(numb, 1);
                
                % FROM S INVERTED TO G 
                n_fromS_invtoG(:,i) = linspace(nS_inv, nG(i), numb)';
                V_fromS_invtoG(:,i) = Vstall(WS(i), rho0, CLmax_inverted, n_fromS_invtoG(:,i));
                
                % FROM G TO F 
                V_fromGtoF(:,i) = linspace(new_VG(i), VF(i), numb)';
                n_fromGtoF(:,i) = nGustInverted(rho0, V_fromGtoF(:,i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
                
                % FROM F TO E 
                n_fromFtoE(:,i) = linspace(n_fromGtoF(end,i), nneg_dive_sea_level(end,i), numb)';
                p               = polyfit([nneg_cruise_sea_level(end,i) nneg_dive_sea_level(end,i)], ...
                                          [VF(i) V_gust_dive(end)], 1);
                V_fromFtoE(:,i) = polyval(p, n_fromFtoE(:,i));
                
                % FROM E TO 0 
                V_fromEto0(:,i) = V_fromFtoE(end,i) * ones(numb,1);
                n_fromEto0(:,i) = linspace(n_fromFtoE(end,i), 0.0, numb)';
                
            elseif (check_val > 0) && (check_val < VG(i))
                disp("Wait, nothing to do here!")
            end
        end
    elseif check_solution == 0
        
        % CASE 
        Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(i)        = "Case 2";
        
        % Warning for no real solutions
        disp( " WARNING: There no solution in the real numbers. ")
        disp( " Manoeuvring flight speed in inverted flight will not change" )
        new_VG(i) = VG(i);
        Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VG.value           = new_VG;
        Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.new_VG.Attributes.unit = "m/s";
        % If - Elseif cycle to derive the final envelope
        if abs(min(nneg_cruise_sea_level)) > abs(nmin)
            
            % FROM 0 TO S INVERTED 
            n_from0toS_inv(:,i) = linspace(0.0, nS_inv, numb)';
            V_from0toS_inv(:,i) = VS_inv(i) * ones(numb, 1); 
            
            % FROM S INVERTED TO G 
            n_fromS_invtoG(:,i) = linspace(nS_inv, nG(i), numb)'; 
            V_fromS_invtoG(:,i) = Vstall(WS(i), rho0, CLmax_inverted, n_fromS_invtoG(:,i));
            
            % FROM G TO GUST1  
            V_Test = linspace(VG(i), VF(i), numb)';
            n_Test = nGustInverted(rho0, V_Test, CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
            tol    = 1e-3;
            for k = 1:length(V_Test) 
                if abs(abs(n_Test(k)) - abs(nmin)) < tol
                    row    = k;
                    VGust1 = V_Test(row);
                end
            end
            n_fromGtoGust1(:,i) = nmin * ones(numb, 1);
            V_fromGtoGust1(:,i) = linspace(VG(i), VGust1, numb)';
            
            % FROM GUST1 TO F 
            V_fromGust1toF(:,i) = linspace(VGust1, VF(i), numb)';
            n_fromGust1toF(:,i) = nGustInverted(rho0, V_fromGust1toF(:,i), CLalfa_rad, Kg_sea_level(i), Ude_cruise, WS(i));
            nGust1              = n_fromGust1toF(1,1);
            
            % FROM F TO GUST2
            n_fromFtoGust2(:,i) = linspace(n_fromGust1toF(end,i), nmin, numb)';
            nGust2              = n_fromFtoGust2(end,i);
            p                   = polyfit([nneg_cruise_sea_level(end,i) nneg_dive_sea_level(end,i)], ...
                                          [VF(i) V_gust_dive(end)], 1);
            V_fromFtoGust2(:,i) = polyval(p, n_fromFtoGust2(:,i));
            VGust2              = V_fromFtoGust2(end,i);   

            % FROM GUST2 TO E 
            V_fromGust2toE(:,i) = linspace(VGust2, VE(i), numb)';
            n_fromGust2toE(:,i) = nmin * ones(numb, 1);

            % FROM E TO 0
            n_fromEto0(:,i) = linspace(nmin, 0.0, numb)';
            V_fromEto0(:,i) = VE(i) * ones(numb, 1);
             
        elseif abs(min(nneg_cruise_sea_level)) < abs(nmin)
            
            % FROM 0 TO S_INVERTED 
            n_from0toS_inv(:,i) = linspace(0.0, nS_inv, numb)';
            V_from0toS_inv(:,i) = VS_inv(i) * ones(numb, 1);

            % FROM S_INVERTED TO G
            n_fromS_invtoG(:,i) = linspace(nS_inv, nG(i), numb)';
            V_fromS_invtoG(:,i) = Vstall(WS(i), rho0, CLmax_inverted, n_fromS_invtoG(:,i));

            % FROM G TO F
            n_fromGtoF(:,i) = nmin * ones(numb, 1);
            V_fromGtoF(:,i) = linspace(VG(i), VF(i), numb)';   

            % FROM F TO E
            n_fromFtoE(:,i) = nmin * ones(numb, 1);
            V_fromFtoE(:,i) = linspace(VF(i), VE(i), numb)';  

            % FROM E TO 0
            n_fromEto0(:,i) = linspace(nmin, 0.0, numb)';
            V_fromEto0(:,i) = VE(i) * ones(numb, 1);  
            
        end
    end
end


%% STORE INSIDE THE STRUCTURED VARIABLE
for j = 1:n_Mass
    switch(Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.Case_flag_inverted.value(j)) 
        case "Case 2" 
            if abs(min(nneg_cruise_sea_level(:,i))) > abs(nmin)  
                
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value               = V_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value               = n_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.Attributes.unit     = "g";
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value               = V_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value               = n_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.Attributes.unit     = "g";
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM G TO GUST1
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoGust1.value           = V_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoGust1.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoGust1.value           = n_fromGtoGust1;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoGust1.Attributes.unit = "g";  
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST1 TO F 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toF.value           = V_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust1toF.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toF.value           = n_fromGust1toF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust1toF.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM F TO GUST2 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoGust2.value           = V_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoGust2.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoGust2.value           = n_fromFtoGust2;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoGust2.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM GUST2 TO E 
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toE.value           = V_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGust2toE.Attributes.unit = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toE.value           = n_fromGust2toE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGust2toE.Attributes.unit = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value               = V_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value               = n_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.Attributes.unit     = "g"; 
                
            elseif abs(min(nneg_cruise_sea_level(:,i))) < abs(nmin)
                
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value               = V_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value               = n_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value               = V_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value               = n_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM G TO F
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.value               = V_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.value               = n_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM F TO E
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.value               = V_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.value               = n_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value               = V_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value               = n_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.Attributes.unit     = "g"; 
            end
        case "Case 1" 

                % STORE INSIDE THE STRUCTURED VARIABLE - FROM 0 TO S INVERTED
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.value               = V_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_from0toS_inv.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.value               = n_from0toS_inv;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_from0toS_inv.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM S INVERTED TO G
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.value               = V_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromS_invtoG.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.value               = n_fromS_invtoG;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromS_invtoG.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM G TO F
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.value               = V_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromGtoF.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.value               = n_fromGtoF;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromGtoF.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM F TO E
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.value               = V_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromFtoE.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.value               = n_fromFtoE;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromFtoE.Attributes.unit     = "g"; 
                % STORE INSIDE THE STRUCTURED VARIABLE - FROM E TO 0
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.value               = V_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.V_fromEto0.Attributes.unit     = "m/s";
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.value               = n_fromEto0;
                Aircraft.Certification.Regulation.SubpartC.Flightloads.FinalEnvelope.n_fromEto0.Attributes.unit     = "g"; 
    end  
end

%% PLOT FINAL ENVELOPE
FinalEnvelope

%% SUBPLOT FINAL ENVELOPE
FinalEnvelopeSubplots
