function [t,y] = MyEuler1D(f,tmin,tmax,numpt,IC)

% clear;clc;
% tmin=0;
% tmax=50;
% numpt=1000;
% IC=1;
% f = @(t,y) (-1/3)*y+sin(t);
%[t,y] = MyEuler1D(f,tmin,tmax,numpt,IC);

t = linspace(tmin,tmax,numpt)';
y(1) = IC;
h=t(2,1)-t(1,1);
for i=1:1:length(t)-1
    
 y(i+1)=y(i)+h*f(t(i),y(i));
    
end