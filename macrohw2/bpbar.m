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


    Uhat = Uhat(1:3,:);

    B0inv = chol(SIGMA)';

    B0inv = B0inv(1:3,1:3);

    What=inv(B0inv)*Uhat;

%Modified irfvar from Lutz Kilian
horizon=0:h;
IRF=irfvarhw(A,B0inv,p,q,t-p-1);

yhat1=zeros(t-p,1); yhat2=zeros(t-p,1); yhat3=zeros(t-p,1); 
for i=1:t-p
    yhat1(i,:)=dot(IRF(3,1:i),What(1,i:-1:1));
    yhat2(i,:)=dot(IRF(6,1:i),What(2,i:-1:1));
    yhat3(i,:)=dot(IRF(9,1:i),What(3,i:-1:1));  
end;
    
% Real price of oil expressed in exact percent deviations from mean
GDP=y(:,3); % Real GDP in levels 
GDPmean=mean(GDP);
GDPexa=((GDP-mean(GDP))./mean(GDP))*100; 

% Focus on 1990-end
ytrue=deseasonal(GDPexa); ytrue=ytrue(157+p:230,1);
yhat1=yhat1(161:230,1);
yhat2=yhat2(161:230,1);
yhat3=yhat3(161:230,1);

           
% Bar chart cumulative real oil price change: 1990-end
Dtrue=GDPmean*(1+ytrue(end)/100)-GDPmean*(1+ytrue(1)/100)
D1=GDPmean*(1+yhat1(end)/100)-GDPmean*(1+yhat1(1)/100)
D2=GDPmean*(1+yhat2(end)/100)-GDPmean*(1+yhat2(1)/100)
D3=GDPmean*(1+yhat3(end)/100)-GDPmean*(1+yhat3(1)/100)
D={D1 D2 D3}
for i = 1:3;
   D{i} = abs(D{i});
end
names = {'Spending Shocks', 'Tax Shocks', 'GDP Shocks' ,'Total'} ; 
subplot(1,1,1)
bar([D{1} D{2} D{3} abs(Dtrue)])
ylabel('Dollars','fontsize',16)
set(gca,'xticklabel',names)
grid on
