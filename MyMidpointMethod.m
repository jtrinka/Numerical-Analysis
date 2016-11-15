function [t,y] = MyMidpointMethod(f,tmin,tmax,numpt,IC)


% clear;clc;
% tmin=0;
% tmax=50;
% numpt=1000;
% IC=1;
% f = @(t,y) (-1/3)*y+sin(t);
% [t,y] = MyMidpointMethod(f,tmin,tmax,numpt,IC);


y(1) = IC;
t=linspace(tmin,tmax,numpt)';
h= t(2,1)-t(1,1);
for i=1:1:length(t)-1
   ytemp = y(i)+(h/2)*f(t(i),y(i));
   y(i+1) = y(i) + h*(f((t(i)+t(i+1))/2,ytemp));
    
    
    
end