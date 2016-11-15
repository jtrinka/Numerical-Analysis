function [U,S,V] = SingleDecomp(A);
% clear; clc;
% A=rand(100,50);
% [U,S,V] = SingleDecomp(A);
% error=norm(A-U*S*V')





m=size(A,1); %set m to be the number of rows of A
n=size(A,2); %set n to be the number of columns of A
r=rank(A); %get the rank of A
S=zeros(m,n);
U=zeros(m,m);
[vectors,values]=eig(A'*A,'vector');
values=abs(values);
[values,indices]=sort(values,'descend');
V=vectors(:,indices);
singularvalues= sqrt(values);
B=zeros(size(S));
for j=1:r
    S(j,j) = singularvalues(j);
    
    B(j,j) = 1/singularvalues(j);
    
end

U=A*V*B';

end
