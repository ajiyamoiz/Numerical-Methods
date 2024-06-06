function [x, y, z] = Sys2odeEULER(ODE1,ODE2,a,b,h,yINI,zINI)
% Sys2odeEULER solves a system of two first-order initial value ODEs using
% Euler's explicit method.
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
    x(i + 1) = x(i) + h;
    y(i + 1) = y(i) + ODE1(x(i),y(i),z(i))*h;
    z(i + 1) = z(i) + ODE2(x(i),y(i),z(i))*h;
end
plot(x,y)

%a = 0; b = 3; yINI = 1; zINI = 0.2; h = 0.25;
%[x, y, z]=Sys2odeEULER(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI);