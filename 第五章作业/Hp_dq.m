%% High precision difference quotient
clc,clear
a=0;
b=30;
step=1e-4;
x=a:step:b;
dv=1800./(64-x)-9.8;
subplot(4,1,1);
plot(x,dv,'r');% 精确值
title('精确值');
h=1e-4;
for i=1:b/step+1
    dv1(i)=(-v(x(i)+2*h)+4*v(x(i)+h)-3*v(x(i)))/2/h;
end
subplot(4,1,2);
plot(x,dv1,'b');% 前向差商
title('前向差商');
for i=1:b/step+1
    dv2(i)=(3*v(x(i))-4*v(x(i)-h)+v(x(i)-2*h))/2/h;
end
subplot(4,1,3);
plot(x,dv2,'b');% 后向差商
title('后向差商');
for i=1:b/step+1
    dv3(i)=(-v(x(i)+2*h)+8*v(x(i)+h)-8*v(x(i)-h)+v(x(i)-2*h))/12/h;
end
subplot(4,1,4);
plot(x,dv3,'b');% 中心差商
title('中心差商');

plot(x,dv,'b',x,dv1,x,dv2,x,dv3)
legend('精确值','前向差商','后向差商','中心差商')