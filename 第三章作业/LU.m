% LU decomposition
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
% 矩阵分解
for k=1:n-1
    for i=k+1:n
        a(i,k)=a(i,k)/a(k,k);
        for j=k+1:n
            a(i,j)=a(i,j)-a(i,k)*a(k,j);
        end
    end
end
l=eye(n);
u=zeros(n,n);
for k=1:n
    for i=k:n
        u(k,i)=a(k,i);% 构造U
    end
end
for k=1:n
    for j=1:k-1
        l(k,j)=a(k,j);% 构造L
    end
end
% 回带求解
y(1)=b(1);
for i=2:n    
    for j=1:i-1
        b(i)=b(i)-l(i,j)*y(j);
    end
    y(i)=b(i);
end 
x(n)=y(n)/u(n,n);
for i=(n-1):-1:1
    for j=n:-1:i+1
        y(i)=y(i)-u(i,j)*x(j);
    end
    x(i)=y(i)/u(i,i);
end