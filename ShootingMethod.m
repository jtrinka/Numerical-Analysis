%% Shooting Method
clear;clc;
tmin=0;
tmax=1;
num=1000;
ICx=1;
FCx=2;
ICy1=1; %guess at initial velocity
ICy2=7;
f = @(t,x,y) y;
g = @(t,x,y) -4*x+sin(t);
[t,x,y]=MyEuler2D(f,g,tmin,tmax,num,ICx,ICy1);
plot(t,x,'b'), hold on
target = 2;
[t2,x2,y2]=MyEuler2D(f,g,tmin,tmax,num,ICx,ICy2);
plot(t,x2,'b')

for i=1:100
    
    
    ICm = (ICy1+ICy2)/2;
    
    [t3,x3,y3]=MyEuler2D(f,g,tmin,tmax,num,ICx,ICm);
plot(t3,x3,'b'), hold on


if (x3(end)-target)*(x(end)-target)<0

    
    ICy2 = ICm;
    
end
    if(x3(end)-target)*(x2(end)-target)<0
    
    
    ICy1 = ICm;
    
    end
    
    
end