clear;

lambda = -1.0;
yo = 1.0;
y(1) = yo;
yexact(1) = yo;
diff(1) = y(1)-yexact(1);

t(1) = 0.0;
tmax = 5.;
nt = 10000.;
h = tmax/nt;

for i=1:nt
    ys(i) = y(i) + lambda*h/2.*y(i);
    yss(i) = y(i) + lambda*h/2.*ys(i);
    ysss(i) = y(i) + lambda*h*yss(i);
    y(i+1) = y(i)+(lambda*h/6.)*(y(i)+2.*ys(i)+2.*yss(i)+ysss(i));
    t(i+1) = t(i)+h;
    yexact(i+1) = yo*exp(lambda*t(i+1));
    diff(i+1) = sqrt((yexact(i+1)-y(i+1))^2)/h^4;
end

subplot(2,2,1)
plot(t,y),xlabel('t'),ylabel('y (numerical)')

subplot(2,2,2)
plot(t,yexact),xlabel('t'),ylabel('y (exact)')

subplot(2,2,3)
semilogy(t,abs(y-yexact)),
xlabel('t'),ylabel('y(numerical)-y(exact)')

subplot(2,2,4)
semilogy(t,diff),...
xlabel('t'),ylabel('(y(numerical)-y(exact))/h^4')