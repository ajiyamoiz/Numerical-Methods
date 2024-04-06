function Yint = LagrangeINT(x,y,Xint)
% LagrangeINT fits a Lagrange polynomial to a set of given points and
% uses the polynomial to determine the interpolated value of a point.
% Input variables:
% x A vector with the x coordinates of the given points.
% y A vector with the y coordinates of the given points.
% Xint The x coordinate of the point at which y is to be interpolated.
% Output variable:
% Yint The interpolated value of Xint.
n = length (x);
for i = 1 :n
    L(i) =1;
    for j = 1:n
        if j ~= i
            L(i)= L(i)*(Xint-x(j))/(x(i)-x(j));
        end
    end
end
Yint = sum(y .*L);


% >> x = [10 20 30 40 50];
% >> y = [46 66 81 93 101];
% >> Yinterpolated= LagrangeINT(x,y,15)

% interp1(x,P,5)