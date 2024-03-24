syms y(x)
Dy=y-diff(y);
ode=diff(y)-(-x+y)*exp(-x)==0;    %Input ODE, diff(y,x,2) represents y" and diff(y,x) represents y'
cond1=y(0)==1;                              %Input condition y(0)
cond2=Dy(0)==0.1;                           %Input condition y'(0)
conds=[cond1,cond2];
ysol(x)=dsolve(ode,conds)
x0=0;                                       %Input initial value of x
xn=3;                                       %Input initial value of y
h=0.1;                                      %Input step size
y0=vpa(ysol(0));                            %the term vpa converts fractions to decimals etc.

while x0<=xn
    x1=x0+h; 
    y1=vpa(ysol(x1));
    x0=x1
    y0=y1
    plot(x0,y0,'ro')
    xlabel ( 'x' ) ; ylabel ( 'y' )
    hold on
end
