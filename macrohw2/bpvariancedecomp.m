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

horizon=0:h;
IRF=vardecom(A,SIGMA(1:q,1:q),p,h,q);


subplot(2,1,1)

plot(horizon, cumsum(IRF(3,:)),horizon, zeros(size(horizon)),'k-','linewidth',3); 

title('Spending Shock')

ylabel('Percent')

xlabel('Months')

axis([0 h -5 5])



subplot(2,1,2)

plot(horizon, cumsum(IRF(6,:)),horizon, zeros(size(horizon)),'k-','linewidth',3); 

title('Tax Shock')

ylabel('Percent')

xlabel('Months')

axis([0 h -5 5])

