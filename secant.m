function root = secant(f,x0,xf,tol)

%example code you can run is as follows

% clear; clc;
% tic
% f = @(x) x.^3+2*x+4;
% 
% root = secant(f,-4,4,10^-6)
% toc


if nargin<=3 %nargin number of arguments in if user doesn't type in a tolerance, make it 10^-6
    tol = 10^(-6);
end



scounter=0;
if abs(f(x0))<eps
    
   fprintf('Your root is %d\n', x0);
    return
end

if f(x0)*f(xf)>0
    
    fprintf('Cannot find the root because your f(x0) and f(xf) do not have different signs')
    
end


while abs(f(x0))>=tol
    scounter=scounter+1;
   xm = x0+((-f(x0)*(xf-x0))/(f(xf)-f(x0)));
    
    x0=xm;
    
end
display(scounter);
root = x0+((-f(x0)*(xf-x0))/(f(xf)-f(x0)));
    return

end