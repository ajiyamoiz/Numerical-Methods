function [L, U] = LUdecompCrout(A)
% The function decomposes the matrix A into a lower triangular matrix L
% and an upper triangular matrix U, using Crout's method, such that A= LU.
% Input variables:
% A The matrix of coefficients.
% b Right-hand-side column vector of constants.
% Output variable:
% L Lower triangular matrix.
% U Upper triangular matrix.
[R, C]=size(A);
for i=1:R
    L(i,1)=A(i,1);
    U(i,i)=1;
end
for j=2:R
    U(1,j)=A(1,j)/L(1,1);
end
for i=2:R
    for j=2:i
        L(i,j)=A(i,j)-L(i,1:j-1)*U(1:j-1,j);
    end
    for j=i + 1:R
        U(i,j)=(A(i,j)-L(i,1:i-1)*U(1:i-1,j))/L(i,i);
    end
end

% >> a= [4 -2 -3 6;-6 7 6.5 -6;1 7.5 6.25 5.5;-12 22 15.5 -1]
% >> b = [12; -6.5; 16; 17]
% >> [L, U]=LUdecompCrout(a)
% >> y=ForwardSub(L,b)
% >> i=BackwardSub(U,y)