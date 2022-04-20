clc,clear
p0 = 250; % the initial value is 250
P(1) = p0;
max1 = 10000;% maxium iterations
real = 600*sqrt(5)/5; %real number
et(1) = abs((P(1)-real)/real);
tol = 5e-11; % the principal of 10 Significant Digits 
for k=2:max1
    P(k)=f(P(k-1));%不动点迭代
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
x=240:0.5:275;
y1=600.*sqrt(5./6.*(x./600).^4+1./6);
y2=x;
plot(x,y1);
hold on
plot(x,y2);
hold on
x_ll=[250,250,P(2),P(2),P(3),P(3),P(4),P(4)];
y_ll=[250,f(250),P(2),f(P(2)),P(3),f(P(3)),P(4),f(P(4))];
plot(x_ll,y_ll,'.-')

function fun=f(x)
fun=600*sqrt(5/6*(x/600)^4+1/6);
end