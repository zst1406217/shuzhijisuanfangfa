clc,clear;
x_l = 0; % the initial value of the left bound of x is 250
x_r = 500; % the initial value of the right bound of x is 300
x_c = x_r; % x_c is the cross point of the two bound-line and the x-axis
x_t = 0; % x_t is the target ROOT of the eqation
e_a = 5e-11; % the principal of 10 Significant Digits 
i = 0; % iterations
real = 600*sqrt(5)/5; %real number
while (abs(x_t-x_c)>e_a)
x_t=x_c; % update the target value with the cross point
if f(x_t)==0
break;
else
x_c = x_r - f(x_r)*(x_l-x_r)/(f(x_l)-f(x_r)); % get the cross point
x_value(i+1)=x_c;
    if f(x_c)*f(x_r)<0
        x_l = x_c;
    else x_r = x_c;
    end
end
i = i+1;
end
e_t=abs((x_c-real)/real);
x_p=1:5;
plot(x_p,x_value,'o-');
xlabel('迭代次数');
ylabel('迭代值');

%%definition of function
function fun=f(x)
fun=5*(x/600)^4-6*(x/600)^2+1;
end