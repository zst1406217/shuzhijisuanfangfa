clc,clear;
x1 = 0;
x2 = 500;
e = 5e-11; % Absolute tolerance of error
iterations = 0;
real = 600*sqrt(5)/5;
while (abs(x2-x1)>e)
    t = x2;
    x2 = x1-f(x1)*(x2-x1)/(f(x2)-f(x1)); % Newtown formula
    x_value(iterations+1)=x2;
    x1 = t;
    iterations = iterations+1;
end
e_t=abs((x2-real)/real);
x_p=1:6;
plot(x_p,x_value,'o-');
xlabel('迭代次数');
ylabel('迭代值');

%%definition of function
function fun=f(x)
fun=5*(x/600)^4-6*(x/600)^2+1;
end