function [calc_chord_distribution, half_span] = c_calc(b_wing, S_wing, N, ...
    croot, ctip, chord_kink_one, chord_kink_two, wing_type_flag, ...
    taper_ratio1, taper_ratio2, taper_ratio3)    
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    % GENERAL FUNCTION TO EVALUATE CHORD DISTRIBUTION OF A WING
    % 
    % INPUT 
    %  b_wing         --> Wing span
    %  S_wing         --> Wing surface
    %  N              --> Number of stations along the wing semi-span,
    %                     equal to the length of the cl_interpolated values
    %                     output of OPEN VSP
    %  N      = length(Aircraft.Certification.Regulation.SubpartC.Flightloads.Balancingloads.cl_interpolated.value(1,:));
    %  croot          --> Root chord
    %  ctip           --> Tip chord 
    %  chord_kink_one --> chord at first kink 
    %  chord_kink_two --> chord at second kink
    %  wing_type_flag --> Flag that identifies wing planform
    %  taper_ratio    --> Wing taper ratio for the three wing panels
    % OUTPUT 
    %  chord_distr    --> Chord distribution along the wing semi-span
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    % Half-span vector
    b_half    = b_wing*0.5;
    half_span = linspace(0, b_half, N)';
    % +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    kink1     = chord_kink_one;
    kink2     = chord_kink_two;
    
    switch (wing_type_flag)
        case 'Rectangular'
            % TAPER RATIO
            taper_ratio = ctip / croot;

            % Calculation of a chord distribution with a convenient, simple function.
            % 
            % c(y) = calc_chord(Swing, taper_ratio, span, y)
            % A complete documentation of this function is included inside the class
            % ShearBendingTorsion.m
            chord_distr = calc_chord(S_wing, taper_ratio, b_wing, half_span);

            % OUTPUT
            calc_chord_distribution = chord_distr; 
            
        case 'With_kinks'
            if (kink1 ~= kink2)
                
                % Calculation of a chord distribution with a convenient, simple function.
                % 
                % c(y) = calc_chord(Swing, taper_ratio, span, y)
                % A complete documentation of this function is included
                % inside the function
                chord_distr1 = calc_chord(S_wing, taper_ratio1, b_wing, half_span(1:ceil(N/3)));
                chord_distr2 = calc_chord(S_wing, taper_ratio2, b_wing, half_span(ceil((N/3)+1):ceil(2*N/3)));
                chord_distr3 = calc_chord(S_wing, taper_ratio3, b_wing, half_span(ceil((2*N/3)+1):ceil(N/3)));
                
                % STORE INSIDE A SINGLE VARIABLE
                chord_distr = [ chord_distr1; chord_distr2; chord_distr3 ];
                
                % OUTPUT
                calc_chord_distribution = chord_distr; 

            elseif (kink1 == kink2)
                
                % Calculation of a chord distribution with a convenient, simple function.
                % 
                % c(y) = calc_chord(Swing, taper_ratio, span, y)
                % A complete documentation of this function is included
                % inside the function
                chord_distr1 = calc_chord(S_wing, taper_ratio1, b_wing, half_span(1:ceil(N/2)));
                chord_distr2 = calc_chord(S_wing, taper_ratio2, b_wing, half_span(ceil((N/2)+1):N));
                
                % STORE INSIDE A SINGLE VARIABLE
                chord_distr = [ chord_distr1; chord_distr2 ];
                
                % OUTPUT
                calc_chord_distribution = chord_distr; 
                
            end
    end
end