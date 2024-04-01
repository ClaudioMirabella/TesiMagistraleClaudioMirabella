%% CHANGING DIRECTORY 
cd Output

% The 'dir' variable contains working directory path saved as a
% char value
dir = pwd;
% Store working directory inside the log file
fprintf('-----------------');
fprintf('\n');
fprintf('### Current directory ###');
fprintf('\n');
fprintf('%s\n', dir);

%% SUBPLOT
if n_Mass == 2 
        h1 = openfig('GustEnvelope1.fig','reuse'); % open figure
        ax1 = gca; % get handle to axes of figure

        h2 = openfig('GustEnvelope2.fig','reuse');
        ax2 = gca;

        % test1.fig and test2.fig are the names of the figure files which you would 
        % like to copy into multiple subplots
        h5 = figure; %create new figure

        s1 = subplot(2,2,1); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s2 = subplot(2,2,2);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        fig1 = get(ax1,'children'); %get handle to all the children in the figure
        fig2 = get(ax2,'children');
        copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig2,s2);
        close(h1);
        close(h2);
elseif n_Mass == 4 
        h1 = openfig('GustEnvelope1.fig','reuse'); % open figure
        ax1 = gca; % get handle to axes of figure

        h2 = openfig('GustEnvelope2.fig','reuse');
        ax2 = gca;

        h3 = openfig('GustEnvelope3.fig','reuse'); % open figure
        ax3 = gca; % get handle to axes of figure

        h4 = openfig('GustEnvelope4.fig','reuse');
        ax4 = gca;

        % test1.fig and test2.fig are the names of the figure files which you would 
        % like to copy into multiple subplots
        h5 = figure; %create new figure

        s1 = subplot(2,2,1); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s2 = subplot(2,2,2);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s3 = subplot(2,2,3); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s4 = subplot(2,2,4);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        fig1 = get(ax1,'children'); %get handle to all the children in the figure
        fig2 = get(ax2,'children');
        fig3 = get(ax3,'children'); %get handle to all the children in the figure
        fig4 = get(ax4,'children');
        copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig2,s2);
        copyobj(fig3,s3); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig4,s4);
        close(h1);
        close(h2);
        close(h3);
        close(h4);
elseif n_Mass == 6
        h1 = openfig('GustEnvelope1.fig','reuse'); % open figure
        ax1 = gca; % get handle to axes of figure

        h2 = openfig('GustEnvelope2.fig','reuse');
        ax2 = gca;

        h3 = openfig('GustEnvelope3.fig','reuse'); % open figure
        ax3 = gca; % get handle to axes of figure

        h4 = openfig('GustEnvelope4.fig','reuse');
        ax4 = gca;

        h5 = openfig('GustEnvelope5.fig','reuse'); % open figure
        ax5 = gca; % get handle to axes of figure

        h6 = openfig('GustEnvelope6.fig','reuse');
        ax6 = gca;

        % test1.fig and test2.fig are the names of the figure files which you would 
        % like to copy into multiple subplots
        h7 = figure; %create new figure

        s1 = subplot(2,2,1); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s2 = subplot(2,2,2);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s3 = subplot(2,2,3); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s4 = subplot(2,2,4);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s5 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s6 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        fig1 = get(ax1,'children'); %get handle to all the children in the figure
        fig2 = get(ax2,'children');
        fig3 = get(ax3,'children'); %get handle to all the children in the figure
        fig4 = get(ax4,'children');
        fig5 = get(ax5,'children'); %get handle to all the children in the figure
        fig6 = get(ax6,'children');
        copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig2,s2);
        copyobj(fig3,s3); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig4,s4);
        copyobj(fig5,s5); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig6,s6);
        close(h1);
        close(h2);
        close(h3);
        close(h4);
        close(h5);
        close(h6);
elseif n_Mass == 8
        h1 = openfig('GustEnvelope1.fig','reuse'); % open figure
        ax1 = gca; % get handle to axes of figure

        h2 = openfig('GustEnvelope2.fig','reuse');
        ax2 = gca;

        h3 = openfig('GustEnvelope3.fig','reuse'); % open figure
        ax3 = gca; % get handle to axes of figure

        h4 = openfig('GustEnvelope4.fig','reuse');
        ax4 = gca;

        h5 = openfig('GustEnvelope5.fig','reuse'); % open figure
        ax5 = gca; % get handle to axes of figure

        h6 = openfig('GustEnvelope6.fig','reuse');
        ax6 = gca;

        h7 = openfig('GustEnvelope7.fig','reuse'); % open figure
        ax7 = gca; % get handle to axes of figure

        h8 = openfig('GustEnvelope8.fig','reuse');
        ax8 = gca;

        % test1.fig and test2.fig are the names of the figure files which you would 
        % like to copy into multiple subplots
        h9 = figure; %create new figure

        s1 = subplot(2,2,1); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s2 = subplot(2,2,2);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s3 = subplot(2,2,3); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s4 = subplot(2,2,4);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s5 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s6 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s7 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s8 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        fig1 = get(ax1,'children'); %get handle to all the children in the figure
        fig2 = get(ax2,'children');
        fig3 = get(ax3,'children'); %get handle to all the children in the figure
        fig4 = get(ax4,'children');
        fig5 = get(ax5,'children'); %get handle to all the children in the figure
        fig6 = get(ax6,'children');
        fig7 = get(ax5,'children'); %get handle to all the children in the figure
        fig8 = get(ax6,'children');
        copyobj(fig1,s1); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig2,s2);
        copyobj(fig3,s3); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig4,s4);
        copyobj(fig5,s5); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig6,s6);
        copyobj(fig7,s7); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig8,s8);
        close(h1);
        close(h2);
        close(h3);
        close(h4);
        close(h5);
        close(h6);
        close(h7);
        close(h8);
