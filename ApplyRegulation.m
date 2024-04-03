function Aircraft = ApplyRegulation(Aircraft)
%% DESCRIPTION OF THE FUNCTION
% Aircraft = ApplyRegulation(Aircraft)
%   This functions allows the user to automatically switch through various
%   regulations, basing the switch activation on a char value stored inside
%   a struct variable called 'Aircraft'. The field inside which the char
%   value is stored is 
%                    Aircraft.Certification.Regulation.value
%   Possible switch case are:
%   ---> CSVLA
%   ---> CS22 (currently not available) 
%   ---> CS23 (currently not available)
%   Inside each case a properly defined script is called, to apply
%   calculations methods stored inside class files. To manage in a more
%   clear manner all the operations every case will change the working
%   directory to the one which contains all the files needed to carry out
%   the calculations. Outputs are stored inside the struct variable
%   'Aircraft' and in a sub-folder called Output in .pdf files format.

    %% SWITCH CASE TO SELECT APPLICABLE REGULATION 
    switch (Aircraft.Certification.Regulation.value)
        % CASE 1: Very Light Aircraft
        case 'csvla'
            % Change working directory
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
            % Call the class csvla.m
            fprintf('-----------------');
            fprintf('\n');
            fprintf('### Flight Envelope - per CS - VLA ###');
            fprintf('\n');

            %% Starting calling external programs/functions
            % WING WEIGHT CALCULATIONS
            CalcWingWeight
            
            % STANDARD ATMOSPHERE CALCULATION
            StandardAtmosphere
            
            % FLIGHT ENVELOPE 
            CalcFlightEnvelope
            
            % GUST ENVELOPE
            CalcGustEnvelope
            
            % FINAL ENVELOPE
            CalcFinalEnvelope
            
            % BALANCING LOADS
            CalcBalancingLoads
            
            % 3D INTERPOLATION OF DISTRIBUTIONS
            CalcInterpDistrLiftDragPitchMom
            
            % SHEAR, BENDING, TORSION DISTRIBUTION 
            CalcShearBendingTorsionDistr
            
            % UNSYMMETRICAL TORSION DUE TO AILERONS DEFLECTION
            CalcUnsymmetricalLoads
            
            % HORIZONTAL TAIL CALCULATOR
            CalcHorizontalTailLoads

            % VERTICAL TAIL CALCULATOR 
            CalcVerticalTailLoads
            
        case 'cs-23' 
        case 'cs-25'
    end
end