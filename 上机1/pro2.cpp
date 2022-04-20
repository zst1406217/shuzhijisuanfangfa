#include <iostream>
#include <math.h>
#include <iomanip>
#include "stdlib.h"
using namespace std;
int main()
{
    long double x = 100000;
    long double sum;
    sum = -log(x + sqrt(x * x - 1));
    sum = -sum;
    long double result[3] = {12.2060728,
                             12.206073762186564,
                             12.206072645505174};
    long double error[3];
    cout << setprecision(100) << sum << endl;
    cout << setprecision(100) << result[2] << endl;
    for (int i = 0; i < 3; i++)
    {
        error[i] = abs((result[i] - sum) / sum);
        cout << setprecision(100) << error[i] << endl;
    }
}