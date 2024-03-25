f=@(x,y,z)1/3*(2*z+5*y-exp(-x)); %Here we input our function such that dy/dx = f(x,y)
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
    j4=h*f(x0+h,y0+k3,z0+j3);
    k4=h*(z0+j3); %formula for calculating k1
    x1=x0+h; %formula for calculating next value of x
    y1=y0+(k1+2*k2+2*k3+k4)/6;
    z1=z0+(j1+2*j2+2*j3+j4)/6;
    x0=x1;%Now, the intial value is changed for x
    y0=y1;%Now, the intial value is changed for x
    z0=z1;
    plot(x0,y0,'ro')
    xlabel ( 'x' ) ; ylabel ( 'y ' )
    hold on
end
