%% Interpolation type numerical differentiation
clc,clear
step=1;
x0=0:step:30;
y0=v(x0);
% 三弯矩法方程组构造
for i=1:30/step
    h(i)=x0(i+1)-x0(i);
end
for i=1:30/step-1
    u(i)=h(i)/(h(i)+h(i+1));
    ld(i)=1-u(i);
    g(i)=6*((y0(i+2)-y0(i+1))/(x0(i+2)-x0(i+1))-(y0(i+1)-y0(i))/(x0(i+1)-x0(i)))/(h(i)+h(i+1));
end
A=zeros(30/step+1,30/step+1);
b=zeros(30/step+1,1);
A(1,1)=2;A(1,2)=1;
for i=2:30/step
    A(i,i-1)=u(i-1);A(i,i)=2;A(i,i+1)=ld(i-1);
end
A(30/step+1,30/step)=1;
A(30/step+1,30/step+1)=2;
b(1)=6*((y0(2)-y0(1))/(x0(2)-x0(1))-0)/h(1);
for i=2:30/step
    b(i)=g(i-1);
end
b(30/step+1)=6*(0-(y0(30/step+1)-y0(30/step))/(x0(30/step+1)-x0(30/step)))/h(30/step);
X=A\b;
% 绘图
step0=1e-5;
x=0:step0:30-step0;
count=1;
for t=0:step0:30-step0
    i=floor(t/step)+1;
    % 原函数
    y(count)=1/(6*h(i))*(X(i)*(x0(i+1)-t)^3+X(i+1)*(t-x0(i))^3)+(y0(i)-X(i)*h(i)^2/6)*(x0(i+1)-t)/h(i)+(y0(i+1)-X(i+1)*h(i)^2/6)*(t-x0(i))/h(i);
    % 导数估计
    dy(count)=1/(6*h(i))*(X(i)*3*(x0(i+1)-t)^2*(-1)+X(i+1)*3*(t-x0(i))^2)+(y0(i)-X(i)*h(i)^2/6)*(-1)/h(i)+(y0(i+1)-X(i+1)*h(i)^2/6)*(1)/h(i);
    % 导数精确值
    dv(count)=1800/(64-t)-9.8;
    count=count+1;
end
plot(x0,y0,'o');
hold on;
plot(x,y);

plot(x,dv,x,dy);
legend('精确值','估计值')

