function [x, y] = odeRK4(ODE,a,b,h,yini)
% odeRK4 solves a first order initial value ODE usinq Runqe-Kutta fourth order method.
% Input variables:
% ODE Name for the function that calculates dy/dx.
% a The first value of x.
% b The last value of x.
% h Step size.
% yini The value of the solution y at the first point (initial value).
% Output variables:
% x A vector with the x coordinate of the solution points.
% y A vector with the y coordinate of the solution points.
x(1) = a; y(1) = yini
n = (b - a)/h;
for i = 1:n
    x(i + 1) = x(i) + h;
    K1 = ODE(x(i) ,y(i));
    xhalf = x(i) + h/2;
    yK1 = y(i) + K1*h/2;
    K2 = ODE(xhalf,yK1);
    yK2 = y(i) + K2*h/2;
    K3 = ODE(xhalf,yK2);
    yK3 = y(i) + K3*h;
    K4 = ODE(x(i + 1),yK3);
    y (i + 1) =y (i) + (K1+ 2*K2 + 2*K3 + K4) *h/6;
end

%a = 0; b = 2.5;
%h = 0.5; yini = 3;
%[x,y]=odeRK4(@Chap10Exmp1ODE,a,b,h,yini)
%xp=a:0.1:b;
%yp=70/9*exp(-0.3*xp) - 43/9*exp(-1.2*xp);
%plot(x,y, '*r' ,xp,yp)
%yExact=70/9*exp(-0.3*x) - 43/9*exp(-1.2*x)
%error= yExact - y