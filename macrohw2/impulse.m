% FIGURE9_1.M 
%
% Kilian and Lutkepohl (2017), Structural VAR Analysis, Cambridge University Press.
% This file generates Figure 9.1

clear
clear all
%Lutz Kilian 4.2
h=20;           % IRF Horizon
p=4;            % Lag order
load('bpdata.mat')
y = bpdata(:, {'t', 'g', 'y'});
y = table2array(y);
[t,q]=size(y); 
%modified olsvarc from Lutz Kilian
[A,SIGMA,Uhat,V,X] = olsvarchw(y,p); 

cholesky = true; 

if cholesky == true

    Uhat = Uhat(1:3,:);

    B0inv = chol(SIGMA)';

    B0inv = B0inv(1:3,1:3);

    What=inv(B0inv)*Uhat;

else 

    Uhat = Uhat(1:3,:);

    B0inv = (SIGMA)';

    B0inv = B0inv(1:3,1:3);

    What=inv(B0inv)*Uhat;

end 

horizon=0:h
IRF=irfvar(A,B0inv,p,h);
subplot(1,3,1); 
plot(horizon, cumsum(IRF(6,:)),horizon, zeros(size(horizon)),'k-','linewidth',3); 
title('tax shock','fontsize',16)
ylabel('Quarters');
grid on;

subplot(1,3,3); 
plot(horizon, cumsum(IRF(3,:)),horizon, zeros(size(horizon)),'k-','linewidth',3); 
title('spending shock',16)
ylabel('Quarters')
grid on;

subplot(1,3,2); 
plot(horizon, cumsum(IRF(9,:)),horizon, zeros(size(horizon)),'k-','linewidth',3); 
title('Real GDP shock','fontsize',16)
ylabel('Quarters')
grid on;
