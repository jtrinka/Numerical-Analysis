function [L,U] = MyLU(A) %Does not work with pivoting
%Here is an example of how to run LU code, lsolve, and usolve code
% A = rand(100);
% b= rand(100,1);
% [L,U] = MyLU(A);
% y = lsolve(L,b);
% x = usolve(U,y);







n = size(A,1);
m = size(A,2);
L = eye(size(A));
U = A;
for j=1:n-1 %Loop over columns
    for i=j+1:n %Loop over rows below rows by j
        mult = U(i,j)/U(j,j); %calculates the multiples that go into L
        U(i,j+1:n) = U(i,j+1:n) - mult*U(j,j+1:n);
        U(i,j)=0;
        L(i,j) =mult;
        
    end
end

end