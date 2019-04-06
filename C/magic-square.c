#include <stdio.h>
#include <stdlib.h>
#include <locale.h>

void terminate() {
    puts("Cubo não é magico!");
    exit(0);
}

int main()
{
    setlocale(LC_ALL, "");

    int x, y;

    printf("Entre a ordem da matrix (x y): ");
    scanf("%d %d", &x, &y);

    if (x != y) terminate();

    int mat[x][y], pd_sum = 0, sd_sum = 0, c_sum = 0, r_sum = 0;

    for (int i = 0; i < x; i++)
        for (int j = 0; j < x; j++)
            scanf("%d", &mat[i][j]);

    // diagonal primária
    for (int i = 0; i < x; i++)
        for (int n = 0; n < x; n++)
            if (i == n)
                pd_sum += mat[i][n];

    // diagonal secundária
    for (int i = 0, j = (x - 1); i < y; i++, j--)
        sd_sum += mat[i][j];

    if (pd_sum != sd_sum) terminate();
    else {
        // linha e coluna
        for (int i = 0; i < x; i++) {
            r_sum = c_sum = 0;

            for (int n = 0; n < x; n++) {
                r_sum += mat[i][n];
                c_sum += mat[n][i];
            }

            if (r_sum != pd_sum || c_sum != pd_sum) terminate();
        }
    }

    puts("A matriz é um cubo mágico!");

    return 0;
}
