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
    x(i+1) = x(i) + h                              %Determining x2  
    SlopeEUy = fy( x(i),y(i),z(i) );               %Slope of y at start of interval
    SlopeEUz = fz( x(i),y(i),z(i));               %Slope of z at start of interval
    yEu = y(i) + SlopeEUy*h;                       %factor used in SlopeEndy
    zEu = z(i) + SlopeEUz*h;                       %factor used in SlopeEndz
    SlopeEndy = fy( x(i+1),yEu,z(i) );              %Slope of y at end of interval
    SlopeEndz = fz( x(i+1),y(i),zEu );              %Slope of z at end of interval
    y(i+1) = y(i) + (SlopeEUy + SlopeEndy)*(h/2)   %Determining y2
    z(i+1) = z(i) + (SlopeEUz + SlopeEndz)*(h/2)   %Determining z2
end
plot(x,y)