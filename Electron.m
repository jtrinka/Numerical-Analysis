function [derivatives] = Electron( t,y )
%initialize vectors for y
xp=y(1);
yp=y(2);
zp=y(3);
vx=y(4);
vy=y(5);
vz=y(6);
%Constants
q=1.6022e-19; %Coulombs
m=9.1e-31; %kg
Bz = 3; %Tesla
%The second order differential equations;

ax = -q/m*(vy*Bz); %Cross product result and thus acceleration can change if we add components to the B vector
ay = q/m*(vx*Bz);
az=0;
%The derivatives
[derivatives]=[vx,vy,vz,ax,ay,az]';


end

