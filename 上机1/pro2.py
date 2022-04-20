from decimal import *
from turtle import end_fill
x = Decimal('100000')
# getcontext().prec = 100
sum = -Decimal.ln(x+Decimal.sqrt(x*x-Decimal('1')))
print(sum)
result = [Decimal('-12.2060728'), Decimal('-12.206073762186564'), Decimal(
    '-12.206072645505174')]
error = [0, 0, 0]
for i in range(3):
    error[i] = abs((result[i]-sum)/sum)
print(sum)
print(error)
