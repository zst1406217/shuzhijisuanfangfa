%% combined simpson
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
n=100;
m=round(n/2);
x=linspace(a,b,2*m+1);
h=(b-a)/2/m;
I=(v(a)+v(b)+4*sum(v(x(2:2:2*m)))+2*sum(v(x(3:2:2*m-1)))); 
I=I*h/3;
et=abs((I-I_real)/I_real);
e=abs(I-I_real);