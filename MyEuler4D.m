function[t,z,w,x,y] = MyEuler4D(zprime,wprime,xprime,yprime,tmin,tmax,h,ICz,ICw,ICx,ICy)
t = tmin:h:tmax;
y(1) = ICy;
x(1) = ICx;
z(1) = ICz;
w(1) = ICw;
%t(2,1)-t(1,1);
for i=1:1:length(t)-1
    
 y(i+1)=y(i)+h*yprime(t(i),z(i),w(i),x(i),y(i));
 x(i+1)=x(i)+h*xprime(t(i),z(i),w(i),x(i),y(i));
 z(i+1)=z(i)+h*zprime(t(i),z(i),w(i),x(i),y(i));
 w(i+1)=w(i)+h*wprime(t(i),z(i),w(i),x(i),y(i));
end