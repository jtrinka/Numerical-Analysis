function x = usolve(U, y)
%Given an upper triangular matrix U with unit diagonal and a vector y, this
%routine solves Ux=y and returns the solution x.
n = length(y); %Determine size of problem
for i=n:-1:1, %Loop over equations
    x(i) = y(i)/U(i,i);%Solve for x(i)
    
    x(i)=y(i);
    
    for j=i+1:n,%previously computed x(j)
        
        x(i) = x(i)-U(i,j)*x(j);
    end;
    
    x(i)=x(i)/U(i,i);
    
end;