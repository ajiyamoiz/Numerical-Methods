hold on

f = @(x,y) (sin(x)-y);
a= 0;
b= 0.5;
h= 0.1;
n=(b-a)/h;
y(1)= 1;     %initial value
x= a:h:b;
fprintf('\n x        y '); 

for i = 1:n
        fprintf('\n%4.3f   %4.3f ',x(i),y(i));
    x(i+1) = x(i) + h;
    K1 = f(x(i),y(i)); %initializing solution
    xhalf = x(i) + h/2;
    yK1 = y(i) + K1*h/2;
    K2 = f(xhalf,yK1);
    yK2 = y(i) + K2*h/2;
    K3 = f(xhalf,yK2);
    yK3 = y(i) + K3*h;
    K4 = f(x(i + 1),yK3);
    y(i+1)= y(i) + (K1 + 2*K2 + 2*K3 + K4) *h/6;
end

plot(x,y)