function[t,x,y] = MyEuler2D(xprime,yprime,tmin,tmax,numpt,ICx,ICy)

% clear;clc;clf;
% a=1; b=.05; d=1; r=.01;
% xprime = @(t,x,y) (a*x-b*x*y);
% yprime = @(t,x,y) (-d*y+r*x*y);
% [t,x,y]=MyEuler2D(xprime,yprime,0,100,10000,6,6)
% plot(t,x,'b',t,y,'k')



t = linspace(tmin,tmax,numpt)';
y(1) = ICy;
x(1) = ICx;
h=t(2,1)-t(1,1);
for i=1:1:length(t)-1
    
 y(i+1)=y(i)+h*yprime(t(i),x(i),y(i));
 x(i+1)=x(i)+h*xprime(t(i),x(i),y(i));   
end