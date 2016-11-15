%% Steady-State Finite Difference Method
clear; clc; clf;
xmin = 0; xmax =1;
ymin = 0; ymax =1;
numintpts = 100;
[x,y] = meshgrid(linspace(xmin,xmax,numintpts+2),...
linspace(ymin,ymax,numintpts+2));
f = @(x,y) 20*exp(-((x-.5).^2+(y-.5).^2)/0.05);
%surf(x,y,f(x,y))
Conditionbot = @(x) sin(pi*x);
Conditiontop = @(x) sin(2*pi*x);
Conditionlef = @(y) 0;
Conditionrig = @(y) 0;
deltax= .2;
Ident=eye(numintpts,numintpts);
A=diag((-4*ones(numintpts,1)));
for i = 1:1:numintpts-1
   A(i,i+1)=1;
   A(i+1,i)=1;
end
B=cell(numintpts);
for n=1:1:numintpts
    for k=1:1:numintpts
        B{n,k} = zeros(numintpts);
        
        
        
    end
      
end

for i = 1:1:numintpts-1
   B{i,i+1}=Ident;
   B{i,i} = A;
   B{i+1,i}=Ident;
end

B{numintpts,numintpts} = A;

main= cell2mat(B);





x(1,2:end-1);
Conditionbot(x(1,2:end-1));
RHS = zeros(numintpts^2,1);

RHSMat = zeros(numintpts,numintpts);
for i =1:1:numintpts
RHSMat(i,:) = -f(x(i,2:end-1),y(i,2:end-1));
end
RHS=reshape(RHSMat',numintpts^2,1);
RHS(1:numintpts) = RHS(1:numintpts)-Conditionbot(x(1,2:end-1))'/deltax^2;
RHS(numintpts:numintpts:numintpts^2) = RHS(numintpts:numintpts:numintpts^2)-Conditionrig(y(2:end-1,1))'/deltax^2;
RHS(1:numintpts:numintpts^2) = RHS(1:numintpts:numintpts^2)-Conditionlef(y(2:end-1,1))'/deltax^2;
RHS(numintpts^2-numintpts+1:1:numintpts^2)=RHS(numintpts^2-numintpts+1:1:numintpts^2)-Conditiontop(x(1,2:end-1))'/deltax^2;
Uinterior=main\RHS;
Uintmat= reshape(Uinterior,numintpts,numintpts);
leftbound = zeros(numintpts+2,1);
rightbound = zeros(numintpts+2,1);
Utot= [Conditionbot(x(1,2:end-1));Uintmat;Conditiontop(x(1,2:end-1))];
Utot2 = [leftbound,Utot,rightbound];
surf(x,y,Utot2)


% 
% 
% 
