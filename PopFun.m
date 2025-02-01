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

    %Parameters to be used 
    H0 = 5;
    R0 = 15;
    omega = 2;
    [Lam, C, Mu] = Pop_parameters;

    %Given forcing functions
    Hunter = H0 * (1 + sin(omega*t));
    R = R0 * (1 + cos(omega*t));

    %Vector of zeros
    y = zeros(3,1);

    %Set of each individual differential equation to be solved for each population type
    y(1) = Lam(1)*poplualtion(1) + C(1)*poplualtion(1)*poplualtion(2) - Mu(1)*poplualtion(1) - C(2)*poplualtion(1)*Hunter;
    y(2) = Lam(2)*poplualtion(2) + C(2)*poplualtion(2)*poplualtion(3) - Mu(2)*poplualtion(2) - C(2)*poplualtion(2)*poplualtion(1) - C(2)*poplualtion(2)*Hunter;
    y(3) = Lam(3)*poplualtion(3) + C(2)*poplualtion(3)*R - C(2)*poplualtion(2)*poplualtion(3);

end