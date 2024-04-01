%TEMPLATE
function VerticalOut(Aircraft)

%% TEMPLATE Geometry Output function
% This function creates figures of 3-View of the fuselage and 3D Solid PLOT
% of the Aircraft based on here imported airfoils
%
% 1) Auxiliary variables are firstly defined
% 2) 2D plot -> 3-Views of aircraft drafting
% 3) 3D plot -> 3D PLOT of aircraft structure with imported airfoils

comp = 'Vertical';

if isfield(Aircraft.Geometry, "Vertical") == 1
    disp ([comp, 'exists'])
    disp ('-----------------------------------------------------------------')
    disp ('-----------------------------------------------------------------')
    disp ([comp, 'Geometry utilities end run'])
    
    %% Auxiliary declaration
    %fuselage
    df = Aircraft.Geometry.Fuselage.diameter.value;         % fuselage diameter (m)
    lf = Aircraft.Geometry.Fuselage.length.value;           % fuselage lenght (m)
    %horizontal
    hzpos = (Aircraft.Geometry.Horizontal.zloc.value - df/2*Aircraft.Geometry.Vertical.zloc.value  ) / Aircraft.Geometry.Vertical.b.value;   %horizontal root chord zeta position %of vtail span (poitive upward)
    Aircraft.Geometry.Horizontal.xle.value = Aircraft.Geometry.Horizontal.xloc.value/lf;      % % of lf
    xtip_le_h = Aircraft.Geometry.Horizontal.xle.value + ...
        Aircraft.Geometry.Horizontal.b.value/2*tan(Aircraft.Geometry.Horizontal.sweep.value/57.3)/lf;                                   % % of lf
    Aircraft.Geometry.Horizontal.xtip_le.value = xtip_le_h; % % of lf
    Aircraft.Geometry.Horizontal.ypos.value = Aircraft.Geometry.Horizontal.yloc.value/Aircraft.Geometry.Wing.b.value/2; % % of wing span
    
    %vertical
    sweep_v = Aircraft.Geometry.Vertical.sweep.value; %sweep angle in degree
    xloc_v  = Aircraft.Geometry.Vertical.xloc.value / lf;
    zloc_v  = Aircraft.Geometry.Vertical.zloc.value / ( df/2 );
    switch Aircraft.Geometry.Vertical.empennage_flag.value
        case 'Multiple fin'
            xle_v = xtip_le_h*lf;
            xtip_le_v = (xle_v + Aircraft.Geometry.Vertical.b.value*tan(sweep_v/57.3))/lf;
            yvloc = Aircraft.Geometry.Vertical.yloc.value; % to be modified
            zvloc = df/2 + hzpos*Aircraft.Geometry.Vertical.b.value; %in meters!
        case 'Double fin'
            xle_v = xtip_le_h*lf;
            xtip_le_v = (xle_v + Aircraft.Geometry.Vertical.b.value*tan(sweep_v/57.3))/lf;
            yvloc = Aircraft.Geometry.Vertical.yloc.value; % to be modified
            zvloc = df/2 + hzpos*Aircraft.Geometry.Vertical.b.value;
        case 'Single fin'
            xle_v = xloc_v*lf;
            xtip_le_v = (xle_v + Aircraft.Geometry.Vertical.b.value*tan(sweep_v/57.3))/lf;
            yvloc = Aircraft.Geometry.Vertical.yloc.value; %vtail in simmetry plane!
            zvloc = zloc_v*df/2;  % in meters
            disp ('aux 1')
    end
    
    root_coord_v = importdata('_Airfoil\Simmetric_Root.txt'); % Root Airfoil coordiante read from file (x/c & z/c)
    tip_coord_v = importdata('_Airfoil\Simmetric_Tip.txt'); % Root Airfoil coordiante read from file (x/c & z/c)
    
    
    %% TOP-VIEW
    figure('Name',[comp '-Top-View'],'NumberTitle','off');
    hold on
    
    root_coord = root_coord_v;
    tip_coord = tip_coord_v;
    
    switch Aircraft.Geometry.Vertical.empennage_flag.value
        case 'Multiple fin'
            plot([yvloc, yvloc], xtip_le_h*lf + ...
                [0, Aircraft.Geometry.Vertical.croot.value],'y',"LineWidth",2)
            plot([-yvloc, -yvloc], xtip_le_h*lf + ...
                [0, Aircraft.Geometry.Vertical.croot.value],'y',"LineWidth",2)
            %
            %x-root
            root_coord_3D(:,1) = root_coord(:,1).*Aircraft.Geometry.Vertical.croot.value +...
                xle_v;
            %y-root
            root_coord_3D(:,2) = yvloc + root_coord(:,2).*Aircraft.Geometry.Vertical.croot.value;
            %z-root
            root_coord_3D(:,3) =  zvloc;
            %x-tip
            tip_coord_3D(:,1) = tip_coord(:,1).*Aircraft.Geometry.Vertical.ctip.value +...
                xtip_le_v;
            %y-tip
            tip_coord_3D(:,2) = yvloc + tip_coord(:,2).*Aircraft.Geometry.Vertical.ctip.value;
            %z-tip
            tip_coord_3D(:,3) =  zvloc + Aircraft.Geometry.Vertical.b.value;
            
            plot(root_coord_3D(:,2),root_coord_3D(:,1),'y',"LineWidth",2)
            plot(tip_coord_3D(:,2),tip_coord_3D(:,1),'y',"LineWidth",2)
            plot(-root_coord_3D(:,2),root_coord_3D(:,1),'y',"LineWidth",2)
            plot(-tip_coord_3D(:,2),tip_coord_3D(:,1),'y',"LineWidth",2)
            
        case 'Double fin'
            plot([yvloc, yvloc], xtip_le_h*lf + ...
                [0, Aircraft.Geometry.Vertical.croot.value],'y',"LineWidth",2)
            plot([-yvloc, -yvloc], xtip_le_h*lf + ...
                [0, Aircraft.Geometry.Vertical.croot.value],'y',"LineWidth",2)
            %x-root
            root_coord_3D(:,1) = root_coord(:,1).*Aircraft.Geometry.Vertical.croot.value +...
                xtip_le_h.*lf; %same of htail tip (assumptions)
            %y-root
            root_coord_3D(:,2) = yvloc + root_coord(:,2).*Aircraft.Geometry.Vertical.croot.value;
            %z-root
            root_coord_3D(:,3) =  zvloc;
            %x-tip
            tip_coord_3D(:,1) = tip_coord(:,1).*Aircraft.Geometry.Vertical.ctip.value +...
                xtip_le_v.*lf;
            %y-tip
            tip_coord_3D(:,2) = yvloc + tip_coord(:,2).*Aircraft.Geometry.Vertical.ctip.value;
            %z-tip
            tip_coord_3D(:,3) =  zvloc + Aircraft.Geometry.Vertical.b.value;
            
            plot(root_coord_3D(:,2),root_coord_3D(:,1),'y',"LineWidth",2)
            plot(tip_coord_3D(:,2),tip_coord_3D(:,1),'y',"LineWidth",2)
             plot(-root_coord_3D(:,2),root_coord_3D(:,1),'y',"LineWidth",2)
            plot(-tip_coord_3D(:,2),tip_coord_3D(:,1),'y',"LineWidth",2)
            
        case 'Single fin'
            plot([yvloc, yvloc], Aircraft.Geometry.Vertical.xloc.value*lf + ...
                [0, Aircraft.Geometry.Vertical.croot.value],'y',"LineWidth",2)
            %x-root
            root_coord_3D(:,1) = root_coord(:,1).*Aircraft.Geometry.Vertical.croot.value +...
                xle_v;
            %y-root
            root_coord_3D(:,2) = yvloc + root_coord(:,2).*Aircraft.Geometry.Vertical.croot.value;
            %z-root
            root_coord_3D(:,3) =  zvloc;
            %x-tip
            tip_coord_3D(:,1) = tip_coord(:,1).*Aircraft.Geometry.Vertical.ctip.value +...
                xtip_le_v.*lf;
            %y-tip
            tip_coord_3D(:,2) = yvloc + tip_coord(:,2).*Aircraft.Geometry.Vertical.ctip.value;
            %z-tip
            tip_coord_3D(:,3) =  zvloc + Aircraft.Geometry.Vertical.b.value;
            
            plot(root_coord_3D(:,2),root_coord_3D(:,1),'y',"LineWidth",2)
            plot(tip_coord_3D(:,2),tip_coord_3D(:,1),'y',"LineWidth",2)
    end
    
    
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
    %vertical
    switch Aircraft.Geometry.Vertical.empennage_flag.value
        case 'Multiple fin'
            plot([xtip_le_h*lf, xtip_le_h*lf+Aircraft.Geometry.Vertical.croot.value],...
                [zvloc, zvloc],'y',"LineWidth",1.5)
            plot([xtip_le_v*lf, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc + Aircraft.Geometry.Vertical.b.value, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xtip_le_h*lf, xtip_le_v*lf],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xtip_le_h*lf+Aircraft.Geometry.Vertical.croot.value, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
        case 'Double fin'
            plot([xtip_le_h*lf, xtip_le_h*lf+Aircraft.Geometry.Vertical.croot.value],...
                [zvloc, zvloc],'y',"LineWidth",1.5)
            plot([xtip_le_v*lf, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc + Aircraft.Geometry.Vertical.b.value, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xtip_le_h*lf, xtip_le_v*lf],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xtip_le_h*lf+Aircraft.Geometry.Vertical.croot.value, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
        case 'Single fin'
            plot([xle_v, xle_v+Aircraft.Geometry.Vertical.croot.value],...
                [zvloc, zvloc],'y',"LineWidth",1.5)
            plot([xtip_le_v*lf, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc + Aircraft.Geometry.Vertical.b.value, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xle_v, xtip_le_v*lf],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([xle_v+Aircraft.Geometry.Vertical.croot.value, xtip_le_v*lf+Aircraft.Geometry.Vertical.ctip.value],...
                [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
    end
    
    
    %RUDDER
    %linear chord law
    c0 = Aircraft.Geometry.Vertical.croot.value;          % root chord (unit)
    c1 = Aircraft.Geometry.Vertical.ctip.value;           % tip chord (unit)
    span0 = 0.0;
    span1 = Aircraft.Geometry.Vertical.b.value;
    [c_0,c_y] = chord_linear(c0 ,c1, span0, span1);
    %
    y_inner = Aircraft.Geometry.Rudder.eta_inner.value * span1;
    y_outer = Aircraft.Geometry.Rudder.eta_outer.value * span1;
    %
    c_inner = c_0 - c_y * y_inner;                      %vtail chord at inner station (unit)
    c_outer = c_0 - c_y * y_outer;                      %vtail chord at inner station (unit)
    %
    cf_inner = c_inner * Aircraft.Geometry.Rudder.cf_c_inner.value;   %rudder chord at inner station (unit)
    cf_outer = c_outer * Aircraft.Geometry.Rudder.cf_c_outer.value;     %rudder chord at inner station (unit)
    %
    xle_inner = xle_v +  y_inner * tan(sweep_v/57.3) + (c_inner - cf_inner);
    xle_outer = xle_v +  y_outer * tan(sweep_v/57.3) + (c_outer - cf_outer);
    %

    plot([xle_inner  xle_inner+cf_inner],...
        zvloc + [y_inner y_inner],'y',"LineWidth",1.5)
    plot([xle_outer xle_outer+cf_outer],...
        zvloc + [y_outer y_outer],'y',"LineWidth",1.5)
    plot([xle_inner xle_outer],...
        zvloc + [y_inner y_outer],'y',"LineWidth",1.5)
    
    fill ([xle_inner xle_outer xle_outer+cf_outer xle_inner+cf_inner],...
        [zvloc + y_inner  zvloc + y_outer...
        zvloc + y_outer  zvloc + y_inner],'y')
    
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
    switch Aircraft.Geometry.Vertical.empennage_flag.value
        case 'Multiple fin'
            plot([yvloc yvloc], [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([-yvloc -yvloc], [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
        case 'Double fin'
            plot([yvloc yvloc], [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
            plot([-yvloc -yvloc], [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
        case 'Single fin'
            plot([yvloc yvloc], [zvloc, zvloc + Aircraft.Geometry.Vertical.b.value],'y',"LineWidth",1.5)
    end
    
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
    switch Aircraft.Geometry.Vertical.empennage_flag.value
        case 'Multiple fin'
            
            XXv = [root_coord_3D(:,1), tip_coord_3D(:,1)]';
            YYv = [root_coord_3D(:,2), tip_coord_3D(:,2)]';
            ZZv = [root_coord_3D(:,3), tip_coord_3D(:,3)]';
            
            surf(XXv,YYv,ZZv,'FaceColor','yellow','EdgeColor','none')
            surf(XXv,-YYv,ZZv,'FaceColor','yellow','EdgeColor','none')
            
        case 'Double fin'
            
            XXv = [root_coord_3D(:,1), tip_coord_3D(:,1)]';
            YYv = [root_coord_3D(:,2), tip_coord_3D(:,2)]';
            ZZv = [root_coord_3D(:,3), tip_coord_3D(:,3)]';
            
            surf(XXv,YYv,ZZv,'FaceColor','yellow','EdgeColor','none')
            surf(XXv,-YYv,ZZv,'FaceColor','yellow','EdgeColor','none')
            
        case 'Single fin'
            
            XXv = [root_coord_3D(:,1), tip_coord_3D(:,1)]';
            YYv = [root_coord_3D(:,2), tip_coord_3D(:,2)]';
            ZZv = [root_coord_3D(:,3), tip_coord_3D(:,3)]';
            
            surf(XXv,YYv,ZZv,'FaceColor','yellow','EdgeColor','none')           
    end
    
    daspect([1.0 , 1.0, 1.0])
    camlight left; lighting phong
    
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
    
    else
    disp (strcat(comp,' component does not exist!'))
    disp ('-----------------------------------------------------------------')
    disp ('-----------------------------------------------------------------')
    disp ([comp, 'Geometry utilities end run'])
    
    
    
end 