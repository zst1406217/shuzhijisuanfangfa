#include <iostream>
#include <math.h>
#include <iomanip>
#include "stdlib.h"
using namespace std;
int main()
{
    long double sum = 0;
    int i;
    for (i = 10000; i >= 1; i--)
    {
        double j = i;
        sum = sum + 1 / (j * j * j * j);
    }
    cout << setprecision(100) << sum << endl;
    long double result[4] = {1.082322100000, 1.082323200000, 1.08232323371086100000, 1.08232323371080500000};
    long double error[4];
    for (i = 0; i < 4; i++)
    {
        error[i] = abs((result[i] - sum) / sum);
        cout << setprecision(9) << error[i] << endl;
    }
}