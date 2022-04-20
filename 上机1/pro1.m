%%%problem 1
clc, clear, close all
real = pi^4/90;
%%with single-precision data and forward summation
sum = 0;

for i = 1:10000
    sum = sum + single(1 / (i^4));
end

sum, %print
error = abs((sum - real) / real) %calculate error
%%with single-precision data and backward summation
sum = 0;

for i = 10000:-1:1
    sum = sum + single(1 / (i^4));
end

sum, %print
error = abs((sum - real) / real) %calculate error
%%with double-precision data and forward summation
sum = 0;

for i = 1:10000
    sum = sum + 1 / (i^4);
end

sum, %print
error = abs((sum - real) / real) %calculate error
%%with double-precision data and backward summation
sum = 0;

for i = 10000:-1:1
    sum = sum + 1 / (i^4);
end

sum, %print
error = abs((sum - real) / real) %calculate error
