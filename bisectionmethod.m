function [approxroot] = bisectionmethod(f,a,b,tol) 
%bisectionmethod file and function name have to be the exact same.
%Sample code using my bisection,method
%clear; clc;
% tic
% f=@(x) x.^2-2
% 
% approxroot=bisectionmethod(f,0,3,10^-8)
% 
% toc



% if the user doesn't give a tol, then give them one
if nargin<=3 %nargin number of arguments in if user doesn't type in a tolerance, make it 10^-6
    tol = 10^(-6);
    
end
% first check that a and b have the proper signs
if f(a)*f(b)>0
    fprintf('your signs are not different\n')
    return
end



% while loop that runs until a and b are within tol
bcounter = 0;
while abs(a-b)>=tol
   bcounter = bcounter +1;
    m = (a+b)/2;
    fa = f(a); fb=f(b); fm = f(m);
    if abs(fm)<=eps;
        return
    end
    if fa*fm>0
        a=m;
    else
        b=m;
    end
       
    if bcounter>100000;
        break
    end
end

approxroot = (a+b)/2;
end

% eval f(a), f(b), and f((a+b)/2)
% compare signs
% replace the appropriate endpoint