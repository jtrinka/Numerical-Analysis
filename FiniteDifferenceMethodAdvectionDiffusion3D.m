%% This code runs the 3-Dimensional model of the advection-diffusion equation

clear;clc;
tic
xmin = 0; xmax = 1; numx = 20;
ymin = 0; ymax = 10; numy = 200;
zmin = .88; zmax = 1; numz = 20; %River is .12 kilometers deep
x=linspace(xmin,xmax,numx);
dx = x(2)-x(1);
y=linspace(ymin,ymax,numx);
dy = y(2)-y(1);
z=linspace(zmin,zmax,numz);
dz = z(2)-z(1);
[x,y,z]=meshgrid(x,y,z);
tmin= 0; tmax = 10;
dt = .002;
t=tmin:dt:tmax;
IC = @(x,y,z) 20*exp(-((x-.1).^2+(y-.5).^2+(z-1).^2)/.009);
vm=1;
yv= @(x) .08*(x); %we have a faster velocity in the y direction than we do in the x direction
xv= @(y) .2+(.8)^y;%We want to  move down river while moving our solute to the right. I'd like to be able to move it only down the middle once the solute reaches the middle of the river.
zv= @(x) -.0001;%constant z velocity pushing down
D = .0018; %diffisuvity is the same in the x and y direction
%.2+ blah and .000989diffusivity or .000995 diffusivity
%Can increase diffusivity by increasing the n in the equation for which is 
%xv = k +(n)^y. k shifts our contaminant initially with the vector field.
%Want to keep a stable solution.
BCTop = 0;
BCBot = 0;
BCLef = 0;
BCRig = 0;
R = (dt*D)/dx^2;
Q = (dt*D)/dy^2;
V = (dt*D)/dz^2;
S = (dt/(2*dx));
T = (dt/dy);
W = (dt/(2*dz));
U = zeros(size(x,1),size(y,1),size(z,1),length(t));
U(:,:,:,1) = IC(x,y,z);

for n=1:length(t)-1
    for i=1:size(x,1)
        for j=2:size(y,1)-1
            for k=1:size(z,1)-1
                
                
                if i==1 && k ~=1 %Left Boundary
               
                U(i,j,k,n+1)= U(i,j,k,n)+R*(-1*U(i,j,k,n)+U(i+2,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(U(i,j,k+1,n)-2*U(i,j,k,n)+U(i,j,k-1,n))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)))-(W*zv(n)*(U(i,j,k+1,n)-U(i,j,k-1,n))); % this discretization worked %no centered discretization for z. Multiply W by 2 to fix the discretization. Had to do implicit here for z
            
            elseif i==length(x) && k~=1 %Right boundary condition
                
                U(i,j,k,n+1)= U(i,j,k,n)+R*(-1*U(i,j,k,n)+U(i-2,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(U(i,j,k+1,n)-2*U(i,j,k,n)+U(i,j,k-1,n))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)))-(W*zv(n)*(U(i,j,k+1,n)-U(i,j,k-1,n))); % this discretization worked %no centered discretization for z. Had to change second derivative as well. Had to do implicit here for z
                
            elseif k==1 && i~=1 && i~=length(x) %bottom boundary condition
                
                
                U(i,j,k,n+1) = U(i,j,k,n) + R*(U(i+1,j,k,n)-2*U(i,j,k,n)+U(i-1,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(-U(i,j,k,n)+U(i,j,k+2,n))-(S*xv(n)*(U(i+1,j,k,n)-U(i-1,j,k,n)))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)));
               
            elseif i==1 && k==1  %left and bottom boundary condition
                
                U(i,j,k,n+1) = U(i,j,k,n) + R*(-1*U(i,j,k,n)+U(i+2,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(-1*U(i,j,k,n)+U(i,j,k+2))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)));
                
            elseif i==length(x) && k==1 %right and bottom boundary condition
                
                
                U(i,j,k,n+1) = U(i,j,k,n) + R*(-1*U(i,j,k,n)+U(i-2,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(-1*U(i,j,k,n)+U(i,j,k+2))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)));
                
            else
            
            U(i,j,k,n+1) = U(i,j,k,n) + R*(U(i+1,j,k,n)-2*U(i,j,k,n)+U(i-1,j,k,n))+Q*(U(i,j+1,k,n)-2*U(i,j,k,n)+U(i,j-1,k,n))+V*(U(i,j,k+1,n)-2*U(i,j,k,n)+U(i,j,k-1,n))-(S*xv(n)*(U(i+1,j,k,n)-U(i-1,j,k,n)))-(T*yv(n)*(U(i,j,k,n)-U(i,j-1,k,n)))-(W*zv(n)*(U(i,j,k+1,n)-U(i,j,k-1,n))); %discretize here differently by using a centered difference.
           
            
            
            end
            
            end
             
           
            
            
            end
            
          
           
            
            
            
            
            end
           
            
        end
   

     
for i=1:length(t)
    %subplot(1,2,1)
   %surf(x,y,U(:,:,i),'EdgeColor','none')
   %axis([0,1,0,1,-10,10])
   %xlabel('Time (t)')
   %ylabel('Heat in a Space (x)')
   %title(['t=', num2str(t(i))])
   %colormap jet
%colorbar

%subplot(1,2,2)
isosurface(x,y,z,permute(U(:,:,:,i),[2 1 3]));
hold off
%view(3); 
axis([0,1,0,10,.88,1]);

%camlight 
%lighting gouraud
colormap jet
  h = colorbar;
     h.Limits = [-10,10];
     caxis([-10,10])
     grid on
     xlabel('Horizontal Distance (km)')
    ylabel('Vertical Distance (km)')
    zlabel('Depth (km)')
title('Three-Dimensional Version of our Advection-Diffusion Model')
     
  pause(.0001)
  
%   frame = getframe(1);
%   im = frame2im(frame);
%   [imind,cm] = rgb2ind(im,256);
%   
%   if i ==1;
%       
%       imwrite(imind,cm,filename,'gif', 'Loopcount', inf);
%       
%   else
%       
%   imwrite(imind,cm,filename,'gif','WriteMode','append');
%   
%   end
  
% frame = getframe(1);
%   im = frame2im(frame);
%   [A,map] = rgb2ind(im,256);
%   
%   Animationpic = sprintf('math_img_%d.png', i) ;
%  imwrite(A,map, Animationpic, 'png') ;
%  


  
end




toc




