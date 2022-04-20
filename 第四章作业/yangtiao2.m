clc,clear
%% 二次样条插值
% 数据
x0=2:16;
y0=[6.7 8.2 9.58 9.5 9.7 10 9.96 9.99 10.49 10.59 10.6 10.8 10.6 10.9 10.76];
% 构造方程组，X为(a1,b1,c1,a2,b2,c2...a14,b14,c14)
A=zeros(42,42);
b=zeros(42,1);
A(1,1)=x0(1)^2;A(1,2)=x0(1);A(1,3)=1;
b(1)=y0(1);
for i=1:13
    A(2*i,3*i-2)=x0(i+1)^2;A(2*i,3*i-1)=x0(i+1);A(2*i,3*i)=1;
    A(2*i+1,3*i+1)=x0(i+1)^2;A(2*i+1,3*i+2)=x0(i+1);A(2*i+1,3*i+3)=1;
    b(2*i)=y0(i+1);
    b(2*i+1)=y0(i+1);
end
b(28)=y0(15);
A(28,40)=x0(15)^2;A(28,41)=x0(15);A(28,42)=1;
A(29,1)=1;
for i=2:14
    A(28+i,3*i-5)=2*x0(i);A(28+i,3*i-2)=-2*x0(i);A(28+i,3*i-4)=1;A(28+i,3*i-1)=-1;
end
X=A\b;
% 绘图
step=1e-5;
x=2:step:16-step;
count=1;
for t=2:step:16-step
    i=floor(t)-1;
    y(count)=X(3*i-2)*t^2+X(3*i-1)*t+X(3*i);
    count=count+1;
end
plot(x0,y0,'o');
hold on;
plot(x,y);