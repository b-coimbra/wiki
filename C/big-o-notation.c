#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define len(x) (sizeof(x) / sizeof(x[0]))

int main()
{
    char array[] = {'a','b','c'};

    // constant time O(1), requires the same ammount of time regardless of the input size
    array[0];

    // linear time O(n), time grows linearly as the input size increases
    // other examples are: linear search, traversing, find minimum etc
    for (size_t i = 0; i < len(array); i++)
        if ('b' == array[i])
            printf("found %c!", array[i]);

    // logarithmic time O(log n) is proportional to the logarithm of the input size. (binary search for example)

    // NOTE:
    // bubble, selection and insertion sort are O(n^2) (quadratic time)
    // which is proportional to the square of the input size.

    return 0;
}
