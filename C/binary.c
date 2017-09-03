#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

char *tobinary(uint32_t x);

int main(void)
{
    int decimal = 0; 
    printf("Value to convert: ");
    scanf("%d", &decimal);

    if (decimal < 0) {
        printf("Incorrect value type.\n");
        return 1;
    }

    char *binary = tobinary(decimal);
    printf("Binary: %s\n", binary);
    free(binary);
}

char *tobinary(uint32_t x)
{
    size_t bits = (x == 0) ? 1 : log10((double) x)/log10(2) + 1;
    char *ret = malloc((bits + 1) * sizeof(char));
    for (size_t i = 0; i < bits ; i++) {
       ret[bits - i - 1] = (x & 1) ? '1' : '0';
       x >>= 1;
    }
    ret[bits] = '\0';
    return ret;
}
