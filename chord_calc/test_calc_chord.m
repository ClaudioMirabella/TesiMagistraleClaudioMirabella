
%% WING CHORD DISTRIBUTION CALCULATION 
%  In this script, a function to evaluate chord distribution and
%  corresponding semi-span wing stations.

switch(Aircraft.Certification.Attributes.airload_case.value) 
    case 'OpenVSP'
        %% MAIN WING
        b_wing         = Aircraft.Geometry.Wing.b.value;
        S_wing         = Aircraft.Geometry.Wing.S.value;
        if isfield(Aircraft.OpenVSP.output, 'Cl') == 1
            cl             = Aircraft.OpenVSP.output.Cl.value(:,1);
            N              = length(cl);
        elseif isfield(Aircraft.OpenVSP.output, 'Cl') == 0
            N              = Aircraft.OpenVSP.input.openvsp_total_tess.value;
        end
        croot          = Aircraft.Geometry.Wing.croot.value;
        ctip           = Aircraft.Geometry.Wing.ctip.value; 
        chord_kink_one = Aircraft.Geometry.Wing.chord_kink_one.value;
        chord_kink_two = Aircraft.Geometry.Wing.chord_kink_two.value;
        wing_type_flag = Aircraft.Geometry.Wing.type.value;
        taper_ratio1   = Aircraft.Geometry.Wing.taper_ratio_panel1.value;
        taper_ratio2   = Aircraft.Geometry.Wing.taper_ratio_panel2.value;
        taper_ratio3   = Aircraft.Geometry.Wing.taper_ratio_panel3.value;

        [Aircraft.Geometry.Wing.chord_distribution.value, Aircraft.Geometry.Wing.half_span_stations.value] = c_calc(b_wing, S_wing, N, ...
                                                                                          croot, ctip, chord_kink_one, chord_kink_two, ...
                                                                                          wing_type_flag, taper_ratio1, taper_ratio2, ...
                                                                                          taper_ratio3); 
        Aircraft.Geometry.Wing.chord_distribution.Attributes.unit = "m";
        Aircraft.Geometry.Wing.chord_distribution.Attributes.flag = "Along the wing semi-span";
        Aircraft.Geometry.Wing.half_span_stations.Attributes.unit = "m";
        Aircraft.Geometry.Wing.half_span_stations.Attributes.flag = "Along the wing semi-span";

        %% HORIZONTAL TAIL PLANE
        ht_S           = Aircraft.Geometry.Horizontal.S.value;
        ht_taper_ratio = Aircraft.Geometry.Horizontal.taper_ratio.value;
        ht_span        = Aircraft.Geometry.Horizontal.b.value; 
        ht_y           = linspace(0, 0.5*ht_span, N)';

        Aircraft.Geometry.Horizontal.half_span_stations.value           = ht_y; 
        Aircraft.Geometry.Horizontal.half_span_stations.Attributes.unit = "m";

        Aircraft.Geometry.Horizontal.eta_stations.value           = ( ht_y ) / ( 0.5*ht_span ); 
        Aircraft.Geometry.Horizontal.eta_stations.Attributes.unit = "Non dimensional";

        Aircraft.Geometry.Horizontal.chord_distribution.value           = calc_chord(ht_S, ht_taper_ratio, ht_span, ht_y);
        Aircraft.Geometry.Horizontal.chord_distribution.Attributes.unit = "m";
        Aircraft.Geometry.Horizontal.chord_distribution.Attributes.flag = "Along the horizontal tail plane semi-span";

        % HORIZONTAL TAIL - MEAN AERODYNAMIC CHORD 
        % FORMULA: 
        %           2       /               \
        % M.A.C. = --- * Int| ( c(y) )^2 dy |
        %           S       \               /

        ht_chord_distribution         = Aircraft.Geometry.Horizontal.chord_distribution.value;
        ht_chord_distribution_squared = ht_chord_distribution.^2; 
        ht_MAC                        = ( 2 / ht_S ) * trapz(ht_y, ht_chord_distribution_squared);
        Aircraft.Geometry.Horizontal.MAC.value           = ht_MAC; 
        Aircraft.Geometry.Horizontal.MAC.Attributes.unit = "m";

        %% VERTICAL TAIL PLANE
        vt_S           = Aircraft.Geometry.Vertical.S.value;
        vt_taper_ratio = Aircraft.Geometry.Vertical.taper_ratio.value;
        vt_span        = Aircraft.Geometry.Vertical.b.value; 
        vt_y           = linspace(0, vt_span, N)';

        Aircraft.Geometry.Vertical.half_span_stations.value           = vt_y; 
        Aircraft.Geometry.Vertical.half_span_stations.Attributes.unit = "m";

        Aircraft.Geometry.Vertical.eta_stations.value           = vt_y / vt_span; 
        Aircraft.Geometry.Vertical.eta_stations.Attributes.unit = "Non dimensional";

        Aircraft.Geometry.Vertical.chord_distribution.value           = calc_chord(vt_S, vt_taper_ratio, vt_span, vt_y);
        Aircraft.Geometry.Vertical.chord_distribution.Attributes.unit = "m";

        % VERTICAL TAIL - MEAN AERODYNAMIC CHORD 
        %           2       /               \
        % M.A.C. = --- * Int| ( c(y) )^2 dy |
        %           S       \               /

        vt_chord_distribution         = Aircraft.Geometry.Vertical.chord_distribution.value;
        vt_chord_distribution_squared = vt_chord_distribution.^2; 
        vt_MAC                        = ( 2 / vt_S ) * trapz(vt_y, vt_chord_distribution_squared);
        Aircraft.Geometry.Vertical.MAC.value           = vt_MAC; 
        Aircraft.Geometry.Vertical.MAC.Attributes.unit = "m";

    case 'Schrenk'
        %% MAIN WING
        b_wing         = Aircraft.Geometry.Wing.b.value;
        S_wing         = Aircraft.Geometry.Wing.S.value;
        N              = Aircraft.OpenVSP.input.openvsp_total_tess.value;
        croot          = Aircraft.Geometry.Wing.croot.value;
        ctip           = Aircraft.Geometry.Wing.ctip.value; 
        chord_kink_one = Aircraft.Geometry.Wing.chord_kink_one.value;
        chord_kink_two = Aircraft.Geometry.Wing.chord_kink_two.value;
        wing_type_flag = Aircraft.Geometry.Wing.type.value;
        taper_ratio1   = Aircraft.Geometry.Wing.taper_ratio_panel1.value;
        taper_ratio2   = Aircraft.Geometry.Wing.taper_ratio_panel2.value;
        taper_ratio3   = Aircraft.Geometry.Wing.taper_ratio_panel3.value;

        [Aircraft.Geometry.Wing.chord_distribution.value, Aircraft.Geometry.Wing.half_span_stations.value] = c_calc(b_wing, S_wing, N, ...
                                                                                          croot, ctip, chord_kink_one, chord_kink_two, ...
                                                                                          wing_type_flag, taper_ratio1, taper_ratio2, ...
                                                                                          taper_ratio3); 
        Aircraft.Geometry.Wing.chord_distribution.Attributes.unit = "m";
        Aircraft.Geometry.Wing.chord_distribution.Attributes.flag = "Along the wing semi-span";
        Aircraft.Geometry.Wing.half_span_stations.Attributes.unit = "m";
        Aircraft.Geometry.Wing.half_span_stations.Attributes.flag = "Along the wing semi-span";
        
        % Wing Mean Aerodynamic chord
        if isfield(Aircraft.Geometry.Wing, 'MAC') == 0
            wing_y                                           = Aircraft.Geometry.Wing.half_span_stations.value;
            wing_chord_distribution                          = Aircraft.Geometry.Wing.chord_distribution.value;
            wing_chord_distribution_squared                  = wing_chord_distribution.^2; 
            wing_MAC                                         = ( 2 / S_wing ) * trapz(wing_y, wing_chord_distribution_squared);
            Aircraft.Geometry.Wing.MAC.value                 = wing_MAC; 
            Aircraft.Geometry.Wing.MAC.Attributes.unit       = "m";
        end

        %% HORIZONTAL TAIL PLANE
        ht_S           = Aircraft.Geometry.Horizontal.S.value;
        ht_taper_ratio = Aircraft.Geometry.Horizontal.taper_ratio.value;
        ht_span        = Aircraft.Geometry.Horizontal.b.value; 
        ht_y           = linspace(0, 0.5*ht_span, N)';

        Aircraft.Geometry.Horizontal.half_span_stations.value           = ht_y; 
        Aircraft.Geometry.Horizontal.half_span_stations.Attributes.unit = "m";

        Aircraft.Geometry.Horizontal.eta_stations.value           = ( ht_y ) / ( 0.5*ht_span ); 
        Aircraft.Geometry.Horizontal.eta_stations.Attributes.unit = "Non dimensional";

        Aircraft.Geometry.Horizontal.chord_distribution.value           = calc_chord(ht_S, ht_taper_ratio, ht_span, ht_y);
        Aircraft.Geometry.Horizontal.chord_distribution.Attributes.unit = "m";
        Aircraft.Geometry.Horizontal.chord_distribution.Attributes.flag = "Along the horizontal tail plane semi-span";

        % HORIZONTAL TAIL - MEAN AERODYNAMIC CHORD 
        % FORMULA: 
        %           2       /               \
        % M.A.C. = --- * Int| ( c(y) )^2 dy |
        %           S       \               /
       
        ht_chord_distribution         = Aircraft.Geometry.Horizontal.chord_distribution.value;
        ht_chord_distribution_squared = ht_chord_distribution.^2; 
        ht_MAC                        = ( 2 / ht_S ) * trapz(ht_y, ht_chord_distribution_squared);
        Aircraft.Geometry.Horizontal.MAC.value           = ht_MAC; 
        Aircraft.Geometry.Horizontal.MAC.Attributes.unit = "m";

        %% VERTICAL TAIL PLANE
        vt_S           = Aircraft.Geometry.Vertical.S.value;
        vt_taper_ratio = Aircraft.Geometry.Vertical.taper_ratio.value;
        vt_span        = Aircraft.Geometry.Vertical.b.value; 
        vt_y           = linspace(0, vt_span, N)';

        Aircraft.Geometry.Vertical.half_span_stations.value           = vt_y; 
        Aircraft.Geometry.Vertical.half_span_stations.Attributes.unit = "m";

        Aircraft.Geometry.Vertical.eta_stations.value           = vt_y / vt_span; 
        Aircraft.Geometry.Vertical.eta_stations.Attributes.unit = "Non dimensional";

        Aircraft.Geometry.Vertical.chord_distribution.value           = calc_chord(vt_S, vt_taper_ratio, vt_span, vt_y);
        Aircraft.Geometry.Vertical.chord_distribution.Attributes.unit = "m";
        Aircraft.Geometry.Vertical.chord_distribution.Attributes.flag = "Along the horizontal tail plane semi-span";

        % VERTICAL TAIL - MEAN AERODYNAMIC CHORD 
        %           2       /               \
        % M.A.C. = --- * Int| ( c(y) )^2 dy |
        %           S       \               /

        vt_chord_distribution         = Aircraft.Geometry.Vertical.chord_distribution.value;
        vt_chord_distribution_squared = vt_chord_distribution.^2; 
        vt_MAC                        = ( 2 / vt_S ) * trapz(vt_y, vt_chord_distribution_squared);
        Aircraft.Geometry.Vertical.MAC.value           = vt_MAC; 
        Aircraft.Geometry.Vertical.MAC.Attributes.unit = "m";
        
    case 'Other'
        disp("Not available.")
        return
end

