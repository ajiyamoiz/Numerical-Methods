f=@(x,y,z)(-1.8*z+0.8*y); %Here we input our function such that dy/dx = f(x,y)
x0=input('\n Initial value of x: '); %initial given value x0
y0=input('\n Initial value of y: '); %Given initial value y0
z0=input('\n Initial value of z: '); %Given initial value y0
xn=input('\n Final value of x: ');% where we need to find the value of y 
h=input('\n The step size h: '); %example h=0.1
fprintf('\n x        y      z '); % creating the heading for table contaning values of x and y
while x0<=xn %The loop will repeat until the final value of x is reached
    fprintf('\n%4.3f  %4.3f  %4.3f',x0,y0,z0); %values of x0 and y0
    j1=h*f(x0,y0,z0);
    k1=h*z0;
    j2=h*f(x0+h/2,y0+k1/2,z0+j1/2);
    k2=h*(z0+j1/2);
    j3=h*f(x0+h/2,y0+k2/2,z0+j2/2);
    k3=h*(z0+j2/2);
    x1=x0+h; %formula for calculating next value of x
    y1=y0+(k1+4*k2+k3)/6;
    z1=z0+(j1+4*j2+j3)/6;
    x0=x1;%Now, the intial value is changed for x
    y0=y1;%Now, the intial value is changed for x
    z0=z1;
    plot(x0,y0,'ro')
    xlabel ( 'x' ) ; ylabel ( 'y ' )
    hold on
end

%Comparision with exact solution
%xp = 0:0.1:1;
%yp = exp((4*x)/9 + (20*exp(-(9*x)/5))/81)*((9*exp(- (4*x)/9 - 20/(81*exp(x)^(9/5))))/8 + (20^(61/81)*81^(20/81)*z(20/81, 20/(81*exp(x)^(9/5))))/72) - exp((4*x)/9 + (20*exp(-(9*x)/5))/81)*(exp(-20/81)/8 + (20^(61/81)*81^(20/81)*z(20/81, 20/81))/72);
%plot(x,y, '*r' ,xp,yp)
%yExact = exp((4*x)/9 + (20*exp(-(9*x)/5))/81)*((9*exp(- (4*x)/9 - 20/(81*exp(x)^(9/5))))/8 + (20^(61/81)*81^(20/81)*z(20/81, 20/(81*exp(x)^(9/5))))/72) - exp((4*x)/9 + (20*exp(-(9*x)/5))/81)*(exp(-20/81)/8 + (20^(61/81)*81^(20/81)*z(20/81, 20/81))/72);
%error = yExact - y

