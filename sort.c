#include <stdlib.h>
#include <stdio.h>
#include <math.h>

int main(int argc, char *argv[])
{
    int i, temp, swapped, sort[10];
    int sort_size = (int) (sizeof(sort) / sizeof(sort[0]));
    int *sort_p = (int*) malloc(sort_size * sizeof(int));

    for (i = 0; i < sort_size; i++)
        sort_p[i] = (rand() % 25) + 1;

    while (1) {
        swapped = 0;

        for (i = 0; i < sort_size - 1; i++)
            if (sort_p[i] > sort_p[i + 1]) {
                temp = sort_p[i];
                sort_p[i] = sort_p[i + 1];
                sort_p[i + 1] = temp;
                swapped = 1;
            }

        if (swapped == 0)
            break;
    }

    for (i = 0; i < sort_size; i++)
        printf("%d\n", sort_p[i]);

    free(sort_p);
    sort_p = NULL;

   return 0;
}