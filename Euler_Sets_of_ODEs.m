clc
clear
fy =@(x,y,z) (-y+z)*exp(1-x)+0.5;               %equation of dy/dx
fz =@(x,y,z) y-z.^2;                            %equation of dz/dx
a = 0;                                          %initial value of x
b = 3;                                          %final value of x
h = 0.25;                                       %step size
N = (b-a)/h;                                    %Number of steps
x(1) = a;                                       %Initial value of x
y(1) = 1;                                       %Initial value of y
z(1) = 0.2;                                     %Initial value of z
for i = 1 : N
    x(i+1) = x(i) + h                           %Adding the step size for next value of x              
    y(i+1) = y(i) + fy( x(i) , y(i)*h, z(i)*h)  %Euler simply uses the previous value of y to calculate next one
    z(i+1) = z(i) + fz( x(i) , y(i)*h, z(i)*h)  %Euler simply uses the previous value of z to calculate next one
end
