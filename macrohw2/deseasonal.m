% DESEASONAL.M
% Lutz Kilian
% University of Michigan
% August 2010

% This program fits monthly seasonal dummies to a univariate time series 
% and returns the residuals

function [ehat]=deseasonal(y);

t=length(y);

X=eye(12);
for i=1:(t/12)+1
    X=[X;eye(12)];
end;
X=X(1:t,:);

% Regression coefficients and residuals
bhat=(X'*X)\(X'*y);
yhat=X*bhat;
ehat=y-yhat;           

