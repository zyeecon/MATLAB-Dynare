function [A,SIGMA,U,V,X]=olsvarchw(y,p);
global q
[t,q]=size(y);
y=y';
Y=y(:,p:t);	
for i=1:p-1
 Y=[Y; y(:,p-i:t-i)];
end;
X=[ones(1,t-p); Y(:,1:t-p)];
Y=Y(:,2:t-p+1);
A=(Y*X')/(X*X'); 
U=Y-A*X;
SIGMA=U*U'/(t-p-p*q-1);	
V=A(:,1);
A=A(:,2:q*p+1);