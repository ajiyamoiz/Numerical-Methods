clear all 
x = [1 2 3 4 5];
y = [1 3 5 7 11];
n=length(x);
m=2;
for i=1:2*m
    xsum(i)=sum(x.^(i));
end

a(1,1)=n;
b(1,1)=sum(y);
for j=2:m + 1
    a(1,j)=xsum(j-1);
end

for i= 2:m + 1
    for j= 1: m + 1
        a (i,j) = xsum (j + i - 2);
    end
    b(i,1)= sum(x.^(i - 1) .*y);
end

p= (a\b)'
for i= 1:m + 1
    xi(i) = p (m + 2 - i);
end

yi= 0 : 0.1: 15;
graph= polyval (xi,yi) ;
plot(x,y, 're' ,yi,graph, 'k','linewidth',2) 

% polyfit (x,y,2)