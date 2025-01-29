% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

% System of differenctial equations to be solved; 1st order
function  y = PopFun(t, poplualtion)

    %Input parameters; Starting population for each species
    % y = 3 unit array
    % t = time, dependent variable
    % y(i) = dy(i)/dt

    %Constant values in each function
    Lam1 = 0.005;
    Lam2 = 0.5;
    Lam3 = 0.15;
    C1 = 0.0035;
    C2_7 = 0.005;
    Mu1 = 0.002;
    Mu2 = 0.2;
    

    %Parameters to be used 
    [Hunter, R] = forcing_functions;

    %Vector of zeros
    y = zeros(3:1);

    %Set of each individual differential equation to be solved for each population type
    y(1) = Lam1*poplualtion(1) + C1*poplualtion(1)*poplualtion(2) - Mu1*poplualtion(1) - C2_7*poplualtion(1)*Hunter;
    y(2) = Lam2*poplualtion(2) + C2_7*poplualtion(2)*poplualtion(3) - Mu2*poplualtion(2) - C2_7*poplualtion(2)*poplualtion(1) - C2_7*poplualtion(2)*Hunter;
    y(3) = Lam3*poplualtion(3) + C2_7*poplualtion(3)*R - C2_7*poplualtion(2)*poplualtion(3);

end