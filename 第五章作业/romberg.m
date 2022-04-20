%% Romberg
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
j=0;t=5;% 迭代次数
M=[];
h=(b-a)/2^j;
M(1,1)=h*(v(a)+v(b))/2;
for j=2:t
    h=h/2;
    M(j,1)=0.5*M(j-1,1)+h*sum(v(a+h*(1:2:2^(j-1)))); 
end
for k=2:t
    M(k:t,k)=M(k:t,k-1)+(M(k:t,k-1)-M(k-1:t-1,k-1))/(4^(k-1)-1); % 龙贝格公式
end
I=M(5,5);
et=abs((M(5,5)-I_real)/I_real);
e=abs(M(5,5)-I_real);