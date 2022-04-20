%%%problem 2
clc,clear,close all
real=log(2);
%%with single-precision data and algorithm 2
%Calculate machine accuracy 
epsilon=1; 
while epsilon+1>1
    epsilon=single(epsilon/2); 
end
epsilon=epsilon*2;
x=1/3;
sum=0;
i=1;
e_a=1;
while e_a>=epsilon
    sum=single(sum+2*single(x)^i/i);
    if(i>=2)
        e_a=abs((sum_1((i+1)/2-1)-sum)/sum);
        ea_1((i+1)/2)=e_a;
    end
    es_1((i+1)/2)=abs((sum-real)/real);
    sum_1((i+1)/2)=sum;
    i=i+2;
end
sum,
%%with double-precision data and algorithm 2
epsilon=1; 
while epsilon+1>1
    epsilon=epsilon/2; 
end
epsilon=epsilon*2;
x=1/3;
sum=0;
i=1;
e_a=1;
while e_a>=epsilon
    sum=sum+2*x^i/i;
    if(i>=2)
        e_a=abs((sum_2((i+1)/2-1)-sum)/sum);
        ea_2((i+1)/2)=e_a;
    end
    es_2((i+1)/2)=abs((sum-real)/real);
    sum_2((i+1)/2)=sum;
    i=i+2;
end
sum,