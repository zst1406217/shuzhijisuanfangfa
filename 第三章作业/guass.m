% Guass列主元消去法
clc,clear
%% 矩阵定义
n0=3;% 原题中的n
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
% 消元
jiaohuan=0;
for i=1:n-1
    max=abs(a(i,i));
    m=i;
    for j=i+1:n 
        if max<abs(a(j,i))
            max=abs(a(j,i));
            m=j; % 寻找列最大值
        end
    end
    if(m~=i)
        jiaohuan=jiaohuan+1;
        for k=i:n
            c(k)=a(i,k);
            a(i,k)=a(m,k);
            a(m,k)=c(k);
        end
        d=b(i);
        b(i)=b(m);
        b(m)=d;
    end
    for k=i+1:n
        factor=a(k,i)/a(i,i);
        for j=i+1:n
            a(k,j)=a(k,j)-a(i,j)*factor;
        end
        b(k)=b(k)-b(i)*factor;
    end
end
% 回带
x(n)=b(n)/a(n,n);
for i=n-1:-1:1
    sum=b(i);
    for j=i+1:n
        sum=sum-a(i,j)*x(j);
    end
    x(i)=sum/a(i,i);
end