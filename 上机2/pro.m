clc,clear,close all
start=2.5;%start point
tol=eps;

%%algorithm1
[k1,p1,ea1,P1,et1,x]=fixpt(@f1,start,tol,10000);
semilogy(x,P1);
xlabel('迭代次数');
ylabel('迭代值');

%%algorithm2
[k2,p2,ea2,P2,et2,x]=fixpt(@f2,start,tol,10000);
semilogy(x,P2);
xlabel('迭代次数');
ylabel('迭代值');

%%algorithm3
[k3,p3,ea3,P3,et3,x]=fixpt(@f3,start,tol,10000);
semilogy(x,P3);
xlabel('迭代次数');
ylabel('迭代值');

function f=f1(x)
f=x^2-1;
end

function f=f2(x)
f=1+1/x;
end

function f=f3(x)
f=sqrt(x+1);
end