clear all
clc
f=@(x,y)((1/3)*sin(x))-((5/3)*y^2); 
x0=input('\n Initial value of x: ');
y0=input('\n Initial value of y: ');
xn=input('\n Final value of x: ');
h=input('\n Step size h: '); 
 fprintf('\n x        y ');
while x0<=xn
    fprintf('\n%4.3f  %4.3f ',x0,y0); %values of x and y
    y1=y0+h*f(x0,y0);
    x1=x0+h;
    x0=x1;
    y0=y1;  
end
 
