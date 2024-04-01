%TEMPLATE
function LandingGearOut(Aircraft)

%% TEMPLATE Geometry Output function
% This function creates figures of 3-View of the fuselage and 3D Solid PLOT
% of the Aircraft based on here imported airfoils
%
% 1) Auxiliary variables are firstly defined
% 2) 2D plot -> 3-Views of aircraft drafting
% 3) 3D plot -> 3D PLOT of aircraft structure with imported airfoils

comp = 'LandingGear';

if isfield(Aircraft.Geometry, "LandingGear") == 1
    disp ([comp, 'exists'])
    disp ('-----------------------------------------------------------------')
    disp ('-----------------------------------------------------------------')
    disp ([comp, 'Geometry utilities end run'])
    
% if isfield(Aircraft.Geometry, "LandingGear") == 1
%     disp ([comp, 'exists'])
%     disp ('-----------------------------------------------------------------')
%     disp ('-----------------------------------------------------------------')
%     disp ([comp, 'Geometry utilities end run'])

%% Auxiliary declaration
%fuselage
df = Aircraft.Geometry.Fuselage.diameter.value;         % fuselage diameter (m)
%     dbase = 0.1*df;                                         %fuselage base diameter
lf = Aircraft.Geometry.Fuselage.length.value;           % fuselage lenght (m)
%     Aircraft.Geometry.Fuselage.kcockpit.value = 1.0;
%     Aircraft.Geometry.Fuselage.ktail.value = 1.5;
%wing
zpos = Aircraft.Geometry.Wing.zle.value;                                    % wing root chord zeta position (unit)
xle = Aircraft.Geometry.Wing.xle.value/lf;                                  % wing tip leading edge %of fuselage lenght

%landing gear
%main gear
% Aircraft.Geometry.Undercarriage.Main.x.value = 0.6*lf;  % fraction of fuselage lenght MAIN LG
% Aircraft.Geometry.Undercarriage.Main.y.value = 1.1*df; % fraction of diameter MAIN LG
% Aircraft.Geometry.Undercarriage.Main.z.value = -1.1*df; % fraction of diameter MAIN LG
% %nose gear
% Aircraft.Geometry.Undercarriage.Nose.x.value = 0.1*lf;          % fraction of fuselage lenght NOSE LG   
% Aircraft.Geometry.Undercarriage.Nose.y.value = 0.0*df; % fraction of diameter NOSE LG
% Aircraft.Geometry.Undercarriage.Nose.z.value = -1.1*df; % fraction of diameter NOSE LG
% %wheel
% Aircraft.Geometry.Undercarriage.Main.diameter.value = 0.3; %m
% Aircraft.Geometry.Undercarriage.Nose.diameter.value = 0.3; %m
% Aircraft.Geometry.Undercarriage.wheel_width.value = 0.1*df;


x_main_lg = Aircraft.Geometry.Undercarriage.Main.x.value;
y_main_lg = Aircraft.Geometry.Undercarriage.Main.y.value;
z_main_lg = Aircraft.Geometry.Undercarriage.Main.z.value;

x_nose_lg = Aircraft.Geometry.Undercarriage.Nose.x.value;
y_nose_lg = Aircraft.Geometry.Undercarriage.Nose.y.value;
z_nose_lg = Aircraft.Geometry.Undercarriage.Nose.z.value;

d_wheel_main = Aircraft.Geometry.Undercarriage.Main.diameter.value;
d_wheel_nose = Aircraft.Geometry.Undercarriage.Nose.diameter.value;

wheel_width = Aircraft.Geometry.Undercarriage.wheel_width.value; % main gear wheel width (m)

%% TOP-VIEW
figure('Name',[comp '-Top-View'],'NumberTitle','off');
hold on

grid on
title([comp 'Top-View'])
xlabel({'y (m)'})
ylabel({'x (m)'})
axis equal

saveas(gcf, [comp '-Top-View.fig'])
saveas(gcf, [comp '-Top-View.png'])


%% SIDE-VIEW
figure('Name',[comp '-Side-View'],'NumberTitle','off');
hold on

%LANDING GEAR
teta = linspace (0,360,100);

x = x_main_lg  + ...
    d_wheel_main/2.* cos(teta/57.3);
z = z_main_lg + d_wheel_main/2 +...
    d_wheel_main/2.* sin(teta/57.3);
plot(x,z,'k','LineWidth',2)

x = x_nose_lg  + ...
    d_wheel_nose/2.* cos(teta/57.3);
z = z_nose_lg + d_wheel_nose/2 +...
    d_wheel_nose/2.* sin(teta/57.3);
plot(x,z,'k','LineWidth',2)

grid on
title([comp 'Side-View'])
xlabel({'y (m)'})
ylabel({'x (m)'})
axis equal

