% Solution of Chapter 11 Example 4
clear
hc = 40; P = 0.016; k = 240; Ac = 1.6E-5; epsln = 0.4; seg = 5.67E-8;
betaA = hc*P/ (k*Ac) ; betaB = epsln*seg*P/ (k*Ac) ; Ts = 293;
N = 5; h = 0.1/N;
x = 0:h:0.1;
aDia = - (2 + h^2*betaA) ;
bele = -h^2*(betaA*Ts + betaB*Ts^4) ;
h2betaB = h^2*betaB;
Ti (1) = 473; Ti (N + 1) = 293;
Tnext (1) = Ti (1) ; Tnext (N + 1) = Ti (N + 1) ;
a = eye (N - 1,N - 1) *aDia;
for i = 1:N - 2
    a (i,i + 1) = 1;
    a (i + 1,i) = 1;
end
ainv = inv (a) ;
b (1) = bele - Ti (1) ; b (N-1) = bele - Ti (N+1) ;
b (2:N - 2) = bele;
Ti (2:N) = 400;
for i = 1:4
    phi = -h2betaB*Ti (2:N).^4';
    Tnext (2:N) = ainv*(b' - phi) ;
    Ti = Tnext;
    fprintf('After iteration number%2.0f the temperatures at mesh points are:\n' ,i )
    disp (Tnext)
end
plot (x,Tnext,'*r')
xlabel ('Distance (m) ') ; ylabel ('Temperature (K) ')