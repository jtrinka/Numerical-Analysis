function [x,dy] = Deriv1better(x,y)
% inputs: x and y are lists of x and y pairs from a function
% Below is code on how to run derive1better
% clear; clc
% 
%  x = linspace(0,25,10000000); %1/2048 is h.
%  
%  f = x.^2;
%  plot(x,f,'b')
%  
%  grid on
%  hold on
%  [x,dy] = Deriv1better(x,f);
%  
%  plot(x,dy,'r')
if size(x) ==size(y)


h = abs(x(2)-x(1)); % MATLAB index is 1

dy = (y(3:end)-y(1:(end-2)))/(2.*h);

x = x(2:end-1);

else
    
    fprintf('inputs are different sizes\n')
    return
    
end

end


