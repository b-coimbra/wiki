#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#define __assert(expr, action) do { \
        if (!(expr)) action;        \
    } while (0)                     \

int main()
{
    int num;
    scanf("%d", &num);
    assert(num > 10);
    printf("The number is %d\n", num);

    int array[50];
    int total = 0;
    for (size_t i = 0; i < 50; i++) {
        __assert(!(isnan(an_array[i])), break);
        total += an_array[i];
    }

    return 0;
}
