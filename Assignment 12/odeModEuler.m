function [x, y] = odeModEuler(ODE,a,b,h,yINI)
% odeModEuler solves a first order ODE using the
% modified Euler method.
% Input variables:
% ODE Name for the function that calculates dy/dx.
% a The first value of x.
% b The last value of x.
% h Step size.
% yINI The value of the solution y at the first point (initial value).
% Output variables:
% x A vector with the x coordinate of the solution points.
% y A vector with the y coordinate of the solution points.
x(1) = a; y(1) = yINI;
N = (b - a)/h;
for i = 1:N
    x(i+1) =x(i) + h;
    SlopeEu = ODE(x(i) , y(i)) ;
    yEu=y(i) + SlopeEu*h;
    SlopeEnd= ODE(x(i+1) , yEu) ;
    y (i + 1) =y(i) + (SlopeEu + SlopeEnd) *h/2;
end

% a = 0 ; b = 2.5 ; h = 0.5 ; yINI = 3 ;
% [x,y] = odeModEuler(@Chap10Exmp1ODE,a,b,h,yINI);
% xp=a:0.1:b;
% yp=70/9*exp(-0.3*xp) -43/9*exp(-1.2*xp);
% plot(x,y,'*r' ,xp,yp)
% xlabel ( 'x' ) ; ylabel ( 'y' )