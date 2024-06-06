function dydx = ode1dydx (x,y,z)
dydx = z;

%syms y(t)
%[V] = odeToVectorField(diff(y, 2) == (1 - y^2)*diff(y) - y)

%M = matlabFunction(V,'vars', {'t','Y'})

%sol = ode45(M,[0 20],[2 0]);

%fplot(@(x)deval(sol,x,1), [0, 20])