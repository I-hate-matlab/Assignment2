% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

% System of differential equations to be solved; 1st order
function  y = PopFun(t, population)

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
    y(1) = Lam(1)*population(1) + C(1)*population(1)*population(2) - Mu(1)*population(1) - C(2)*population(1)*Hunter;
    y(2) = Lam(2)*population(2) + C(2)*population(2)*population(3) - Mu(2)*population(2) - C(2)*population(2)*population(1) - C(2)*population(2)*Hunter;
    y(3) = Lam(3)*population(3) + C(2)*population(3)*R - C(2)*population(2)*population(3);

    
    %Conditional statement that transposes the 3x1 column vector into a 1x3
    %row vector
    %This was necessary because ODE45 expects a column vector to be
    %returned, while the Euler method function expects a row vector.

    %This statment will check if the index of the array being called is
    %greater than 1 in a row format, and if so it means it must be being called by
    %the euler method, and will transpose the array

    if size(t, 2) > 1 || (size(t, 1) == 1 && size(population, 1) == 1)
        y = y';  % Convert to a row vector (1×3)
    end
    
end