#include <stdio.h>
#include <stdlib.h>

int linear_search(int *a, int x)
{
    for (size_t i = 0; i < (sizeof(a) / sizeof(a[0])) - 1; i++)
        return a[i] == x ? x : -1;
}

int main()
{
    int array[5] = {4,23,5,4};
    printf("%d\n", linear_search(array, 5));
}