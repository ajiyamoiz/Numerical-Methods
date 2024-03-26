%NC Muhammad Muaz Khalid
%Pak # 182213
f1=@(x,y,z)(-y+z)*exp(1-x)+0.5;
f2=@(x,y,z)y-z^2; 
x0=input('\n Initial value of x: ');
y0=input('\n Initial value of y: ');
z0=input('\n Initial value of z: ');
xn=input('\n Final value of x: '); 
h=input('\n The step size h: '); 
fprintf('\n x        y      z '); 
while x0<=xn
    fprintf('\n%4.3f  %4.3f  %4.3f',x0,y0,z0);
    x1 = x0 + h;
    Ky1 = f1 (x0,y0 ,z0);
    Kz1 = f2 (x0,y0,z0);
    Ky2 =f1 (x1 ,y0+Ky1*h, z0+Kz1*h);
    Kz2 =f2 (x1 ,y0+Ky1*h, z0+Kz1*h);
    y1 = y0 + (Ky1 + Ky2)*h/2;
    z1 = z0 + (Kz1 + Kz2)*h/2;
    x0=x1;
    y0=y1;
    z0=z1;
    plot(x0,y0,'-ro')
    xlabel ( 'x' ) ; ylabel ( 'Red=y and Blue=z ' )
    hold on
    plot (x0,z0,'-bo')
end