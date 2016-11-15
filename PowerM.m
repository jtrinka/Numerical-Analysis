function [L,v] = PowerM(A,x,k)
% clear;clc;
% N=10;
% A=rand(N,N);
% x=rand(N,1);
% [vectors,vals] = eig(A);
% B=vals(:);
% m=max(B);
% [L,v] = PowerM(A,x,10);
% abs(m-L)



v = x / norm(x);

for i=1:1:k
    
    
    vtemp= A*v; %Next iteration is equal to my 
    
    L = dot(v,vtemp);
    
    v = vtemp/ norm(vtemp);
    
    
    
end

v=v;

end