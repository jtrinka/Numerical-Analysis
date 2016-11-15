function [Q,R] = myQR(A)

% B=[1,2,3;4,5,6;7,8,0];
% r=[1;0;2];
% [Q,R] = myQR(B);
% 
% d = Q'*r;
% c = usolve(R,d)




m = size(A,1); % rows of A
n = size(A,2); % columns of A

Q=zeros(m,n); % Build Q as a matrix of zeros that is m by n size
R=zeros(n,n); % Build R as a matrix of zeros that is n by n size

for j=1:n %loop through the columns
   qtemp=A(:,j); %define my temporary q value
   
   for i=1:j-1 %start at row one and end at one shy of the diaganol
       R(i,j) = dot(qtemp,Q(:,i)); %build on of the R's
       qtemp = qtemp-R(i,j).*Q(:,i); %build qtemp to do subtractions
       
       
   end
   
   Q(:,j) = qtemp./norm(qtemp); %normalize the jth column
   
   R(j,j) = dot(A(:,j),Q(:,j)); %Build the R's on the diagonal
    
end