saveas(gcf, [comp '-Side-View.fig'])
saveas(gcf, [comp '-Side-View.png'])


%%
figure('Name',[comp '-Front-View'],'NumberTitle','off');
hold on

%undercarriage
%main
plot ([y_main_lg y_main_lg], [z_main_lg (z_main_lg+d_wheel_main)],'k',"LineWidth",2)
plot ([y_main_lg-wheel_width y_main_lg-wheel_width], [z_main_lg (z_main_lg+d_wheel_main)],'k',"LineWidth",2)

plot ([-y_main_lg -y_main_lg], [z_main_lg (z_main_lg+d_wheel_main)],'k',"LineWidth",2)
plot ([-y_main_lg+wheel_width -y_main_lg+wheel_width], [z_main_lg (z_main_lg+d_wheel_main)],'k',"LineWidth",2)
%nose
plot ([y_nose_lg-0.5*wheel_width y_nose_lg-0.5*wheel_width], [z_nose_lg (z_nose_lg+d_wheel_nose)],'k',"LineWidth",2)
plot ([y_nose_lg+0.5*wheel_width y_nose_lg+0.5*wheel_width], [z_nose_lg (z_nose_lg+d_wheel_nose)],'k',"LineWidth",2)

grid on
title([comp 'Front-View'])
xlabel({'y (m)'})
ylabel({'x (m)'})
axis equal

saveas(gcf, [comp '-Front-View.fig'])
saveas(gcf, [comp '-Front-View.png'])


%% 3D
figure('Name',[comp '3D'],'NumberTitle','off');
hold on 
points = 100;
%main
nlgsection = 2; % Number of engine sections; 

    Xlg = ones (nlgsection,points);
    Ylg = ones (nlgsection,points);
    Zlg = ones (nlgsection,points);

    ymin = y_main_lg - wheel_width;
    ymax = y_main_lg;
    
    for i=1:nlgsection
        
        if i == 1
            Ylg(i,1:end) = ymin;
        end
        
        if i == nlgsection
            Ylg(i,1:end) = ymax;
        end
        secdiameter = Aircraft.Geometry.Undercarriage.Main.diameter.value;
        x = secdiameter / 2* cos(teta/57.3);
        z = secdiameter / 2* sin(teta/57.3);
        Xlg(i,1:end) = x+x_main_lg;
        Zlg(i,1:end) = z+z_main_lg + d_wheel_main/2;
        
    end

surf(Xlg,Ylg,Zlg,'FaceColor','black','EdgeColor','none')
surf(Xlg,-Ylg,Zlg,'FaceColor','black','EdgeColor','none')

%nose
nlgsection = 2; % Number of engine sections; 

    Xnlg = ones (nlgsection,points);
    Ynlg = ones (nlgsection,points);
    Znlg = ones (nlgsection,points);

    ymin = y_nose_lg - wheel_width/2;
    ymax = y_nose_lg + wheel_width/2;
    
    for i=1:nlgsection
        
        if i == 1
            Ynlg(i,1:end) = ymin;
        end
        
        if i == nlgsection
            Ynlg(i,1:end) = ymax;
        end
        secdiameter = Aircraft.Geometry.Undercarriage.Nose.diameter.value;
        x = secdiameter / 2* cos(teta/57.3);
        z = secdiameter / 2* sin(teta/57.3);
        Xnlg(i,1:end) = x+x_nose_lg;
        Znlg(i,1:end) = z+z_nose_lg + d_wheel_nose/2;
        
    end

surf(Xnlg,Ynlg,Znlg,'FaceColor','black','EdgeColor','none')
surf(Xnlg,-Ynlg,Znlg,'FaceColor','black','EdgeColor','none')

grid on
title([comp '3D'])
xlabel({'y (m)'})
ylabel({'x (m)'})
axis equal

saveas(gcf, [comp '3D.fig'])
saveas(gcf, [comp '3D.png'])
%%
%% moving results
movefile([comp '-Top-View.fig'], Aircraft.res_dir);
movefile([comp '-Top-View.png'], Aircraft.res_dir);
movefile([comp '-Side-View.fig'], Aircraft.res_dir);
movefile([comp '-Side-View.png'], Aircraft.res_dir);
movefile([comp '-Front-View.fig'], Aircraft.res_dir);
movefile([comp '-Front-View.png'], Aircraft.res_dir);
movefile([comp '3D.fig'], Aircraft.res_dir);
movefile([comp '3D.png'], Aircraft.res_dir);


%     else
%     disp (strcat(comp,' component does not exist!'))
%     disp ('-----------------------------------------------------------------')
%     disp ('-----------------------------------------------------------------')
%     disp ([comp, 'Geometry utilities end run'])
%

end
end