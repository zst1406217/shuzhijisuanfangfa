%% Romberg step adaptation
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
tol=5e-10;% 给定误差
j=1;
M=[];
h=b-a;
M(1)=h*(v(a)+v(b))/2;
M(2)=inf;
while (abs(M(1)-M(2))>tol)% 估计相对误差
    j=j+1;
    h=h/2;
    M(j)=0.5*M(j-1)+h*sum(v(a+h*(1:2:2^(j-1))));
    for k=j-1:-1:1
        M(k)=M(k+1)+(M(k+1)-M(k))/(4^(j-k)-1); 
    end
end
I=M(1);
et=abs((M(1)-I_real)/I_real);
e=abs(M(1)-I_real);