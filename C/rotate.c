#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

#define len(x) (sizeof(x) / sizeof(x[0]))
#define forEach(i, vec) \
    for (int i = 0; i < len(vec); i++)

int main()
{
    char ascii[8] = {'|', '/', '-', '\\', '/', '-', '\\'};

    for (int i = 0; i < 10; i++) {
        forEach(y, ascii) {
            printf("%c", ascii[y]);
            Sleep(100);
            printf("\r");
        }
    }

    return 0;
}