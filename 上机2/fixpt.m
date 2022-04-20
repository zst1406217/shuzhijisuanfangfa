function [k,p,ea,P,et,x] = fixpt(g,p0,tol,max1)
P(1)=p0;
real=1.618033988749895;
et(1)=abs((P(1)-real)/real);
for k=2:max1
    P(k)=feval(g,P(k-1));%不动点迭代
    err=abs(P(k)-P(k-1));
    ea(k)=err/(abs(P(k))+eps);%计算相对误差
    p=P(k);
    et(k)=abs((P(k)-real)/real);
    x(k)=k;
    if ea(k)<tol,break;end
end
if k == max1
    disp('maximum number of iterations exceeded')
end
P=P';%记录每次迭代的值
ea=ea';
et=et';
end
