xa(1) = x0;
ya(1) = y0;

for i=1:n;
    
    xa(i+1) = xa(i) + h;
    
    % Calculating k1 and k2
    k1 = f(xa(i),ya(i));
    k2 = f(xa(i)+p1*h,ya(i)+q11*k1*h);
    
    %Using 2nd Order Runge-Kutta formula
    ya(i+1) = ya(i) + (a1*k1 + a2*k2)*h;
    
end

ya