%% This code runs the 2-Dimensional model of the advection-diffusion equation

clear;clc;
xmin = 0; xmax = 1; numx = 20;
ymin = 0; ymax = 10; numy = 20;
x=linspace(xmin,xmax,numx);
dx = x(2)-x(1);
y=linspace(ymin,ymax,numx);
dy = y(2)-y(1);
[x,y]=meshgrid(x,y);
tmin= 0; tmax = 10;
dt = .00025;
t=tmin:dt:tmax;
IC = @(x,y) 20*exp(-((x-.1).^2+(y-.5).^2)/.009);
vm=1;
yv= @(x) .5*(x); %we have a faster velocity in the y direction than we do in the x direction
xv= @(y) 2+(.7)^y; %We want to  move down river while moving our solute to the right. I'd like to be able to move it only down the middle once the solute reaches the middle of the river.
D = .009; %diffisuvity is the same in the x and y direction
BCTop = 0;
BCBot = 0;
BCLef = 0;
BCRig = 0;
R = (dt*D)/dx^2;
Q = (dt*D)/dy^2;
S = (dt/(2*dx));
T = (dt/dy);
U = zeros(size(x,1),size(y,1),length(t));
U(:,:,1) = IC(x,y);

for n=1:length(t)-1
    for i=1:size(x,1)
        for j=2:size(y,1)-1
            if i==1
               
                U(i,j,n+1)= U(i,j,n)+R*(-1*U(i,j,n)+U(i+2,j,n))+Q*(U(i,j+1,n)-2*U(i,j,n)+U(i,j-1,n))-(T*yv(n)*(U(i,j,n)-U(i,j-1,n))); % this discretization worked
            elseif i==length(x)
                
                U(i,j,n+1)= U(i,j,n)+R*(-1*U(i,j,n)+U(i-2,j,n))+Q*(U(i,j+1,n)-2*U(i,j,n)+U(i,j-1,n))-(T*yv(n)*(U(i,j,n)-U(i,j-1,n)));
                
            else
            U(i,j,n+1) = U(i,j,n) + R*(U(i+1,j,n)-2*U(i,j,n)+U(i-1,j,n))+Q*(U(i,j+1,n)-2*U(i,j,n)+U(i,j-1,n))-(S*xv(n)*(U(i+1,j,n)-U(i-1,j,n)))-(T*yv(n)*(U(i,j,n)-U(i,j-1,n)));
           
            
            
            
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
contour(x,y,U(:,:,i)',100)

    
    


colormap jet
 h = colorbar;
    h.Limits = [-10,10];
    caxis([-10,10]) 
    axis([0,1,0,10])
    xlabel('Horizontal Distance (km)')
    ylabel('Vertical Distance (km)')
title('Two-Dimensional Version of our Advection-Diffusion Model')
  drawnow %plot it.
  
  
%   frame = getframe(1);
%   im = frame2im(frame);
%   [A,map] = rgb2ind(im,256);
%   
%   Animationpic = sprintf('mat_img_%d.png', i) ;
%  imwrite(A,map, Animationpic, 'png') ;
 
 
  
  
end
