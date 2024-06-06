function [x, y, z] = Sys2ODEsRK3(ODE1,ODE2,a,b,h,yINI,zINI)
% Sys20DEsRK3 solves a system of two first-order initial value ODEs using
% third-order Runge-Kutta method.
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
    Ky1 = ODE1 (x(i) , y(i) , z(i)) ;
    Kz1 = ODE2 (x(i) , y(i) , z(i)) ;
    Ky2 = ODE1 (x(i)+h/2,y(i)+Ky1/2,z(i)+Kz1/2) ;
    Kz2 = ODE2 (x(i)+h/2,y(i)+Ky1/2,z(i)+Kz1/2) ;
    Ky3 = ODE1 (x(i)+h/2,y(i)+Ky2/2,z(i)+Kz2/2) ;
    Kz3 = ODE2 (x(i)+h/2,y(i)+Ky2/2,z(i)+Kz2/2) ;
    y(i+1) =y(i) + (Ky1+4*Ky2+Ky3)*h/6;
    z(i+1) =z(i) + (Kz1+4*Kz2+Kz3)*h/6;
end
plot(x,y)

%a = 0; b = 3; yINI = 1; zINI = 0.2; h = 0.25;
%[x, y, z]=Sys2ODEsRK3(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI);