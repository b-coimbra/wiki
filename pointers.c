#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main()
{
    int num;
    int *pi = &num; // pointer to integer, stores the address of the variable it points to (num)

    // or
    int num;
    intptr_t *pi = (intptr_t*)&num; // uintptr_t for unsigned types

    // pointer addition or any other mathematical operation is treated with the size of the data type

    int num = 5;
    int *pi = &num;

    printf("%d", num); // 5
    printf("%p", *pi+1); // if the address is 100 (as an example) pi+1 would be 104, because integers are 4 bytes

    *pi = 10; // dereferencing: changing the value of the variable it points to

    printf("%d", num); // 10

    // memory allocation

    /*
        malloc      allocates memory from the heap
        realloc     reallocates memory to a larger or smaller ammount
        calloc      allocates and zeros out memory from the heap
        free        returns a block of memory to the heap
    */

    int *pi = (int*) malloc(sizeof(int)); // allocating 4 bytes of memory into the stack
    // while casting is not necessary anymore, it is good practice because of compatibility with c++ (which requires explicit cast)
    *pi = 5;
    printf("%d", *pi); // 5
    free(pi); // free the memory when it's no longer needed

    // another example

    char *name = (char*) malloc(strlen("john") + 1); // 1 is the NULL terminator (\0)
    strcpy(name, "john");
    while(*name != 0) {
        printf("%c\n", name);
        *name++;
    }

    // or

    char *name = (char*) malloc(sizeof(char));
    name = "john";

    for (size_t i = 0; i < strlen(name); i++)
        printf("%c\n", name[i]);

    free(name); // it's not needed to free the memory when the program is terminating, but it may be a good habit
    name = NULL; // invalid pointer, avoids dereferencing and runtime exceptions

    // malloc will return NULL if it is unable to allocate memory, it is good practice to do so:
    if (pi != NULL)
        //good
    else
        //bad
    
    /***************************/
    /***************************/




    return 0;
}