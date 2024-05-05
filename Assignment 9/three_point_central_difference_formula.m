%second derivative at x = 2 numerically with the three-point central difference formula
%(a) Points x = 1.8 , x = 2 , and x = 2.2 .
xa = [1.8 2 2.2];
ya= 2.^xa./xa;
dfa = (ya(1) - 2*ya(2) + ya(3))/0.2^2

%(b) Points x=l.9, x=2,and x=2.1.
xb = [1.9 2 2.1];
yb = 2.^xb./xb;
dfb = (yb(1) - 2*yb(2) + yb(3))/0.1^2

%d = diff (x)
%d = diff (x,n)

%p = [4 0 5 7];
%dp = polyder (p)

%I= quad(function,a,b)
%q= trapz (x,y)
%I= dblquad(function, xmin, xmax, ymin, ymax)

%inits=’x(0)=1,y(0)=2,z(0)=3’;
%>>[x,y,z]=dsolve(’Dx=x+2*y-z’,’Dy=x+z’,’Dz=4*x-4*y+5*z’,inits)

%[x,y]=ode45(f,[0.5],1)