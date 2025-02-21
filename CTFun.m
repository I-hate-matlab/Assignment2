% Model & Sim of Biomed Sys 001
% Assignment 2
% 1/25/2025
% Dillon Wright

% System of differential equations to be solved; 1st order
function Nt = CTFun(t,N)
  
  %Input arguments:
  % N(4)  = number of cells, array of 4: independent variables
  % t   = Time: Dependent
  % Solutions:
  % Nt(4)   = dN(4)/dt
  %
  
  [F, Mu, Alpha] = parameters;

  Nt = zeros(4,1);
  %Column vector with zeros

  Nt(1) = Mu(1)*N(1)*(2 * F(1) - 1) - Alpha(1)*N(1);

  %Loop that creates functions for each iteration in the vector 
  %Start count at 2, iterate 3 total times
  for i = 2:length(Nt)
    Nt(i) = 2*Mu(i -1)*N(i-1)*(1 - F(i-1)) + Mu(i) * N(i) * (2 * F(i) - 1) - Alpha(i)*N(i);
  end

end