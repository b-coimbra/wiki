#include <stdio.h>

int main()
{
    // for (size_t i = 0; i < 101; i++)
    //     if (i % 15 == 0)
    //         puts("FizzBuzz");
    //     else if (i % 3 == 0)
    //         puts("Fizz");
    //     else if (i % 5 == 0)
    //         puts("Buzz");
    //     else
    //         printf("%d\n", i);

    // for (size_t i = 0; i < 101; i++)
    //     fprintf(stderr, (i % 15 == 0) ? "Fizzbuzz\n" : ((i % 3 == 0) ? "Fizz\n" : (i % 5 == 0) ? "Buzz\n" : "%d\n"), i);

    char s[4][10] = {"%d\n", "fizz\n", "buzz\n", "fizzbuzz\n"};

    for (size_t i = 1; i <= 100; i++)
        printf(s[!(i%3) + !(i%5)*2], i);

    return 0;
}