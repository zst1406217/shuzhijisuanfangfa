%%%problem 1
clc,clear,close all
real=log(2);
%%with single-precision data and algorithm 1
x=1;
sum=0;
i=1;
e_a=1;
while e_a>=0.5*0.0001
    sum=single(sum+(-1)^(i+1)*single(x)^i/i);
    if(i>=2)
        e_a=abs((sum_1(i-1)-sum)/sum);
        ea_1(i)=e_a;
    end
    es_1(i)=abs((sum-real)/real);
    sum_1(i)=sum;
    i=i+1;
end
sum,
%%with double-precision data and algorithm 1
x=1;
sum=0;
i=1;
e_a=1;
while e_a>=0.5*0.0001
    sum=sum+(-1)^(i+1)*x^i/i;
    if(i>=2)
        e_a=abs((sum_2(i-1)-sum)/sum);
        ea_2(i)=e_a;
    end
    es_2(i)=abs((sum-real)/real);
    sum_2(i)=sum;
    i=i+1;
end
sum,
%%with single-precision data and algorithm 2
x=1/3;
sum=0;
i=1;
e_a=1;
while e_a>=0.5*0.0001
    sum=single(sum+2*single(x)^i/i);
    if(i>=2)
        e_a=abs((sum_3((i+1)/2-1)-sum)/sum);
        ea_3((i+1)/2)=e_a;
    end
    es_3((i+1)/2)=abs((sum-real)/real);
    sum_3((i+1)/2)=sum;
    i=i+2;
end
sum,
%%with double-precision data and algorithm 2
x=1/3;
sum=0;
i=1;
e_a=1;
while e_a>=0.5*0.0001
    sum=sum+2*x^i/i;
    if(i>=2)
        e_a=abs((sum_4((i+1)/2-1)-sum)/sum);
        ea_4((i+1)/2)=e_a;
    end
    es_4((i+1)/2)=abs((sum-real)/real);
    sum_4((i+1)/2)=sum;
    i=i+2;
end
sum,
