#include <stdio.h>
#include <stdlib.h>

int fib(int n) { return n <= 1 ? n : fib(n-1) + fib(n-2); }

int main()
{
    int num;
    scanf("%d", &num);

    printf("%d\n", fib(num));

    return 0;
}