#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[])
{
    if (argc > 1)
        for (size_t i = 0; i < strlen(argv[1]); i++)
            printf("%c\n", argv[1][i]);

    return 0;
}