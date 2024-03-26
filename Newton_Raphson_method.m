%N/C Muhammad Muaz Khalid
%Pak # 182213
y=@(x) x^2 -4;   %Our given equation
z=@(x) 2*x;     %Derivative of given equation
x0=input('Enter the value of initial guess for root: ');
for i=1:5 %total 5 iterations
    fprintf('Iteration # %d\n',i)
    fprintf('We have x%d=%f\n',(i-1),x0)
    fprintf('f(x%d)=%f\n',(i-1),y(x0))
    fprintf('f`(x%d)=%f\n',(i-1),z(x0))
    x1=(x0-(y(x0)/z(x0))); %Finding next root
    fprintf('So, x%d=%f\n',i,x1)
    Ea(i)=abs((x1-x0)/x1)*100; %Finding error
    fprintf('The error is %f percent\n\n',Ea(i))
    x0=x1;
end

