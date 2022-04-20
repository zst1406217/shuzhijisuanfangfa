% problem2（设置断点调试）
clc,clear
n=6;
a=hilb(n);
b=ones(n,1);
x_real=invhilb(6)*b;

%% 原始Gauss消去法
a=hilb(n);
b=ones(n,1);
% 消元
for k=1:n-1
    for i=k+1:n
        factor=a(i,k)/a(k,k);
        for j=k+1:n
            a(i,j)=a(i,j)-factor*a(k,j);
        end
        b(i)=b(i)-factor*b(k);
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

%% Guass列主元消去法
a=hilb(n);
b=ones(n,1);
% 消元
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

%% Gauss-Seide迭代法
clear max;
a=hilb(n);
b=ones(n,1);
x0=ones(n,1);
x=zeros(n,1);% 初值全为0
k=0;
% 第一次迭代
for i=1:n
    x(i)=b(i);
    for j=1:i-1
        x(i)=x(i)-a(i,j)*x(j);
    end
    for j=i+1:n
        x(i)=x(i)-a(i,j)*x0(j);
    end
    x(i)=x(i)/a(i,i);
end
% 计算相对误差
for i=1:n
    ea(i)=abs((x(i)-x0(i))/x(i));
end
% 迭代
while max(ea)>5e-11
    k=k+1;
    x0=x;
    for i=1:n
        x(i)=b(i);
        for j=1:i-1
            x(i)=x(i)-a(i,j)*x(j);
        end
        for j=i+1:n
            x(i)=x(i)-a(i,j)*x0(j);
        end
        x(i)=x(i)/a(i,i);
    end
    for i=1:n
        ea(i)=abs((x(i)-x0(i))/x(i));
    end
end