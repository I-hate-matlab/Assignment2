% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

% System of differenctial equations to be solved; 1st order
function  y = PopFun(time, poplualtion)

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
    [Lion, Deer, Grass, Hunter] = parameters;

    %Vector of zeros
    y = zeros(3:1);

    y(1) = Lam1 * Lion + C1*Lion*Deer - Mu1*Lion - C2_7*Lion*Hunter
