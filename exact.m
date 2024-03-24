syms y(x) z(x)
ode1 = diff(y) == (-x+y)*exp(-x);
ode2 = diff(z) == y-z;
odes = [ode1; ode2]
S = dsolve(odes)

ySol(x) = S.y
zSol(x) = S.z
[ySol(x), zSol(x)] = dsolve(odes)

cond1 = y(0) == 1;
cond2 = z(0) == 0.1;
conds = [cond1; cond2];
[ySol(x), zSol(x)] = dsolve(odes,conds)

fplot(ySol)
hold on
fplot(zSol)
grid on
legend('ySol','zSol','Location','best')