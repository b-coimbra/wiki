#include <stdio.h>
#include <stdint.h>

#define len(n) (sizeof(n) / sizeof(n[0]))

#define forEach(i, a) for (uint32_t i = 0; i <= len(a); i++)

int main()
{
    const int S = 2; // size

    int A[S][S],
        B[S][S],
        C[S][S];

    for (int l = 0, size = (S * 2); l < size; l++) {
        for (int c = 0; c < S; c++) {
            printf("\e[41m %c \e[0m\e[42m[%dx%d]\e[0m : ", (l < S ? 'A' : 'B'), l+1, c+1);

            scanf("%d", ((l < S)
                   ? &A[l][c]
                   : &B[l][c]));
        }
    }

    puts("\nMatrix C:");
    for (int i = 0; i < S; i++) {
        for (int k = 0; k < S; k++) {
            C[i][k] = A[i][k] + B[i][k];

            printf("%3d |", C[i][k]);
        }

        printf("\n");
    }

    int ds = 0;

    for (int i = 0, j = 2; i < S; i++, j--)
        ds += C[i][j];

    printf("DS: %d", ds);

    /* for (int i = 0, k = 0; i < 4; (i <= 2 ? (i++, k++) : (k = 0))) { */
    /*     printf("%3d |", A[i][k]); */
    /* } */

    return 0;
}
