function [L2,v2] = MyPower2(A,x,k);
% clear;clc;
% N = 10; % size of the matrix ... math this large-ish
% A = rand(N,N);
% A = A'*A; % this will be symmetric. Dr. Sullivan
% x=rand(N,1);
% [vectors,vals] = eig(A);
% B=diag(vals); %puts my eigenvalues into a vector www.mathworks.com
% idx = find(B==max(B),1,'first'); %index the largest eigen value and it's position in B
% B(idx)= []; %remove it from B
% m=max(B);%now we are finding the second largest eigenvalue of B
% [L2,v2] = MyPower2(A,x,50);
% abs(m-L2)




v = x / norm(x);
for i=1:1:k
    
    
    vtemp= A*v; %Next iteration is equal to my 
    
    L = dot(v,vtemp);
    
    v = vtemp/ norm(vtemp);
    
    
    
end

v=v;

xhat = x-dot(x,v)*v; %construct an initial vector x that is a linear combination of v2,..,vn
v2= xhat/norm(xhat); %Using our calculated v value
%same process as PowerM
for j=1:1:k
   
 
 vtemp2= A*v2; %Next iteration is equal to my 
 
 vtemp2 = vtemp2 - dot(vtemp2,v)*v;
    
    
 
    L2 = dot(v2,vtemp2);
    
    v2 = vtemp2/ norm(vtemp2);

end





v2=v2;
end