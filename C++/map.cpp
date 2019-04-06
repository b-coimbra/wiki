#include <iostream>
#include <conio.h>
#include <string>

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
    std::cout << "MAP " << std::string(((size * 2) - 5), ' ') << row << 'x' << column << std::endl;

    for (int axis = 1; axis <= size; axis++) {
        if (axis == 1 || axis == size)
            std::cout << '+' << std::string((size * 2), '-') << '+' << std::endl;
        else if (axis == (row + 1))
            std::cout << '|' << std::string(((column) * 2), ' ') << "\e[31mp\e[0m" << std::string((((size - column) * 2) - 1), ' ') << '|' << std::endl;
        else
            std::cout << '|' << std::string((size * 2), ' ') << '|' << std::endl;
    }
}

int main()
{
    int key = 0,
        size = 15,
        x, y;

    y = x = (size / 2);

    CLEAR;
    map(size, y, x);

    while(1) {
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