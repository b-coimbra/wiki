#include <stdio.h>
#include <stdlib.h>

int fib(int n) { return n <= 1 ? n : fib(n-1) + fib(n-2); }

int fact(int x) { return x <= 1 ? 1 : x * fact(x-1); }

int main()
{
    int num = 10;
    scanf("%d", &num);

    printf("Fibonacci: %d\n", fib(num));
    printf("Factorial: %d\n", fact(num));

    return 0;
}