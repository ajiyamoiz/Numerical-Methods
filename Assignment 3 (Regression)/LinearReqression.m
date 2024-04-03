function [a1,a0] = LinearReqression(x,y)

% LinearRegression calculates the coefficients a1 and a0 of the linear
% equation y = a1*x + a0 that best fits n data points.
% Input variables:
% x A vector with the coordinates x of the data points.
% y A vector with the coordinates y of the data points.
% Output variables:
% a1 The coefficient a1.
% a0 The coefficient a0.

nx = length(x);
ny = length(y);
if nx ~= ny
    disp('ERROR: The number of elements in x must be the same as in y. ')
    a1='Error';
    a0='Error';
else
    Sx=sum(x);
    Sy=sum(y);
    Sxy=sum(x.*y);
    Sxx=sum(x.^2);
    a1=(nx*Sxy-Sx*Sy)/(nx*Sxx-Sx^2);
    a0=(Sxx*Sy-Sxy*Sx)/(nx*Sxx-Sx^2);
end

e = y-a0-a1*x
Sr = sum(e.^2)

% >> x = [2.10 6.22 7.17 10.5 13.7];
% >> y = [2.90 3.83 5.98 5.71 7.74];
% >> [a1, a0] = LinearReqression(x,y)
% >> xplot = [0 15];
% >> yplot = 0.4022*xplot+2.0395;
% >> plot(x,y, '*r' ,'markersize' ,10)
% >> hold on
% >> plot(xplot,yplot, 'k')

% polyfit (x,y,1)
