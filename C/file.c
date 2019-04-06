#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <ctype.h>

int main(int argc, char *argv[])
{
    for (size_t i = 0; i < argc; i++) {
        FILE *f = fopen(argv[i], "rt");
        char c;
        if (f == NULL)
            fprintf(stderr, "can't open %s", argv[1]);
        else
            for ( ; c != EOF && isspace(c); c = getc(f))
                printf("%c", c);
        fclose(f);
    }
    return EXIT_SUCCESS;
}