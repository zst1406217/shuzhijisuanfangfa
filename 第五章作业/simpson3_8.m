%% Simpson 3/8
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
x0=0;x1=10;x2=20;x3=30;
I=(b-a)*(v(x0)+3*v(x1)+3*v(x2)+v(x3))/8;
et=abs((I-I_real)/I_real);
e=abs(I-I_real);