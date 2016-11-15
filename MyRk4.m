function [t,y]=MyRk4(f,tmin,tmax,numpts,IC)


% clear;clc;
% tmin=0;
% tmax=50;
% numpt=1000;
% IC=1;
% f = @(t,y) (-1/3)*y+sin(t);
%[t,y] = MyRk4(f,tmin,tmax,numpt,IC);




y(1) = IC;
t=linspace(tmin,tmax,numpts)';
h= t(2,1)-t(1,1);

for i=1:1:length(t)-1
   k(i) = f(t(i),y(i));
   k(i+1) = f(t(i)+(h/2),y(i)+(h/2)*k(i)); %in 4 order f is yprime.
   k(i+2) = f(t(i)+(h/2),y(i)+(h/2)*k(i+1));
   k(i+3) = f(t(i)+h,y(i)+h*k(i+2));
   y(i+1) = y(i) + (h/6)*(k(i)+2*k(i+1)+2*k(i+2)+k(i+3));




end