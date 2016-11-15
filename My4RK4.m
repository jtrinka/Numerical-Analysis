function[t,x,y,z,w] = My4RK4(xprime,yprime,zprime,wprime,tmin,tmax,h,ICz,ICw,ICx,ICy)
y(1) = ICy;
x(1) = ICx;
z(1) = ICz;
w(1) = ICw;
t=tmin:h:tmax;

for i=1:1:length(t)-1
   k1y = yprime(t(i),x(i),y(i),z(i),w(i));
   k1x = xprime(t(i),x(i),y(i),z(i),w(i));
   k1z = zprime(t(i),x(i),y(i),z(i),w(i));
   k1w = wprime(t(i),x(i),y(i),z(i),w(i));
   
   k2y = yprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x,z(i)+(h/2)*k1z,w(i)+(h/2)*k1w);
   k2x = xprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x,z(i)+(h/2)*k1z,w(i)+(h/2)*k1w);
   k2z = zprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x,z(i)+(h/2)*k1z,w(i)+(h/2)*k1w);
   k2w = wprime(t(i)+(h/2),x(i)+(h/2)*k1y,y(i)+(h/2)*k1x,z(i)+(h/2)*k1z,w(i)+(h/2)*k1w);
   
   k3y = yprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x,z(i)+(h/2)*k2z,w(i)+(h/2)*k2w);
   k3x = xprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x,z(i)+(h/2)*k2z,w(i)+(h/2)*k2w);
   k3z = zprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x,z(i)+(h/2)*k2z,w(i)+(h/2)*k2w);
   k3w = wprime(t(i)+(h/2),x(i)+(h/2)*k2y,y(i)+(h/2)*k2x,z(i)+(h/2)*k2z,w(i)+(h/2)*k2w);
   
   k4y = yprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x,z(i)+h*k3z,w(i)+h*k3w);
   k4x = xprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x,z(i)+h*k3z,w(i)+h*k3w);
   k4z = zprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x,z(i)+h*k3z,w(i)+h*k3w);
   k4w = wprime(t(i)+h,x(i)+h*k3y,y(i)+h*k3x,z(i)+h*k3z,w(i)+h*k3w);
  
   y(i+1) = y(i) + (h/6)*(k1y+2*k2y+2*k3y+k4y);
   x(i+1) = x(i) + (h/6)*(k1x+2*k2x+2*k3x+k4x);
   z(i+1) = z(i) + (h/6)*(k1z+2*k2z+2*k3z+k4z);
   w(i+1) = w(i) + (h/6)*(k1w+2*k2w+2*k3w+k4w);
    

end