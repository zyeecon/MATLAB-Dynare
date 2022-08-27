%Real Business Cycle Model Simulation%



% Neoclassical model with government spending financed by lump sum taxes

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. VARIABLES AND PARAMETERS
%----------------------------------------------------------------

% VARIABLE DEFINITIONS

%   y = output
%   c = consumption
%   i = investment
%   k = capital stock, end of period
%   n = hours
%   y_n = labor productivity
%   z = labor-augmenting technological progress
%   g = government purchases  //****

%  ENDOGENOUS VARIABLES

var y c k i n y_n g;  //***

% EXOGENOUS VARIABLES

varexo e;

% PARAMETERS

parameters beta psi delta alpha rho time z rho1 rho2 rho3;  //***
parameters z_ss kn_ss yn_ss ky_ss iy_ss cy_ss leisn_ss n_ss k_ss y_ss gy_ss g_ss; // ***

%----------------------------------------------------------------
% 2. CALIBRATION: PARAMETER VALUES AND DEFINITIONS
%----------------------------------------------------------------

alpha   = 0.33; // exponent on capital
beta    = 0.99; // discount factor
delta   = 0.023; // depreciation rate on capital
psi     = 1.75;  // weight on leisure in the utility function
time    = 1;  //time endowment
rho     = 0.95; // AR(1) parameter on technology 
sigma   = 0.1;  // arbitrary standard deviation of the g shock **
rho1 = 1.4; // rho1 - rho3 are for the AR(3) government spending process, estimated from data
rho2 = -0.18;
rho3 = -0.25; 
z = 1;  // **
gy_ss = 0.2; // SS govt/output ratio **

% steady-state values

z_ss = 1;
kn_ss = z_ss*(alpha/(1/beta - (1-delta)))^(1/(1-alpha)); // SS capital-labor ratio
yn_ss = z_ss^(1-alpha)*kn_ss^alpha; // SS average labor productivity
ky_ss = kn_ss/yn_ss; // SS capital-output ratio
iy_ss = delta*ky_ss; // SS investment-output ratio
cy_ss = 1 - iy_ss - gy_ss;  // SS consumption-output ratio ***
leisn_ss = (psi/(1-alpha))*cy_ss; // SS leisure-labor ratio
n_ss = time/(1 + leisn_ss); // SS labor supply
k_ss = n_ss*kn_ss; // SS capital stock
y_ss = (z_ss*n_ss)^(1-alpha)*k_ss^alpha;  // SS output
g_ss = gy_ss*y_ss;  // SS government ***

%----------------------------------------------------------------
% 3. MODEL
%----------------------------------------------------------------

model; 

% 1) CONSUMPTION EULER EQUATION

  (1/c) = beta*(1/c(+1))*(1+alpha*(k^(alpha-1))*(z(+1)*n(+1))^(1-alpha)-delta);

% 2) MRS CONDITION

  psi*c/(time-n) = (1-alpha)*(k(-1)^alpha)*(z^(1-alpha))*(n^(-alpha));

% 3) RESOURCE CONSTRAINT

  c+i+g = y;  // ***

% 4) PRODUCTION FUNCTION

  y = (k(-1)^alpha)*(z*n)^(1-alpha);

% 5) CAPITAL ACCUMULATION

  i = k-(1-delta)*k(-1);

% 6) DEFINITION OF LABOR PRODUCTIVITY

  y_n = y/n;

% 7) GOVERNMENT SPENDING PROCESS

  g = g_ss^(1-rho)*g(-1)^rho*exp(e); //***
%  g = g_ss^(1-rho1-rho2-rho3)*g(-1)^rho1*g(-2)^rho2*g(-3)^rho3*exp(e); //****

end;

%----------------------------------------------------------------
% 4. COMPUTATION
%----------------------------------------------------------------

initval;

  k = k_ss;
  y = y_ss;
  c = cy_ss*y_ss;
  i = delta*k_ss;
  g = g_ss;
  n = n_ss;
  e = 0;
end;

shocks;
var e = sigma^2;
end;

steady;

stoch_simul(loglinear, order = 1);

%----------------------------------------------------------------
% 5. Some Results
%----------------------------------------------------------------

statistic1 = 100*sqrt(diag(oo_.var(1:6,1:6)))./oo_.mean(1:6);
dyntable(options_,'Relative standard deviations in %',strvcat('VARIABLE','REL. S.D.'),M_.endo_names(1:6,:),statistic1,10,8,4);
