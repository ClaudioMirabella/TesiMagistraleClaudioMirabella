function chord_distribution = calc_chord(Swing, taper_ratio, span, y)
    % c(y) = calc_chord(Swing, taper_ratio, span, y) 
    %    A simple chord distribution calculator. 
    %
    % INPUT
    %    Swing       --> Planform wing surface
    %    taper_ratio --> Wing taper ratio, defined as the ratio
    %                    Ctip/Croot
    %    span        --> Wing span 
    %    y           --> A vector along the span defined as follow:
    %                     * start: at the root; 
    %                     * end: at the tip; 
    %                     * n: station along the main wing span.
    % OUTPUT 
    %    c = c(y)    --> A chord distribution along the span

    Ref_surf           = 2*Swing;
    u                  = 1 - taper_ratio;
    v                  = 1 + taper_ratio; 
    chord_distribution = (Ref_surf/(v*span))*(1 - (u/span)*abs(2*y));
end