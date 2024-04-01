function OutputArg1 = cl_interpolation_graph(Cl, Cl_interp, XI, YI)

% function OutputArg1 = cl_interpolation_graph(Cl_interp, XI, YI)

% Output = cd_interpolation_graph(x, y, Cd, Cd_interp, XI, YI)
%   A function which is able to plot a 3-dimensional interpolation of
%   values of pitching moment coefficient distributions along the span.
%
%   To illustrate the results of the 3-dimensional interpolation a carpet
%   plot of interpolated values is implemented in this function. 
%
%   INPUT
%   x         --> Point along x-axis of the meshgrid; it must be remembered
%                 that the total number of elements along x inside the
%                 vector is related to the number of subdivisions adopted
%                 with OPEN VSP.
%   y         --> Point along y-axis of the meshgrid; it must be remembered
%                 that y values corresponds to angle of attack at whic the
%                 coefficient is evaluated.
%   Cl        --> Cl = Cl(y) obtained from OPEN VSP; remember that these
%                 values are referred to the wing semi-span.
%   Cl_interp --> Interpolated lift coefficients, from interp2
%                 MATLAB function.
%   XI        --> Point at which the interpolations are performed along the
%                 x direction; in this particular case, for convenience, XI
%                 will have the same number of elements.
%   YI        --> Point at which the interpolations are performed along the
%                 y direction; in this case YI will have a greater number
%                 of elements to cover more angle of attack.
%
%   OUTPUT
%   Carpet plot of drag coefficients.

OutputArg1 = figure;
plot3(XI(:,1), YI(:,1), Cl(:,1), '-b.', 'MarkerSize', 1, 'LineWidth', 2)
hold on
% 
    for i = 2:length(YI(1,:))
        plot3(XI(:,i), YI(:,i), Cl(:,i), '-b.', 'LineWidth', 2)
    end
 
grid on 
mesh(XI, YI, Cl_interp, 'FaceAlpha', '0.15')

% Axis and title
xlabel("Spanwise points", "Interpreter", "latex")
ylabel("Alpha - $\alpha$", "Interpreter", "latex")
zlabel("$C_l = C_l(y)$", "Interpreter", "latex")
title("Interpolation of the Cl values", "Interpreter", "latex") % Applied regulation from 'Aircraft' struct

end

