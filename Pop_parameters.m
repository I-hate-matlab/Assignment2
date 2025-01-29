% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

% Parameters to be used in Population functions

function [Hunter, R] = forcing_functions

    H0 = 5;
    R0 = 15;
    omega = 2;

    %Given inital population values

    %Given forcing functions
    Hunter = H0 * (1 + sin(omega*t));
    R = R0 * (1 + cos(omega*t));

end