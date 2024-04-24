function dx = derivative(x,y)
% derivative calculates the derivative of a function that is given by a set
% of points. The derivatives at the first and last points are calculated by
% using the forward and backward finite difference formula, respectively.
% The derivative at all the other points is calculated by the central
% finite difference formula.
% Input variables:
% x A vector with the coordinates x of the data points.
% y A vector with the coordinates y of the data points.
% Output variable:
% dx A vector with the value of the derivative at each point.
n = length (x) ;
dx (1) = (y (2) - y (1))/ (x (2) - x (1));
for i = 2 :n - 1
dx (i) = (y (i + 1) - y (i - 1)) / (x (i + 1) - x (i - 1));
end
dx (n) = (y (n) - y (n - 1))/ (x (n) - x (n - 1));

%t = 4:0.2:8;
%x= [-5.87 -4.23 -2.55 -0.89 0.67 2.09 3.31 4.31 5.06 5.55 5.78 5.77 5.52 5.08 4.46 3.72 2.88 2.00 1.10 0.23 -0.59];
%vel = derivative (t,x)
%ace= derivative (t,vel);
%subplot (3,1,1)
%plot (t,x)
%subplot (3,1,2)
%plot (t,vel)
%subplot (3,1,3)
%plot (t,acc)