function [x,u] = Poisson1DF(f , xmin , xmax , numintpts , BCleft , BCright)

% clear;clc;
% f = @(x) 5*sin(2*pi*x.^10);
% BCleft=2;%alpha
% BCright=.5;%beta
% xmin=0;
% xmax=1;
% numintpts=400;
% [x,u] = Poisson1DF(f , xmin , xmax , numintpts , BCleft , BCright);
% plot(x,u)





x=linspace(xmin,xmax,numintpts+2);
dx=x(2)-x(1);
%Right hand side of matrix equation
rhs = -f(x(2:end-1))';
rhs(1) = rhs(1) - BCleft/dx^2;
rhs(end)= rhs(end)-BCright/dx^2;

%build coefficient
maindiag = -2*ones(numintpts,1);
A = diag(maindiag);
for j=1:numintpts-1
   A(j,j+1) = 1;
   A(j+1,j) = 1;
end

A = (1/dx^2)*A;
uinterior = A\rhs; %coefficeint backslash vector
u = [BCleft;uinterior;BCright];