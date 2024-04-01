function [DynPressUnsymm, cm_unsymm, MdistrFull, MdistrSeventyPercent, ...
          TorsionFull, TorsionSeventyPercent] = UnsymmetricalTorsionAileron(obj2, delta_aileron, y_in, y_fin, q, cm, half_span, chord_distr, V_ratio, Point, tol)

    %UNTITLED Summary of this function goes here
    %   Detailed explanation goes here
    
    % ---------------------------------------------------------------------------    
    % POINT A CALCULATIONS - UNSYMMETRICAL TORSION    
    % ---------------------------------------------------------------------------    
    if contains(Point, 'A') == 1
        DynPressUnsymm = q * delta_aileron;
        cm_unsymm      = zeros(length(half_span),1);

        for i = 1:length(half_span)
            cm_unsymm(i) = cm(i);
            if (abs(half_span(i) - y_in) < tol) && (abs(half_span(i) - y_fin) > tol)  
                j = i;
            end
        end
        for i = 1:length(half_span')
            if (abs(half_span(i) - y_fin) < tol) && (abs(half_span(i) - y_in) > tol)
                k = i;
            end
        end
        for z = j:k 
            cm_unsymm(z) = cm(z) - 0.01 * delta_aileron;
        end 

        MdistrFull           = zeros(length(half_span), 1);
        MdistrSeventyPercent = zeros(length(half_span), 1);
        for i = 1:length(half_span)
            MdistrFull(i)           = cm_unsymm(i) * q *((chord_distr(i))^2);
            MdistrSeventyPercent(i) = 0.7 * MdistrFull(i);
        end
        TorsionFull           = calc_tors_mom(obj2, half_span, flip(MdistrFull))*(1e-1);
        TorsionSeventyPercent = calc_tors_mom(obj2, half_span, flip(MdistrSeventyPercent))*(1e-1);
    % ---------------------------------------------------------------------------    
    % POINT C AND D CALCULATIONS - UNSYMMETRICAL TORSION    
    % ---------------------------------------------------------------------------    
    elseif contains(Point, 'C') == 1 || contains(Point, 'D') == 1
        delta_aileron  = V_ratio * delta_aileron;
        DynPressUnsymm = q * delta_aileron;
        cm_unsymm      = zeros(length(half_span),1);

        for i = 1:length(half_span)
            cm_unsymm(i) = cm(i);
            if (abs(half_span(i) - y_in) < tol) && (abs(half_span(i) - y_fin) > tol)  
                j = i;
            end
        end
        for i = 1:length(half_span')
            if (abs(half_span(i) - y_fin) < tol) && (abs(half_span(i) - y_in) > tol)
                k = i;
            end
        end
        for z = j:k 
            cm_unsymm(z) = cm(z) - 0.01 * delta_aileron;
        end 

        MdistrFull           = zeros(length(half_span), 1);
        MdistrSeventyPercent = zeros(length(half_span), 1);
        for i = 1:length(half_span)
            MdistrFull(i)           = cm_unsymm(i) * q *((chord_distr(i))^2);
            MdistrSeventyPercent(i) = 0.7 * MdistrFull(i);
        end
        TorsionFull           = calc_tors_mom(obj2, half_span, flip(MdistrFull))*(1e-1);
        TorsionSeventyPercent = calc_tors_mom(obj2, half_span, flip(MdistrSeventyPercent))*(1e-1);
    end

end

