clc;
clear all;
close all;
% y' = y-x ode condition
f = @(x,y) (2*y);
a=0;
b= 1;
n =10;
h=(b-a)/n;
y(1) =1;     %initial value
 
i = 0;
for x= a:h:b
    i = i+1;
    K1 = f(x,y(i)); %initializing solution
    K2 = f(x+h*0.5,y(i)+h*K1*0.5);
    K3 = f(x+h, y(i)-h*K1 +2*K2*h);
    y(i+1) =y(i)+h*(1/6)*(K1 +4*K2+K3);
    xx(i) = x;
end
