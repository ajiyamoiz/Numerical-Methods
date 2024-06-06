function [x, y, z] = Sys2odeModEuler(ODE1,ODE2,a,b,h,yINI,zINI)
% Sys2odeModEuler solves a system of two first-order initial value ODEs using
% modified Euler method.
% The independent variable is x, and the dependent variables are y and z.
% Input variables:
% ODEl Name for the function that calculates dy/dx.
% ODE2 Name for the function that calculates dz/dx.
% a The first value of x.
% b The last value of x.
% h The size of a increment.
% yINI The initial value of y.
% zINI The initial value of z.
% Output variables:
% x A vector with the x coordinate
% y A vector with the y coordinate
% z A vector with the z coordinate
x(1) = a; y(1) = yINI; z(1) = zINI;
N = (b - a)/h;
for i = 1:N
    x(i+1) = x(i) + h;
    SlopeEu1 = ODE1(x(i) , y(i), z(i)) ;
    SlopeEu2 = ODE2(x(i) , y(i), z(i)) ;
    yEu = y(i) + SlopeEu1*h;
    zEu = z(i) + SlopeEu2*h;
    SlopeEndy = ODE1(x(i+1) , yEu, z(i)) ;
    SlopeEndz = ODE2(x(i+1) , y(i), zEu) ;
    y(i+1) = y(i) + (SlopeEu1 + SlopeEndy) *h/2;
    z(i+1) = z(i) + (SlopeEu2 + SlopeEndz) *h/2;
end
plot(x,y)

%a = 0; b = 3; yINI = 1; zINI = 0.2; h = 0.25;
%[x, y, z]=Sys2odeModEuler(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI);