function W_wing = WingWeightUSAF(MTOW, nmax, AR, Sweep_angle, S_wing, ...
                                 taper_ratio, max_thickness_ratio, ... 
                                 max_level_speed_at_sealevel)
                             
% WingWeightUSAF Wing weight estimation method proposed by USAF
%
%   The following equation applies to light and utility type airplanes with
%   performance up to about 300 knots. 
%   
%   INPUT 
%   MTOW                        --> Max takeoff weight in [lb]
%   nmax                        --> Limit load factor
%   AR                          --> Wing aspect ratio 
%   Sweep_angle                 --> Wing quarter chord sweep angle
%   S_wing                      --> Wing area in [ft^2]
%   taper_ratio                 --> Wing taper ratio 
%   max_thickness_ratio         --> Maximum wing thickness ratio 
%   max_level_speed_at_sealevel --> Max level speed at sealeve in knots
%
%   OUTPUT
%   W_wing                     --> Wing weight 

MTOW_lb                           = MTOW * 2.20462;
S_wing_ft                         = S_wing * 10.7639;
max_level_speed_at_sealevel_knots = max_level_speed_at_sealevel * 1.94384;

a         = 96.948; 
c1        = 0.65; 
c2        = 0.57; 
c3        = 0.61; 
c4        = 0.36; 
c5        = 0.5;
c6        = 0.993;

W_wing = a * ( ((MTOW_lb * 1.25 * nmax * 1e-5)^c1) * ((AR/cos(Sweep_angle))^c2) * ...
    ((S_wing_ft * 1e-2)^c3) * (((1 + taper_ratio)/(2 * max_thickness_ratio))^c4) * ...
    ((1 + max_level_speed_at_sealevel_knots * 5e-2)^c5) )^c6;
W_wing = W_wing / 2.20462;
end

