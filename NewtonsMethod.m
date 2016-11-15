function root = newton(f,df,x0,tol)
% This is Newton's method
% here is an example of how to run it 
% clear; clc;
% tic
% f = @(x) 2*x.^2-2;
% df = @(x) 4*x;
% 
% root = newton(f,df,-3,10^(-6))
% toc
if nargin<=3 %nargin number of arguments in if user doesn't type in a tolerance, make it 10^-6
    tol = 10^(-6);
end
% check that df(x0) is nonzero
if df(x0) == eps;
   fprintf('Your entered df is zero. Please enter a new df\n')
    return
end

%check if abs(f(x0))<eps... the nx0 is your root and you can stop
if abs(f(x0))<eps
    
    fprintf('Your root occurs at x =%g\n', x0)
    return
end
% if so, break the function

%if user doesn't supply tolerance, give them a reasonable one


%need a while loop that keeps track of how far the y-value is from the
%tolerance.
ncounter=0;
while abs(f(x0))>=tol
    ncounter = ncounter+1;
    x0=(-f(x0)/df(x0))+x0;    
    %x0=xm;
       
   if ncounter >= 100000
       
       break
   end
   
end    
  %display(ncounter);
  root =x0;
%    return
end