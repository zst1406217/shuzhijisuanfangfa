clc,clear
%% 分段节点函数表
point_num=56; % Number of sampling points
h=8/(point_num-1); % Sampling point spacing
x_value=-4:h:4;
y_value=exp(x_value);

%% 分段二次插值
x_bond=zeros(1,length(x_value)-1); % Calculate boundary value
x_bond(1)=-4;
for i=2:length(x_value)-2
    x_bond(i)=0.5*(x_value(i)+x_value(i+1));
end
x_bond(end)=4;
count=1;
step=1e-6; % Plot sampling point spacing
x=-4:step:4;
for t=-4:step:4
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

%% 估算截断误差
y_exp=exp(x);
Rn=abs(y-y_exp);
Rn_max=max(Rn); % Find the maximum truncation error

%% 画图
subplot(2,1,1)
plot(x,y,'r');
grid on
syms x0;
title('二次分段插值函数')
subplot(2,1,2)
plot(x,y_exp,'b');
xlim([-4,4])
title('原函数')
grid on

