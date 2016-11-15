function [Unew,Snew,Vnew] = Compress(U,S,V,P)
% clear; clc;
% A=rand(100,50);
% [U,S,V] = SingleDecomp(A);
% [Unew,Snew,Vnew] = Compress(U,S,V,.2);
% 
% Anew = Unew*Snew*Vnew';
%  norm(Anew-A)
%  Newstorage = prod(size(Unew))+prod(size(Vnew))+prod(size(Snew))
%  Oldstorage = prod(size(A))






P = P; %the percent of sing. values we want to keep.
r=rank(U*S*V');
keepvec=ceil(r*P);
%r is length of singular vector

singlevals= diag(S); 

newsinglev(1:keepvec)=singlevals(1:keepvec);

Snew=diag(newsinglev);
Unew = U(:,1:keepvec); 
Vnew = V(:,1:keepvec);



end