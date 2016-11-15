function y = lsolve(L, b)
%Given a lower triangular matrix L with unit diagonal and a vector b, this
%routine solves Ly=b and returns the solution y.
n = length(b); %Determine size of problem
for i=1:n, %Loop over equations
    y(i) = b(i);%Solve for y(i)
    for j=1:i-1,%previously computed y(j)
        
        y(i) = y(i)-L(i,j)*y(j);
    end;
end;