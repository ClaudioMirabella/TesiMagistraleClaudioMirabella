clear all; close all; clc;
%% COMMENTO INIZIALE
%  Prova del 18/07/2021 -- Implementazione della corretta variabile
%  struttura 'Aircraft', come velivolo di prova è stato selezionato un
%  sistema unmanned da certificare sotto la norma CS-VLA.

%% Checking log file existence
% Log command window output. Avoid appending data to existing file.
if exist('CMFlightLoads.txt','file')
    diary OFF
    delete CMFlightLoads.txt
end
diary CMFlightLoads.txt

%% STORING THE WORKING DIRECTORY 
dir = pwd;
fprintf("--------------------------------------");
fprintf('\n');
fprintf("### Working directory ###"); 
fprintf('\n');
fprintf('%s\n', dir);
fprintf("--------------------------------------");
fprintf('\n\n');
%% DEFINING A GLOBAL VARIABLE AIRCRAFT
global Aircraft
% Printing on screen the correct output
fprintf("--------------------------------------");
fprintf('\n');
fprintf("--------------------------------------");
fprintf('\n');
fprintf("### Aircraft Flight Loads ###");
fprintf('\n');
fprintf("--------------------------------------");
fprintf('\n');
fprintf("--------------------------------------");
fprintf('\n');
fprintf('\n');
%% Input specification - TLAR
InputSource = "From File"; 
% "From File"
% "Custom"
%do not edit
% filename = 'Aircraft_test'; %do not edit
% filename = 'drone_vla';     %do not edit
filename = 'Tecnam_P92';  %do not edit

%% INIZIALIZATION OF AircraftSTRUCT VARIABLE (Just the minimal values)
cd initialization 
% The 'dir' variable contains working directory path saved as a
% char value
dir = pwd;
% Store working directory inside the log file
fprintf('-----------------');
fprintf('\n');
fprintf('### Current directory ###');
fprintf('\n');
fprintf('%s\n', dir);
% Aircraft = FlightLoadsInitialize();
fprintf('\n');
fprintf('Certification used from file.');
% Aircraft = FromFileCertification_fun(Aircraft,filename);
Aircraft = FromFileCertification_function(Aircraft,filename);
fprintf('\n');
pause(5/1000);

switch(Aircraft.Certification.Attributes.airload_case.value) 
    
    case 'Schrenk'

        %% CHORD CALCULATION 
        cd ..
        cd chord_calc 
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);
        pause(5/1000);
        % Chord calculation main program
        test_calc_chord 

        %% AERODYNAMIC MODEL
        cd ..
        cd calc_aero_model
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);

        % SCRIPT TO EVALUATE AERODYNAMIC QUANTITIES 
        CalcAeroModel
        pause(5/1000);
        
        %% SCHRENK METHOD 
        cd .. 
        cd schrenk
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);
        pause(5/1000);
        % Schrenk method 
        CalcSchrenkLoad

        %% Pause
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
        pause(5/1000);    
    
    case 'OpenVSP'
        %% Pause
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
        pause(5/1000);

        %% STANDARD ATMOSPHERE 
        cd csvla  
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);
        % LAUNCH STANDARD ATMOSPHERE
        StandardAtmosphere
        pause(5/1000);
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

        %% OPEN VSP CALCULATION
        cd utilities
        cd OpenVSP
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);
        % Starting Open VSP calculation
        Main_OPENVsp
        % Storing results 
        FromTableToStructAircraft
        % Pause
        pause(5/1000);

        %% Pause
        cd .. 
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
        pause(5/1000);

        %% CHORD CALCULATION 
        cd chord_calc 
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);
        pause(5/1000);
        % Chord calculation main program
        test_calc_chord

        %% Pause
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
        pause(5/1000);

        %% AERODYNAMIC MODEL
        cd calc_aero_model 
        % The 'dir' variable contains working directory path saved as a
        % char value
        dir = pwd;
        % Store working directory inside the log file
        fprintf('-----------------');
        fprintf('\n');
        fprintf('### Current directory ###');
        fprintf('\n');
        fprintf('%s\n', dir);

        % SCRIPT TO EVALUATE AERODYNAMIC QUANTITIES 
        CalcAeroModel
        pause(5/1000);

        %% Pause
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
        pause(5/1000);

end

%% APPLICATION OF AIRWORTHINESS REGULATIONS
Aircraft = ApplyRegulation(Aircraft);
