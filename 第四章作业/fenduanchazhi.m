clc,clear
step=1e-5;
%数据
x_value=2:16;
y_value=[6.7 8.2 9.58 9.5 9.7 10 9.96 9.99 10.49 10.59 10.6 10.8 10.6 10.9 10.76];
%% 分段一次插值
x=2:step:16-step;
count=1;
for t=2:step:16-step
    y(count)=y_value(floor(t)-1)+(t-x_value(floor(t)-1))*(y_value(floor(t))-y_value(floor(t)-1))/(x_value(floor(t))-x_value(floor(t)-1));
    count=count+1;
end
%绘图
plot(x,y,'r');
hold on
plot(x_value,y_value,'o');
title('一次分段插值函数')

%% 分段二次插值
x_bond=zeros(1,length(x_value)-1); % Calculate boundary value
x_bond(1)=2;
for i=2:length(x_value)-2
    x_bond(i)=0.5*(x_value(i)+x_value(i+1));
end
x_bond(end)=16;
count=1;
x=2:step:16;
for t=2:step:16
    for j=1:length(x_bond)
        if t<x_bond(j)
            i=j-1;break;
        end
    end
    y0=y_value(i);y1=y_value(i+1);y2=y_value(i+2);
    x0=x_value(i);x1=x_value(i+1);x2=x_value(i+2);
    % Quadratic Lagrange interpolation
    y(count)=y0*(t-x1)*(t-x2)/(x0-x1)/(x0-x2)+y1*(t-x0)*(t-x2)/(x1-x0)/(x1-x2)+y2*(t-x0)*(t-x1)/(x2-x0)/(x2-x1);
    count=count+1;
end
%绘图
plot(x,y,'r');
hold on
plot(x_value,y_value,'o');
title('二次分段插值函数')