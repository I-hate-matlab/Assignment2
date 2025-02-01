% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

%Set initial value parameters to be used in functions 
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
plot(time,Population(:,1), '-',time,Population(:,2), '-o',time,Population(:,3), '-..');
xlabel("Time (years)");
ylabel('Population');
legend('Lion', "Deer", "Grass");
title("ODE45 Method");