% G-S迭代法
clc,clear
%% 矩阵定义
n0=5;% 原题中的n
n=4*n0;
a=zeros(n,n);
b=zeros(n,1);
x=zeros(n,1);
a(1,1)=1;
a(2,1)=-1;a(2,2)=3;a(2,3)=-1;a(2,4)=-1;
for i=1:n0-1
    a(4*i-1,4*i-3)=-1;a(4*i-1,4*i-2)=-1;a(4*i-1,4*i-1)=4;
    a(4*i-1,4*i)=-1;a(4*i-1,4*i+1)=-1;
    a(4*i,4*i-3)=-1;a(4*i,4*i-2)=-1;a(4*i,4*i-1)=-1;
    a(4*i,4*i)=4;a(4*i,4*i+2)=-1;
    a(4*i+1,4*i-1)=-1;a(4*i+1,4*i+1)=4;a(4*i+1,4*i+2)=-1;
    a(4*i+1,4*i+3)=-1;a(4*i+1,4*i+4)=-1;
    a(4*i+2,4*i)=-1;a(4*i+2,4*i+1)=-1;a(4*i+2,4*i+2)=4;
    a(4*i+2,4*i+3)=-1;a(4*i+2,4*i+4)=-1;
end
a(4*n0-1,4*n0-3)=-1;a(4*n0-1,4*n0-2)=-1;a(4*n0-1,4*n0-1)=4;a(4*n0-1,4*n0)=-2;
a(4*n0,4*n0-3)=-1;a(4*n0,4*n0-2)=-1;a(4*n0,4*n0-1)=-2;a(4*n0,4*n0)=4;
a0=a;
b(2)=1;

%% 求解
D=diag(diag(a));
L=-tril(a,-1);
U=-triu(a,1);
G=inv(D-L)*U;
rou=vrho(G);
f=inv(D-L)*b;
i_max=1e10; % 最大迭代次数
x0=zeros(n,1);
dtol=5e-11;
for i=1:i_max
    x=G*x0+f;
    if norm(x-x0)/norm(x)<dtol
        break;
    else
        x0=x;
    end
end

%% 误差分析
x_real=repelem(0.25,n);
x_real(1)=0;x_real(2)=0.5;
for j=1:n
    et(j)=abs((x(j)-x_real(j))/x_real(j));
end
et_max=max(et);