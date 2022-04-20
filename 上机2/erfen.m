clear;
x_l = 250; % the initial value of the left bound of x is 250
x_r = 300; % the initial value of the right bound of x is 300
x_m = mean([x_l,x_r]); % x_m is the mean value of the two bounds
x_g = 0;
e_a = 5e-11; % the principal of 10 Significant Digits 
real=600*sqrt(5)/5;
if f(x_l)*f(x_r)>0
    error('invalid input');
else
    while (abs(x_g-x_m)>e_a) % tolerance of accuracy
        if f(x_m)==0 % find the accurate root
            break;
        else
            if f(x_l)*f(x_m)<0;
            x_r = x_m; % update the new estimation to the interval
            else x_l = x_m;
            end
        end
    x_g = x_m; % current estimation
    x_m = mean([x_r,x_l]); 
    end
end
e_t=abs((x_m-real)/real);

%%definition of function
function fun=f(x)
fun=5*(x/600)^4-6*(x/600)^2+1;
end