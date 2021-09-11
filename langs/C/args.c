#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc > 1)
        for (size_t i = 0; i < argv; i++)
            printf("argv[%d] %s\n", i, argv[i]);
}
