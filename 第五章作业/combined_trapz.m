%% combined trapz
clc,clear
I_real=10879.6194048972;
a=0;
b=30;
n=10000;
x=linspace(a,b,n+1); 
h=(b-a)/n;
I=(v(x(1))+v(x(n+1)))/2+sum(v(x(2:n))); 
I=I*h;
et=abs((I-I_real)/I_real);
e=abs(I-I_real);