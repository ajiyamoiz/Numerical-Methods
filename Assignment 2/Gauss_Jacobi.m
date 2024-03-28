% Matrix size
[M,N] = size(A);
if M~=N
    error('A is not a square matrix, hence not possible. ');
end

% Check diagonally dominant
for m =1 : M
    row = abs( A(m,:) );
    d = sum(row) - row(m);
    if row(m) <= d
        error('A is not diagonally dominant, hence not possible. ')
    end
end

x = zeros(M,1);
tol = 1e-6;
D = diag(diag(A));
i = 0;
err = inf;

while err > tol
   dx = D\(b - A*x);
   x = x + dx;
   i = i + 1;
   err = max(abs(dx./x));
end

disp (['After ' num2str(i) ' iterations'])
x

% >> A=[ 2 3 -1; 8 -2 3; 5 -2 7];
% >> b=[ 12.2; 28.6; 36.95];