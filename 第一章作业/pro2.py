from decimal import *
from turtle import end_fill
x = Decimal('100000')
getcontext().prec = 100
sum = Decimal.ln(Decimal('2'))
print(sum)

result_single = Decimal('0.6931472')
error_single = abs((result_single-sum)/sum)

result_double = Decimal('0.693147180559945')
error_double = abs((result_double-sum)/sum)

print('single error')
print(error_single)
print('double error')
print(error_double)
