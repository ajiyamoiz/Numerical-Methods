function dydx = odeExample7dydx(x,y,z)
dydx= (-y+z) *exp(1-x) + 0.5*y;