function [A] = SimpsonRulef(f,a,b,p)
% Here is sample code on how to run Simpsons Method
% clear; clc;
% f=@(x) x.^2;
% x= linspace(0,2,1000000);
% y = f(x);
% approxArea = SimpsonRule(x,y)


% partition x0 to xend into equal pieces

% form the rectangle using y



x=linspace(a,b,p);



Area = (1/6)*(x(2)-x(1))*sum((f(x(2:end))+4*f((x(2:end)+x(1:end-1))/2)+f(x(1:end-1))));


% sum
A=Area;


    
    
return
end



