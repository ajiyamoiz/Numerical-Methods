function [x, y, z] = Sys2ODEsRK2(ODE1,ODE2,a,b,h,yINI,zINI)
% Sys20DEsRK2 solves a system of two first-order initial value ODEs using
% second-order Runge-Kutta method.
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
    Ky1 = ODE1 (x (i) , y (i) , z (i)) ;
    Kz1 = ODE2 (x (i) , y (i) , z (i)) ;
    Ky2= ODE1(x(i+1) ,y(i) +Ky1*h,z(i) +Kz1*h);
    Kz2 = ODE2 (x (i + 1) , y (i) + Ky1*h, z (i) + Kz1*h) ;
    y (i+1) =y (i) + (Ky1 + Ky2) *h/2;
    z(i+1) =z(i) + (Kz1+Kz2)*h/2;
end

%a = 0; b = 3; yINI = 3; zINI = 0.2; h = 0.1;
%[x, y, z]=Sys2ODEsRK2(@odeExample7dydx,@odeExample7dzdx,a,b,h,yINI,zINI);
%xa = [0 0.25 0.5 0.75];
%ya = [3 1.472 1.374 1.427];
%za = [0.2 0.94 1.087 1.135];
%xb = [0 0.25 0.5];
%yb = [3 2.187 1.903];
%zb = [0.2 0.6436 0.9230];
%plot (x, y, '-k' , x, z, '-r' , xa, ya, '*k' , xa, za, '*r' , xb, yb, 'ok' , xb, zb, 'or')
