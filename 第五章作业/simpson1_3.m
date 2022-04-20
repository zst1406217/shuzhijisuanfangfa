%% Simpson 1/3
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
I=(b-a)/6*v(a)+(b-a)*4/6*v((a+b)/2)+(b-a)/6*v(b);
et=abs((I-I_real)/I_real);
e=abs(I-I_real);