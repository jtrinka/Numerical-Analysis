function[t,x,y] = My2RK(xprime,yprime,tmin,tmax,numpt,ICx,ICy)

% clear; clc;
% epsilon = 1/100;
% ICx = 2;
% ICy = 2/3;
% tmin = 0;
% tmax = 400;
% numpt= 1000;
% xprime = @(t,x,y) -(x^3/3)+x+y;
% yprime = @(t,x,y) -epsilon*x;
% [t,x,y] = My2RK(xprime,yprime,tmin,tmax,numpt,ICx,ICy);
% subplot(1,2,1)
% plot(t,x)
% subplot(1,2,2)
% plot(t,y)





t = linspace(tmin,tmax,numpt)';
y(1) = ICy;
x(1) = ICx;
h=t(2,1)-t(1,1);


for i=1:1:length(t)-1
   k1y = yprime(t(i),x(i),y(i));
   k1x = xprime(t(i),x(i),y(i));
   
   k2y = yprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x);
   k2x = xprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x);
   
   k3y = yprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x);
   k3x = xprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x);
   
   k4y = yprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x);
   k4x = xprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x);
   
   y(i+1) = y(i) + (h/6)*(k1y+2*k2y+2*k3y+k4y);
   x(i+1) = x(i) + (h/6)*(k1x+2*k2x+2*k3x+k4x);

end

end