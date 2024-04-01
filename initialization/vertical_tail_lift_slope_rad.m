function a_vt_rad = vertical_tail_lift_slope_rad(AR_vt)

    % Vertical tail slope of the lift curve 
    %   INPUT 
    %   AR_vt    --> Vertical tail aspect ratio 
    %   OUTPUT 
    %   a_vt_rad --> Vertical tail lift curve slope in [1/rad]
    a_vt_rad = (2.0 * pi * AR_vt) / (2.0 + sqrt(AR_vt^2 + 4.0));

end