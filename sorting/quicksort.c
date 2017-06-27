#include <stdio.h>
#include <stdlib.h>

void quicksort(int list[10], int left, int right)
{
    int pivot, temp, i, j, half;
    i = left;
    j = right;

    half = (int) ((i + j) / 2);
    pivot = list[half];

    do {
        while (list[i] < pivot) i = i + 1;
        while (list[j] > pivot) j = j - 1;

        if (i <= j) {
            temp = list[i];
            list[i] = list[j];
            list[j] = temp;
            i = i + 1;
            j = j - 1;
        }
    } while (j > 1);

    if (left < j)
        quicksort(list, left, j);
    else if (i < right)
        quicksort(list, i, right);
}

int main()
{
    int list[10] = {9, 3, 2, 5, 1, 4, 6, 7, 8};
    int list_size = (int) (sizeof(list) / sizeof(list[0]));

    puts ("Not sorted: ");
    for (size_t i = 0; i < list_size - 1; i++)
        printf("%d,", list[i]);

    quicksort(list, 0, list_size - 1);

    puts ("\nSorted: ");
    for (size_t i = 0; i < list_size; i++)
        printf("%d,", list[i]);

    return 0;
}