function [x, y] = odeRK2(ode,a,b,h,yini)
x(1) = a; y(1) = yini;
n = (b - a)/h;
for i = 1:n
x(i + 1) = x(i) + h;
K1 = ode(x(i) ,y(i));
K2 = ode(x(i)+h ,y(i)+K1*h);
y (i + 1) =y (i) + (K1+ K2) *h/2;
end

%a = 0; b = 2.5;
%h = 0.5; yini = 3;
%[x,y]=odeRK2(@ode,a,b,h,yini)