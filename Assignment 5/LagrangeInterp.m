function fx = LagrangeInterp(x,y,xk)
n = length(x); % the degree of interpolation polynomial
nk = length(xk);
L = ones(n,nk);
for i = 0: n-1
    for j = 0:(i-1)
        L(j+1,:) = L(j+1,:).*(xk-x(i+1))/(x(j+1)-x(i+1));
        end
    for j = i+1:n-1
        L(j+1,:) = L(j+1,:).*(xk-x(i+1))/(x(j+1)-x(i+1));
    end
end
fx = y * L;
plot(x,y,'bo',xk,fx,'r');

% >> x = 0:3;
% >> y = [-5, -6, -1, 16];
% >> plot(x,y,'ro');
% >> xk = 0:0.05:3;
% >> hold on;
% >> fx = LagrangeInterp(x,y,xk)
