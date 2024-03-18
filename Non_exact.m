%% By Hassaan Moiz Khawaja
clear all
clc

% NOTE:
% Only for first or second order equations.
% Accepts only x and y as input variables, so different variables must be converted to x and y

% Inputs required: M(x,y)dx and N(x,y)dy , where
% M(x,y)= the part of the ODE with dx
% N(x,y)= the part of the ODE with dy 
% My= partial differential of M(x,y) with respect to y 
% Mx= partial differential of M(x,y) with respect to x 
% Nx= partial differential of N(x,y) with respect to X 
% Ny= partial differential of N(x,y) with respect to y  

% Find the Integral Factor of a Non-Exact Ordinary Differential Equation (ODE)  
syms x y u v 

M  =  input('Enter  the  M(x,y)  part  of  the  given  function:  ');       
% y^2
N  =  input('Enter  the  N(x,y)  part  of  the  given  function:  ');       
% 3*x*y+y^2-1

My = diff (M,y) 
Mx = diff (M,x)  
Nx = diff (N,x) 
Ny = diff (N,y)  

a = simplify((My-Nx)/N); 
b = simplify(My-Nx)/(-M); 
c = simplify(Mx+Ny); 
d = x^u*y^v;  

sa = symvar(a);      %finds the variables in the expression (My-Nx)/N 
sb = symvar(b);      %finds the variables in the expression (My-Nx)/(-M) 

facty = simplify(M/y); 
factx = simplify(N/x);  

if My == Nx 
    disp ('It is an exact differential equation and hence there is no integral factor.') 
    INTEGRAL_FACTOR = 1;
    
elseif isempty(sa)... 
        &symvar(My) == symvar(Nx)... 
        &symvar(Nx) == symvar(N)... 
        &symvar(N) == x   
    
    INTEGRAL_FACTOR = exp(int(a,x)) 
    elseifsa == x          
    
    INTEGRAL_FACTOR = exp(int(a,x)) 
    elseifisempty(sb)... 
        &symvar(My) == symvar(Nx)... 
        &symvar(Nx) == symvar(M)... 
        &symvar(M) == y 
    
    INTEGRAL_FACTOR = exp(int(b,y)) 
    elseifsb == y 
    
    INTEGRAL_FACTOR = exp(int(b,y))
    
elseif y*facty + x*factx == 0  
    facty ~= factx 
    INTEGRAL_FACTOR = 1/(x*M-y*N)
    
else
    d1 = M*d; 
    d2 = N*d;
    d3 = diff(d1,y,1);  
    d4 = diff(d2,x,1); 
    
    A1 = solve(... 
        subs(d3,{x,y},{0.1,0.2})- ... 
        subs(d4,{x,y},{0.1,0.2})  ... 
        ,u); 
    B1 = solve(... 
        subs(d3,{x,y},{0.1,0.2})- ... 
        subs(d4,{x,y},{0.1,0.2})  ... 
        ,v);  
    
    %unknown coefficient u 
    Const = [ solve(subs(d3- ... 
        d4,{v},{B1}),u)     
        solve(subs(d3- ... 
        d4,{u},{A1}),v) ]; 
    
    %unknown coefficient v 
    INTEGRAL_FACTOR = x^(Const(1))*y^(Const(2))   
    
end 

%Solving using exact solution method:
fx = INTEGRAL_FACTOR*M;
fy = INTEGRAL_FACTOR*N;
Exact = fx + fy     %M dx + N dy = 0

fxx = int (fx,x) %integrate with respect to x
fyy = diff(fxx,y) %differentiate with respect to y
hy = fy - fyy %integration constant
h = int(hy,y) %integrate h with respect to y

fxx + h