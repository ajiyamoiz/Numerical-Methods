function integral = simpsons(f,a,b,n)
h = (b-a)/n;
x4=0;
x2=0;
for j=2:2:b
for k=3:2:b
    x4 = x4 + f(x4);
    x2= x2 + f(x2);
end
end
integral = (h/3)*(f(a)+ f(b) + 4*(x4)+ 2*(x2));
end