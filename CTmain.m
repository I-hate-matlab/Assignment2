% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

%CTmain
%Program to find cell poplualtion during 4-stage process

clear all
date
%Initial conditions
  N-init = [1, 0, 0, 0];

%Set value of time range in days
  t_min = 0;
  t_max = 100;
  t_range = [t_min, t_max];

%Call ODE45
  [time, Num] = ode45(@CTFun, t_range, N_init);
%Create plot for each stage
plot(time,Num(:,1), '-',time,Num(:,2), '-o',time,Num(:3),'-..',time,Num(:,4), '--');
xlabel("Time (days)");
ylabel('Number of cells in differentiation process');
legend('Myeloid Stem Cell, Stage 1', "HFC-E Cell, Stage 2", "CFC-E Cell, Stage 3", "Erythrocyte, Stage 4");