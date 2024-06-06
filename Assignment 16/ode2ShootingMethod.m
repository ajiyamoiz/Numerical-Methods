clc
clear all
a = 0; b = 1; yINI = 0; zINI1 = 0; h = 0.25;
[x, y1, z]=Sys2ODEsRK2(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI1);
n = length (x) ;
fprintf('at x=1 is %5.3f, for initial value of dt/dx= %4.1f\n' ,y1(n) ,zINI1)
zINI2 = 1;
[x, y2, z]=Sys2ODEsRK2(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI2);
fprintf ('at x=1 is %5.3f, for initial value of dt/dx= %4.1f\n' ,y2 (n) ,zINI2)
zINI3 = 1.5743
[x, y3, z]=Sys2ODEsRK2(@ode1dydx,@ode2dzdx,a,b,h,yINI,zINI3);
fprintf ('at x=1 is %5.3f, for initial value of dt/dx = %4.1f\n' ,y3 (n) ,zINI3)
plot (x, y1, '-k' , x, y2, '-k' , x, y3, '-r')
xlabel ('x ') ; ylabel ('y ')

hold on
%Comparision with exact solution
xp = 0:0.1:1;
yp = exp(2)*((exp(4)-1)^-1)*(exp(2*xp)-exp(-2*xp))+xp;
plot(x,y3, '*r' ,xp,yp)
yExact = exp(2)*((exp(4)-1)^-1)*(exp(2*x)-exp(-2*x))+x
error = yExact - y3