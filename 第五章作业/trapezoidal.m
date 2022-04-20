%% Trapezoidal formula
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
I=(b-a)*(v(a)+v(b))/2;
et=abs((I-I_real)/I_real);
e=abs(I-I_real);