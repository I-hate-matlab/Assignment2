% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

%Set inital value parameters to be used in functions 
% Create ODE functions for each respective population: Lion, Deer, Grass

clear all
date

%Initial conditions
Lion = 25;
Deer = 100;
Grass = 400;

Pop_init = [Lion, Deer, Grass];

%Range of time in years
  t_range = [0, 10];

%Call ODE45
  [time, Population] = ode45(@PopFun, t_range, Pop_init);

%Create plot 
plot(time,Popluation(:,1), '-',time,Popluation(:,2), '-o',time,Popluation(:,3), '-..');
xlabel("Time (years)");
ylabel('Number of cells in differentiation process');
legend('Lion', "Deer", "Grass");
title("Forest Model Population")