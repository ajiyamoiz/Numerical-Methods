function [t, x, y]=Sys2ODEsRK4(ODE1,ODE2,a,b,h,x1,y1)
% Sys2ODEsRK4 solves a system of two first-order initial value ODEs usinq
% fourth-order Runqe-Kutta method.
% The independent variable is t, and the dependent variables are x and y.
% Input variables:
% ODEl Name for the function that calculates dx/dt.
% ODE2 Name for the function that calculates dy/dt.
% a The first value of t.
% b The last value of t.
% h The size of a increment.
% xl The initial value of x.
% yl The initial value of y.
% Output variables:
% t A vector with the t coordinate of the solution points.
% x A vector with the x coordinate of the solution points.
% y A vector with the y coordinate of the solution points.
t(1) = a; x(1) = x1; y(1) = y1;
n = (b - a)/h;
for i = 1:n
    t(i+1) = t(i) + h;
    tm = t(i) + h/2;
    Kx1 = ODE1(t(i) ,x(i) ,y(i));
    Ky1 = ODE2(t(i) ,x(i),y(i));
    Kx2 = ODE1(tm,x(i)+ Kx1*h/2,y(i)+ Ky1*h/2);
    Ky2 = ODE2(tm,x(i)+ Kx1*h/2,y(i)+ Ky1*h/2);
    Kx3 = ODE1(tm,x(i)+ Kx2*h/2,y(i)+ Ky2*h/2);
    Ky3 = ODE2(tm,x(i)+ Kx2*h/2,y(i)+ Ky2*h/2);
    Kx4 = ODE1(t(i + 1),x(i)+ Kx3*h,y(i)+ Ky3*h);
    Ky4 = ODE2(t(i + 1),x(i)+ Kx3*h,y(i)+ Ky3*h);
    x(i+1) = x(i) + (Kx1 + 2*Kx2 + 2*Kx3 + Kx4)*h/6;
    y(i+1) = y(i) + (Ky1 + 2*Ky2 + 2*Ky3 + Ky4)*h/6;
end
plot(x,y)

%Comparision with exact solution
%xp = a:h:b;
%yp = z + exp(xp - 1)./2 - (exp(-xp*exp(1 - xp)).*(2*z + exp(xp - 1) - 2))./2;
%zp = y^(1/2)*tanh(atanh(1/(5*y^(1/2))) + t*y^(1/2));
%plot(x,y, '*r' ,xp,yp)
%hold on
%plot(x,z, '*b' ,xp,zp)
%yExact = z + exp(x - 1)./2 - (exp(-x*exp(1 - x)).*(2*z + exp(x - 1) - 2))/2;
%zExact = y^(1/2)*tanh(atanh(1/(5*y^(1/2))) + t*y^(1/2));
%errory = yExact - y;
%errorz = zExact - z;

xlabel('x')
ylabel ('y')

%a = 0; b = 3; yINI = 1; zINI = 0.2; h = 0.05;
%[x, y, z]=Sys2ODEsRK4(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI);