% Solving first order ODE with Euler's implicit method.
clear all
a = 0; b = 0.5; h = 0.002;
N = (b - a)/h;
n(1) = 2000; t(1) = a;
for i=1:N
    t(i + 1) = t(i) + h;
    x = n(i);
    % Newton's method starts.
    for j = 1:20
        num =x + 0.800*x^(3/2) *h - 10.0*n (1) * (1 - exp (-3*t (i + 1))) *h - n (i) ;
        denom = 1+0.800*1.5*x^(1/2) *h;
        xnew = x - num/ denom;
        if abs((xnew - x)/x) < 0.0001
            break
        else
            end
    end
    x = xnew;
    if j == 20
        fprintf('Numerical solution could not be calculated at t =%gs', t(i))
        break
    end
% Newton's method ends.
n(i + 1) = xnew;
end
plot(t,n)
axis([0 0.5 0 2000]), xlabel('t (s) ') , ylabel('n')