#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

#define repeat(c, n) for (int x = 0; x < n; x++) putchar(c)

#define KEY_UP 72
#define KEY_DOWN 80
#define KEY_LEFT 75
#define KEY_RIGHT 77

#if defined(WIN32) || defined(_WIN32) || defined(__WIN32) && !defined(__CYGWIN__)
    #define CLEAR system("cls")
#else
    #define CLEAR system("clear")
#endif

void map(int size, int row, int column)
{
    for (int axis = 0; axis <= size; axis++) {
        if (axis == 0 || axis == size) {
            printf("%c", '+');
            repeat('-', (size * 2));
            printf("%c\n", '+');
        }
        else if (axis == row) {
            printf("%c", '|');
            repeat(' ', (column * 2));
            printf("%c", 'x');
            repeat(' ', (((size - column) * 2) - 1));
            printf("%c\n", '|');
        }
        else {
            printf("%c", '|');
            repeat(' ', (size * 2));
            printf("%c\n", '|');
        }
    }
}

int main(int argc, char *argv[])
{
    int key = 0,
        size = 15,
        x, y;

    y = x = (size / 2);

    CLEAR;
    map(size, y, x);

    while (1) {
        key = 0;

        switch ((key = getch())) {
        case KEY_UP:
            if (y != 1) y--;
            break;
        case KEY_DOWN:
            if (y != (size - 2)) y++;
            break;
        case KEY_LEFT:
            if (x != 0 ) x--;
            break;
        case KEY_RIGHT:
            if (x != (size - 1)) x++;
            break;
        case 'q':
            exit(1);
        default:
            break;
        }

        CLEAR;
        map(size, y, x);
    }

    return 0;
}