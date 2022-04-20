clc,clear
%% 多项式插值
syms x;
% 数据
x0=2:16;
y0=[6.7 8.2 9.58 9.5 9.7 10 9.96 9.99 10.49 10.59 10.6 10.8 10.6 10.9 10.76];
y=0;
% 拉格朗日插值
for i=1:15
    l=1;
    for j=1:15
        if j~=i
            l=l*(x-x0(j));
            l=l/(x0(i)-x0(j));
        end
    end
    l=simplify(y0(i)*l);
    y=y+l;
end
% 绘图
plot(x0,y0,'o');
hold on;
fplot(y);
xlim([1,17]);
ylim([0,15]);