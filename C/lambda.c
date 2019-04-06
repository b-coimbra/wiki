#include <stdio.h>

#define $(return_type, ...)                     \
    ({                                          \
        return_type __fn__ __VA_ARGS__          \
            __fn__;                             \
    })

int main()
{
    int (*max)(int, int) = $ (int, (int a, int b) { return a > b ? a : b; });

    printf("%d", max(4, 5));
}

