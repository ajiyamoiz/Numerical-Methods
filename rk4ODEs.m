%RK4
clear all;
clc;
a=0;        %domain
b=1;
f1=@(x,y,z)(-x+y)*exp(-x);      %system of odes
f2=@(x,y,z)y-z;
h=0.1;     %step size
n=(b-a)/h;
y=zeros(1,n+1);
x=zeros(1,n+1);
z=zeros(1,n+1);
x(1)=0;     %initial value x
y(1)=1;     %initial value y
z(1)=0.1;   %initial value z
fprintf('\n x        y        z'); 

for i=1:n       %The loop will repeat until the final value of x is reached
    fprintf('\n%4.3f   %4.3f    %4.3f    %4.3f ',x(i),y(i),z(i));
    
    k1y=f1(x(i),y(i),z(i));     %initializing solution
    k2y=f1(x(i)+0.5*h,y(i)+0.5*k1y*h,z(i)+0.5*k1y*h);
    k3y=f1(x(i)+0.5*h,y(i)+0.5*k2y*h,z(i)+0.5*k2y*h);
    k4y=f1(x(i)+h,y(i)+k3y*h,z(i)+k3y*h);

    k1z=f2(x(i),y(i),z(i));
    k2z=f2(x(i)+0.5*h,y(i)+0.5*k1z*h,z(i)+0.5*k1z*h);
    k3z=f2(x(i)+0.5*h,y(i)+0.5*k2z*h,y(i)+0.5*k2z*h);
    k4z=f2(x(i)+h,y(i)+k3z*h,y(i)+k3z*h);

    x(i+1)=x(i)+h;      %formula for calculating next value of x
    y(i+1)=y(i)+(h/6)*(k1y+2*k2y+2*k3y+k4y);
    z(i+1)=z(i)+(h/6)*(k1z+2*k2z+2*k3z+k4z);
end

%EXACT
x1=a:h:b;
y1=x1 - exp(x1.*exp(-x1)).*(x1 - 1);
z1=y1 - exp(-x1).*(y1 - 1/10);
error = y1 - y

%GRAPHS
subplot(221);
plot(x,y);
xlabel('x');
ylabel('y');
title('RK4')

subplot(222)
plot(y1,x1)
xlabel('x');
ylabel('y');
title('EXACT')

subplot(223)
plot(x,z);
xlabel('x');
ylabel('z');
title('RK4')

subplot(224)
plot(z1,x1)
xlabel('x');
ylabel('z');
title('EXACT')