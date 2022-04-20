%This program is developed to demonstrate a Fixed point iteration 
%method on solving a algebra equation 
clear;
clc;
p(1)=2000;    %initialize the value
x(1)=1;
delta=5e-11;    %Allowed error

for k=2:10000
    x(k)=k;
    p(k)=fac(p(k-1));
    err=abs(p(k)-p(k-1));
    if err<delta,break,end
end

for i=1:k
    e(i)=abs(p(i)-p(k))/p(k);
end

semilogy(x,e);
xlabel('迭代次数');
ylabel('相对误差');
p(k)

% function y=cosh(x)
%     y=(exp(x)+exp(-x))/2;
% end

function y=fac(x)
    y=x/10*(cosh(500/x)-1)-10+x;
end

