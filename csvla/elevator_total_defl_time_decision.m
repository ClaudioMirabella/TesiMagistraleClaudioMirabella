function [total_deflection_time, unit] = elevator_total_defl_time_decision(type_flag, command_flag)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

if (type_flag == "Aerobatic") && (command_flag == "Stick")
    total_deflection_time = 0.1;
    unit                  = "s";
elseif (type_flag == "Aerobatic") && (command_flag == "Wheel")
    total_deflection_time = 0.2;
    unit                  = "s";
elseif (type_flag == "Normal") || (type_flag == "Utility") || (type_flag == "Normal")
    if command_flag == "Stick"
        total_deflection_time = 0.2;
        unit                  = "s";
    elseif command_flag == "Wheel"
        total_deflection_time = 0.3;
        unit                  = "s";
    end
elseif type_flag == "Normal"
    prmpt = "Enter total defl. time interval --> t_total_defl_time: ";
    total_deflection_time = input(prmpt);
    unit                  = "s";
end

end

