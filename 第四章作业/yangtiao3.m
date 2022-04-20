clc,clear
%% 三次样条插值
x0=2:16;
y0=[6.7 8.2 9.58 9.5 9.7 10 9.96 9.99 10.49 10.59 10.6 10.8 10.6 10.9 10.76];
% 三弯矩法方程组构造
for i=1:14
    h(i)=x0(i+1)-x0(i);
end
for i=1:13
    u(i)=h(i)/(h(i)+h(i+1));
    ld(i)=1-u(i);
    g(i)=6*((y0(i+2)-y0(i+1))/(x0(i+2)-x0(i+1))-(y0(i+1)-y0(i))/(x0(i+1)-x0(i)))/(h(i)+h(i+1));
end
A=zeros(15,15);
b=zeros(15,1);
A(1,1)=2;A(1,2)=1;
for i=2:14
    A(i,i-1)=u(i-1);A(i,i)=2;A(i,i+1)=ld(i-1);
end
A(15,14)=1;
A(15,15)=2;
b(1)=6*((y0(2)-y0(1))/(x0(2)-x0(1))-0)/h(1);
for i=2:14
    b(i)=g(i-1);
end
b(15)=6*(0-(y0(15)-y0(14))/(x0(15)-x0(14)))/h(14);
X=A\b;
% 绘图
step=1e-5;
x=2:step:16-step;
count=1;
for t=2:step:16-step
    i=floor(t)-1;
    y(count)=1/(6*h(i))*(X(i)*(x0(i+1)-t)^3+X(i+1)*(t-x0(i))^3)+(y0(i)-X(i)*h(i)^2/6)*(x0(i+1)-t)/h(i)+(y0(i+1)-X(i+1)*h(i)^2/6)*(t-x0(i))/h(i);
    count=count+1;
end
plot(x0,y0,'o');
hold on;
plot(x,y);