clc,clear;
x1 = 400;
x2 = x1-f(x1)/df(x1);
e = 5e-11; % Absolute tolerance of error
iterations = 0;
real = 600*sqrt(5)/5;
while (abs(x2-x1)>e)
    x1 = x2;
    x2 = x1-f(x1)/df(x1); % Newtown formula
    iterations = iterations+1;
    x_value(iterations)=x2;
end
e_t=abs((x2-real)/real);
x_p=1:4;
plot(x_p,x_value,'o-');
xlabel('迭代次数');
ylabel('迭代值');

%%definition of function
function fun=f(x)
fun=5*(x/600)^4-6*(x/600)^2+1;
end

function fun=df(x)
fun=20/600*(x/600)^3-12/600*(x/600);
end