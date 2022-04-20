from decimal import *
from turtle import end_fill
getcontext().prec = 100
sum = Decimal('0')
for i in range(1, 101, 1):
    sum = sum+Decimal('1')/(Decimal(str(i))*Decimal(str(i))
                            * Decimal(str(i))*Decimal(str(i)))
result = [Decimal('1.0823221'), Decimal('1.0823232'), Decimal(
    '1.082323233710861'), Decimal('1.082323233710805')]
error = [0, 0, 0, 0]
for i in range(4):
    error[i] = abs((result[i]-sum)/sum)
print(sum)
print(error)
