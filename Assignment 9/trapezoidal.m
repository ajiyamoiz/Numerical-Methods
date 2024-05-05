function I = trapezoidal(Fun,a,b,N)
% trapezoidal numerically integrate using the composite trapezoidal method.
% Input Variables:
% Fun Name for the function to be integrated.
% (Fun is assumed to be written with element-by-element calculations.)
% a Lower limit of integration.
% b Upper limit of integration.
% N Number of subintervals.
% Output Variable:
% I Value of the integral.
h = (b-a)/N;
x = a:h:b;
F = Fun(x);
I =h* (F (1) + F (N+ 1)) /2 + h*sum(F (2 :N));

%format long g
%Vel =@ (v) 97000*v./(5*v.A2+570000);
%distance = trapezoidal(Vel,40,93,10)
%distance = trapezoidal(Vel,40,93,100)
%distance = trapezoidal(Vel,40,93,1000)

%q= trapz (x,y)