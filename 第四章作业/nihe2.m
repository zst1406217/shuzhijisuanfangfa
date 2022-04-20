clc,clear
%% 1/y=a+b/x
% 数据
x0=2:16;
y0=[6.7 8.2 9.58 9.5 9.7 10 9.96 9.99 10.49 10.59 10.6 10.8 10.6 10.9 10.76];
% 数据变换
x1=1./x0;
y1=log(y0);
A=zeros(2,2);
b=zeros(2,1);
A(1,1)=15;
A(1,2)=sum(x1);
A(2,1)=sum(x1);
A(2,2)=norm(x1)^2;
b(1)=sum(y1);
b(2)=dot(x1,y1);
X=A\b;
% 绘图
step=1e-5;
x=0.05:step:0.6;
count=1;
for t=0.05:step:0.6
    y(count)=X(1)+t*X(2);
    count=count+1;
end
plot(x1,y1,'o');
hold on;
plot(x,y);
% （在这断点）
x=1:step:17;
count=1;
for t=1:step:17
    y(count)=exp(X(1))*exp(X(2)/t);
    count=count+1;
end
count=1;
for t=2:16
    y_value(count)=exp(X(1))*exp(X(2)/t);
    delta(count)=y_value(count)-y0(count);
    count=count+1;
end
hold off;
plot(x0,y0,'o');
hold on;
plot(x,y);
% 计算均方误差
MSE=1/15*norm(delta)^2;