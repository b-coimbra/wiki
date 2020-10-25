#include <stdio.h>
#include <stdlib.h>

#define size(y) (sizeof(y) / sizeof(y[0]))
#define middle(x) (x[0] + (int) size(x)) / 2

int binary_search(int *a, int x)
{
    int start = 0, end = size(a) - 1;

    while (start <= end) {
        int mid = middle(a);
        if (x == a[mid]) return mid;
        else if (x < a[mid]) end = mid - 1;
        else if (x > a[mid]) start = mid + 1;
        else return -1;
    }
}

int main()
{
    puts("Enter a number: ");
    int array[10] = {1,2,3,4,5,6,7,8,9};
    int num; scanf("%d", &num);
    int search = binary_search(array, num);

    printf(search != -1 ? "The number is at index %d" : "Couldn't find it", search);
}