function [x,d2y] = Deriv2(x,y)
% inputs: x and y are lists of x and y pairs from a function
% clear; clc
% 
%  x = linspace(0,25,10000000); %1/2048 is h.
%  
%  f = sin(x) -x.*sin(x);
%  
%  plot(x,f,'b')
%  
%  grid on
%  hold on
%  [x,d2y] = Deriv2(x,f);
%  
%  plot(x,d2y,'r')


if size(x) == size(y)


h = abs(x(2)-x(1)); % MATLAB index is 1

d2y = (y(3:end) -2.*(y(2:end-1))+(y(1:end-2)))./h.^2;

x = x(2:end-1);

else
    
    fprintf('inputs are different sizes\n')
    return
    
end

end


