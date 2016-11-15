function [x,u] = Poisson1DNeumannBetter(f , xmin , xmax , numintpts , NBC , BCright)
x=linspace(xmin,xmax,numintpts+3);
dx=x(2)-x(1);

% clear;clc;
% f = @(x) 2*exp(-0.1*x);
%  N=0;%alpha
% BCright=0;%beta
% xmin=0;
% xmax=1;
% numintpts=100;
% [x,u] = Poisson1DNeumannBetter(f , xmin , xmax , numintpts , N , BCright);
% plot(x,u)






%Right hand side of matrix equation
rhs = -f(x(2:end-1))';
rhs(1) = rhs(1) + NBC;
rhs(end)= rhs(end)-BCright/dx^2;

%build coefficient
maindiag = -2*ones(numintpts+1,1);
A = diag(maindiag);
for j=1:numintpts
  
   A(1,1)=1/dx;
   A(1,2)=-1/dx;
   A(j,j+1) = 1;
   A(j+1,j) = 1;
end

A = (1/dx^2)*A;
uinterior = A\rhs; %coefficeint backslash vector
u = [uinterior(1);uinterior;BCright];