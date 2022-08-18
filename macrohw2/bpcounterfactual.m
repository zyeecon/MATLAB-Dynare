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
% oil price (given by the relevant row of IRF) with the structural shock
% in question
yhat1=zeros(t-p,1); yhat2=zeros(t-p,1); yhat3=zeros(t-p,1); 
for i=1:t-p
    yhat1(i,:)=dot(IRF(3,1:i),What(1,i:-1:1));
    yhat2(i,:)=dot(IRF(6,1:i),What(2,i:-1:1));
    yhat3(i,:)=dot(IRF(9,1:i),What(3,i:-1:1));  
end;

GDP=y(:,3); GDPexa=((GDP-mean(GDP))./mean(GDP))*100; 
ytrue=deseasonal(GDPexa); ytrue=ytrue(1+p:end,1);
yhat=yhat1+yhat2+yhat3;

% Convert real oil price data back to level scale (normalized to 2012.5)
ydollar=GDP(161:230,1); 
yhatno1=ydollar-mean(ydollar).*(1+yhat1(161:230,1)/100)+mean(ydollar);
yhatno2=ydollar-mean(ydollar).*(1+yhat2(161:230,1)/100)+mean(ydollar);
yhatno3=ydollar-mean(ydollar).*(1+yhat3(161:230,1)/100)+mean(ydollar);


% Time line for plots (adjust time axis later)
time = datetime(1990,01,01):calquarters(1):datetime(2007,04,01); 

subplot(3,1,1)
    plot(time,GDP(161:230),'b-');
    title('Detrend real GDP Per Capita','fontsize',16)
    ylabel('log dollars','fontsize',18)
    grid on

subplot(3,1,2)
    plot(time,ydollar,'b-',time,yhatno2,'r:','linewidth',3);
    title('Real GDP per capita with and without cumulative effect of spending shock','fontsize',16)
    ylabel('log dollars','fontsize',18)
    legend('Actual','Counterfactual')
    grid on

subplot(3,1,3)
    plot(time,ydollar,'b-',time,yhatno3,'r:','linewidth',3);
    title('Real GDP per capita with and without cumulative effect of tax shock','fontsize',16)
    ylabel('log dollars','fontsize',18)
    legend('Actual','Counterfactual')
    grid on
    

