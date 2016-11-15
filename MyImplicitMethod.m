function [t,y]=MyImplicitMethod(f,dfx,tmin,tmax,numpts,numnewtonsteps,IC)

% 
% clear;clc;
% tmin=0;
% tmax=50;
% numpt=1000;
% IC=1;
% f = @(t,y) (-1/3)*y+sin(t);
% df = @(t,y) -(1/3)*1;
%[t,y] = MyImplicitMethod(f,df,tmin,tmax,numpt,1,IC);



y(1) = IC;
t=linspace(tmin,tmax,numpts)';
h= t(2,1)-t(1,1);
for i=1:1:length(t)-1
    
   F = @(x) y(i)+h*f(t(1+i),x)-x;
   
    DF = @(x) h*dfx(t(i+1),x)-1;
    x0 = y(i);
    for j=1:numnewtonsteps
       xnew =x0-F(x0)/DF(x0);
       x0=xnew;
        
    end
    y(i+1) = x0;
    
    
    
end
end