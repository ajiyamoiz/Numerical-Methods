function dwdx = odeChap11Exmpldwdx (x,T,w)
hc = 40; P = 0.016; eps = 0.4; k = 240; Ac = 1.6E-5; Seg = 5.67E-8;
Ts = 293;
kAc = k*Ac;
A1 = hc*P/kAc; A2 = eps*Seg*P/kAc;
dwdx = A1* (T - Ts) + A2* (T^4 - Ts^4);