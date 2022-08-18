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

% LS.M
% Same order as in Rubio-Ramirez et al. (2010)

% Display LS model estimates
disp(V(1:q,1))
disp(A(1:q,1:q))
disp(A(1:q,q+1:2*q))
disp(A(1:q,2*q+1:3*q))
disp(A(1:q,3*q+1:4*q))
disp(SIGMA(1:q,1:q))
