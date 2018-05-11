#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <assert.h>

#define len(n) (sizeof(n) / sizeof(n[0]))
#define is_flag(str) strlen(str) == 2 && str[0] == '-'

#define get_arg(s) s[1]

typedef uint32_t u32;

typedef struct {
    char *in, *flags;
} Config;

void help()
{
    printf("You got help!");
}

void verbose()
{
    printf("Verbose mode...");
}

void (*funcs[3]) = { help, verbose };

int main(int argc, char *argv[])
{
    Config config = {
        .in    = argv[1],
        .flags = (char[]) { 'h', 'v', 't' }
    };

    if (is_flag(config.in)) {
        for (u32 i = 0; i < (len(config.flags) + 1); ++i) {
            if (config.in[1] == config.flags[i])
                (*funcs[i])();
        }
    }

    return 0;
}
