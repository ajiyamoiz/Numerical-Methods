% Solving Chapter 11 Example 2
clc
clear all
a = 0; b = 0.1; TINI = 473; h = 0.25; Yb = 293;
tol = 0.01; imax = 15;
wH = -1000;
[x, T, w] = Sys2ODEsRK2(@odeChap11ExmpldTdx,@odeChap11Exmpldwdx,a,b,h,TINI,wH);
n = length(x);
wL = -3500;
[x,T,w] =Sys2ODEsRK2(@odeChap11ExmpldTdx,@odeChap11Exmpldwdx,a,b,h,TINI,wL);
for i = 1: imax + 1
    wi = (wH + wL)/2;
    [x,T,w]=Sys2ODEsRK2(@odeChap11ExmpldTdx,@odeChap11Exmpldwdx,a,b,h,TINI,wi);
    E = T (n) - Yb;
    if abs(E) < tol
        break
    end
    if E > 0
        wH = wi;
    else
        wL = wi;
        end 
end
if i > imax
    fprintf('Solution was not obtained in %i iterations.' ,imax)
else
    plot(x,T)
    xlabel('Distance (m} '); ylabel('Temperature (K} ')
    fprintf('The calculated temperature at x = 0.1 is %5.3f K.\n' ,T(n))
    fprintf('The solution was obtained in %2.0f iterations.\n' ,i)
end