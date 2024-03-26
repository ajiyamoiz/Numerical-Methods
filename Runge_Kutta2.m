f=@(x,y)2*y;%Here we input our function such that dy/dx = f(x,y)
z=@(x) exp(2*x); %Exact solution
x0=input('\n Initial value of x: '); %initial given value x0
y0=input('\n Initial value of y: '); %Given initial value y0
z0=y0; %
xn=input('\n Final value of x: ');% where we need to find the value of y 
h=input('\n The step size h: '); %example h=0.1
fprintf('\n x        y       Exact '); % creating the heading for table contaning values of x and y
while x0<=xn %The loop will repeat until the final value of x is reached
    fprintf('\n%4.3f  %4.3f  %4.3f',x0,y0,z0); %values of x0 and y0
    k1=h*f(x0,y0); %value of k1
    x1=x0+h;  %new value of x
    k2=h*f(x1,y0+k1); %value of k2
    y1=y0+(k1+k2)/2; %value of y for corresponding value of x
    z1=z(x0); % value of exact solution
    x0=x1; % updating value of x
    y0=y1; % updating value of y
    z0=z1; %Updating value of z
end
    
