function [A] = TrapRule(x,y)

% Here is sample code on how to run Trapezius Method
% clear; clc;
% f=@(x) x.^2;
% x= linspace(0,2,1000000);
% y = f(x);
% approxArea = TrapRule(x,y)


% partition x0 to xend into equal pieces

% form the rectangle using y

if size(x) ==size(y);


% area calculation
Area = .5*((y(1:end-1)+y(2:end))).*(x(2:end)-x(1:end-1));


% sum
A=sum(Area);

else
    
    fprintf('inputs are different sizes\n')
return
end



