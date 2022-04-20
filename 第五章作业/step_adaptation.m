%% Step size adaptation
clc,clear
I_real=10879.6194048972;
tol=5e-5;
a=0;
b=30;
c=(a+b)/2;
fa=v(a);fb=v(b);fc=v(c);
I=quadstep(a,b,tol,fa,fc,fb);
et=abs((I-I_real)/I_real);
e=abs(I-I_real);

function q=quadstep(a,b,tol,fa,fc,fb)
% Recursive subfunction used by quadadapt.
h=b-a;c=(a+b)/2;
fd=v((a+c)/2);fe=v((c+b)/2);
q1=h/6*(fa+4*fc+fb);
q2=h/12*(fa+4*fd+2*fc+4*fe+fb);
% 满足精度，跳出函数
if abs(q2-q1)<=tol
    q=q2+(q2-q1)/15;
% 不满足精度，继续迭代递归
else
    qa=quadstep(a,c,tol,fa,fd,fc);
    qb=quadstep(c,b,tol,fc,fe,fb);
    q=qa+qb;
end
end