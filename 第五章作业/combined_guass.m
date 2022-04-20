%% combined guass
clc,clear
I_real=10879.6194048972;
a=0;
I=0;
n=100;% 分割段数
for b=30/n:30/n:30
    a=b-30/n;
    a0=(a+b)/2;
    a1=(b-a)/2;
    % three points
    I=I+5/9*v_(-sqrt(15)/5,a0,a1)+8/9*v_(0,a0,a1)+5/9*v_(sqrt(15)/5,a0,a1);
end
et=abs((I-I_real)/I_real);
e=abs(I-I_real);

% 自变量转换
function out=v_(t,a0,a1)
out=v(a0+a1*t)*a1;
end