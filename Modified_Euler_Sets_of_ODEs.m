%Modified Euler’s 
clc
clear all

fy =@(x,y,z) z;               %equation of dy/dx
fz =@(x,y,z) z-y;                            %equation of dz/dx
a = 0;                                          %initial value of x
b = 1;                                          %final value of x
h = 0.01;                                       %step size
N = (b-a)/h;                                    %Number of steps
x(1) = a;                                       %Initial value of x
y(1) = 1;                                       %Initial value of y
z(1) = 0.2;                                     %Initial value of z
fprintf('\n x        y        z');  

for i = 1 : N
    fprintf('\n%4.3f   %4.3f    %4.3f    %4.3f ',x(i),y(i),z(i));
    
    x(i+1) = x(i) + h;                             %Determining x2  
    SlopeEUy = fy( x(i),y(i),z(i));                %Slope of y at start of interval
    SlopeEUz = fz( x(i),y(i),z(i));                %Slope of z at start of interval
    yEu = y(i) + SlopeEUy*h;                       %factor used in SlopeEndy
    zEu = z(i) + SlopeEUz*h;                       %factor used in SlopeEndz
    SlopeEndy = fy( x(i+1),yEu,zEu );              %Slope of y at end of interval
    SlopeEndz = fz( x(i+1),yEu,zEu );              %Slope of z at end of interval
    y(i+1) = y(i) + (SlopeEUy + SlopeEndy)*(h/2);  %Determining y2
    z(i+1) = z(i) + (SlopeEUz + SlopeEndz)*(h/2);  %Determining z2
    
    %graph
    subplot(121);
    plot(x,y);
    xlabel('x');
    ylabel('y');
    title('Modified Euler’s')
end

%EXACT
syms x
y1=dsolve('D2y1-Dy1+y1','y1(0)=1','Dy1(0)=0.2');
error = y1 - y;

%graph
subplot(122)
ezplot(y1,[0,1])
xlabel('x');
ylabel('y');
title('EXACT')