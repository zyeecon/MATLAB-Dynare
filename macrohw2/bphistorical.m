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
%Modified irfvar from Lutz Kilian
horizon=0:h;
IRF=irfvarhw(A,B0inv,p,q,t-p-1);

% Cross-multiply the weights for the effect of a given shock on the real
% GDP with the structural shock
% in question
  yhat1=zeros(t-p,1); yhat2=zeros(t-p,1); yhat3=zeros(t-p,1); 
for i=1:t-p
    yhat1(i,:)=dot(IRF(3,1:i),What(1,i:-1:1));
    yhat2(i,:)=dot(IRF(6,1:i),What(2,i:-1:1));
    yhat3(i,:)=dot(IRF(9,1:i),What(3,i:-1:1));  
end;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot actual demeaned GDP and its historical decomposition
time = datetime(1951,01,01):calquarters(1):datetime(2015,07,01);
subplot(3,1,1)
plot(time,detrend(y(5:end,3)),'k-','linewidth',3);
title('Demeaned GDP per capita','fontsize',18)
ylabel('Percent','fontsize',18)
grid on

subplot(3,1,2)
plot(time,yhat1,'k-','linewidth',3);
title('Cumulative Effect of flow spending shock on GDP','fontsize',18)
ylabel('Percent','fontsize',18)
grid on

subplot(3,1,3)
plot(time,yhat2,'k-','linewidth',3);
title('Cumulative Effect of flow tax Shock on GDP','fontsize',18)
ylabel('Percent','fontsize',18)
grid on

