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

  % Euler's Method for differential equation solutions
function[independentv, solution] = euler_method (x0, xf, y0, h);
  % dy/dx = Fun(x,y) : differential equation
  % y0 = f(x0) : initial condition
  % h = x1 - x0 : uniform step size
  %
  %   Arguments:
  %       x0 = initial value of independent variable
  %       y0 = initial value of dependent variable
  %       xf = final value for independent variable
  %       h = step size
  %
  %   Solutions:  
  %       Solution(n,1) = n x 1 vector
  %   Calls:
  %       DQFun to evaluate the function
  %
  %   Initialize algorithim
      x = x0;
      y = y0;
  
      done = 1 + abs(xf-x)/h;

     % Preallocate solution matrix
    solution = zeros(done, length(y0));  % Make sure it can store all the values
    independentv = zeros(done, 1);

  % Main loop
      for n = 1:done
          y = y + h*PopFun(x,y);
          solution(n,:) = y;
          independentv(n,1) = x;
          x = x + h;
      end
end

%Iterate through each initial condition for each population using
%euler_method function
  [Euler_time, Euler_Population] = euler_method (0, 10, Pop_init, 0.001);

%Create plot
subplot (2,1,1);
plot(time,Population(:,1), '-',time,Population(:,2), '-o',time,Population(:,3), '-..');
xlabel("Time (years)");
ylabel('Population');
legend('Lion', "Deer", "Grass");
title("ODE45 Method");

%Create plot 
subplot(2,1,2);
plot(Euler_time,Euler_Population(:,1), '-',Euler_time,Euler_Population(:,2), '-o',Euler_time,Euler_Population(:,3), '-..');
xlabel("Time (years)");
ylabel('Population');
legend('Lion', "Deer", "Grass");
title("Euler Method");