elseif n_Mass == 10
        h1 = openfig('GustEnvelope1.fig','reuse'); % open figure
        ax1 = gca; % get handle to axes of figure

        h2 = openfig('GustEnvelope2.fig','reuse');
        ax2 = gca;

        h3 = openfig('GustEnvelope3.fig','reuse'); % open figure
        ax3 = gca; % get handle to axes of figure

        h4 = openfig('GustEnvelope4.fig','reuse');
        ax4 = gca;

        h5 = openfig('GustEnvelope5.fig','reuse'); % open figure
        ax5 = gca; % get handle to axes of figure

        h6 = openfig('GustEnvelope6.fig','reuse');
        ax6 = gca;

        h7 = openfig('GustEnvelope7.fig','reuse'); % open figure
        ax7 = gca; % get handle to axes of figure

        h8 = openfig('GustEnvelope8.fig','reuse');
        ax8 = gca;

        h9 = openfig('GustEnvelope9.fig','reuse'); % open figure
        ax9 = gca; % get handle to axes of figure

        h10 = openfig('GustEnvelope10.fig','reuse');
        ax10 = gca;

        % test1.fig and test2.fig are the names of the figure files which you would 
        % like to copy into multiple subplots
        h11 = figure; %create new figure

        s1 = subplot(2,2,1); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s2 = subplot(2,2,2);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s3 = subplot(2,2,3); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s4 = subplot(2,2,4);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s5 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s6 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s7 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s8 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s9 = subplot(2,2,5); %create and get handle to the subplot axes
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        s10 = subplot(2,2,6);
        grid on; grid minor;
        ylim padded 
        xlim padded
        xlabel("Airspeed - $V$ (m/s)", "Interpreter", "latex")
        ylabel("Load factor - $n$ (g's)", "Interpreter", "latex")
        title("V~-~n diagram", "Interpreter", "latex")

        fig1  = get(ax1,'children'); %get handle to all the children in the figure
        fig2  = get(ax2,'children');
        fig3  = get(ax3,'children'); %get handle to all the children in the figure
        fig4  = get(ax4,'children');
        fig5  = get(ax5,'children'); %get handle to all the children in the figure
        fig6  = get(ax6,'children');
        fig7  = get(ax5,'children'); %get handle to all the children in the figure
        fig8  = get(ax6,'children');
        fig9  = get(ax5,'children'); %get handle to all the children in the figure
        fig10 = get(ax6,'children');
        copyobj(fig1 , s1); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig2 , s2);
        copyobj(fig3 , s3); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig4 , s4);
        copyobj(fig5 , s5); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig6 , s6);
        copyobj(fig7 , s7); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig8 , s8);
        copyobj(fig9 , s9); %copy children to new parent axes i.e. the subplot axes
        copyobj(fig10,s10);
        close(h1);
        close(h2);
        close(h3);
        close(h4);
        close(h5);
        close(h6);
        close(h7);
        close(h8);
        close(h9);
        close(h10);
end

%% CHANGING DIRECTORY 
cd ..

% The 'dir' variable contains working directory path saved as a
% char value
dir = pwd;
% Store working directory inside the log file
fprintf('-----------------');
fprintf('\n');
fprintf('### Current directory ###');
fprintf('\n');
fprintf('%s\n', dir);

%% SAVING
% FIND FIGURE NUMBER
h_figure =  findobj('type','figure');
n_figure = h_figure(1,1).Number;

% SAVING AS A .FIG
name_figure = "GustenvelopeSubplots";
saveas(figure(n_figure), name_figure, 'fig');

% EXPORT FIGURE
exportgraphics(figure(n_figure), 'GustenvelopeSubplots.pdf', 'ContentType', 'vector')
exportgraphics(figure(n_figure), 'GustenvelopeSubplots.png', 'ContentType', 'vector')

% Moving file inside correct folder
movefile GustenvelopeSubplots.fig Output
movefile GustenvelopeSubplots.pdf Output
movefile GustenvelopeSubplots.png Output 
% -----------------------------------------------------------------