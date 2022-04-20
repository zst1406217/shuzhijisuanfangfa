%%%problem 2
clc, clear, close all
x = 100000;
%%with double-precision data and algorithm 1
y = log(x - sqrt(x^2 - 1))
%%with double-precision data and algorithm 2
y = -log(x + sqrt(x^2 - 1))
%%with single-precision data and algorithm 1
y = log(x - single(sqrt(x^2 - 1)))
%%with double-precision data and algorithm 2
y = -log(x + single(sqrt(x^2 - 1)))
