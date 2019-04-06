#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define size(x) (int) (sizeof(x) / sizeof(x[0]))

int main(int argc, char *argv[])
{
    int temp, sorted, list[10];
    int *sort = (int*) malloc(size(list) * sizeof(int));
    size_t i;

    for (i = 0; i < size(list); sort[i++] = (rand() % 25) + 1);

    while (1) {
        sorted = 0;

        for (i = 0; i < size(list) - 1; i++) {
            if (sort[i] > sort[i + 1]) {
                temp = sort[i];
                sort[i] = sort[i + 1];
                sort[i + 1] = temp;
                sorted = 1;
            }
        }

        if (sorted == 0) break;
    }

    for (i = 0; i < size(list); printf("%d ", sort[i++]));

    /*
    free(sort);
    sort = NULL;
    */
   return 0;
}