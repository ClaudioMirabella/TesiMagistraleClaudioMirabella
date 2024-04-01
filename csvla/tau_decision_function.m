function tau_ht = tau_decision_function(elevator_flag)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% SWITCH TO SELECT CORRECTLY THE HORIZ. CONTROL EFFICIENCY TAU
if elevator_flag == "Conventional"
    tau_ht = 0.50;
elseif elevator_flag == "Stabilator"
    tau_ht = 1.0;
elseif elevator_flag == "Custom"
    prmpt = "Enter Horiz. control efficiency --> tau: ";
    tau_ht = input(prmpt);
end

end

