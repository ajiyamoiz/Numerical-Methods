function x1 = jacobi(A,b,x0,tol)
n = length(b);
for j = 1 : n
     x(j) = ((b(j) - A(j,[1:j-1,j+1:n]) * x0([1:j-1,j+1:n])) / A(j,j)); % the first iteration
end
x1 = x';
k = 1;
while norm(x1-x0,1) > tol
    for j = 1 : n
     x_ny(j) = ((b(j) - A(j,[1:j-1,j+1:n]) * x1([1:j-1,j+1:n])) / A(j,j));
    end
    x0 = x1;
    x1 = x_ny';
    k = k + 1;
end
k
x = x1';