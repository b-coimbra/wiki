#include <stdio.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <conio.h>
#include <dirent.h>

typedef enum { true = 1, false = !true } bool;

#define RED   "\x1b[31m"
#define GREEN "\x1b[32m"
#define BLUE  "\x1b[34m"
#define COLOR_RESET "\x1b[0m"

#define command(cmd) strcmp(name, cmd) == 0

#define PROMPT char cwd[1024];             \
    if (getcwd(cwd, sizeof(cwd)) != NULL); \
        fprintf(stdout, BLUE "%s\n> " COLOR_RESET, cwd);

void clear()
{
    #if defined(__linux__) || defined(__unix__) || defined(__APPLE__)
        system("clear");
    #endif

    #if defined(_WIN32) || defined(_WIN64)
        system("cls");
    #endif
}

void ls(char *loc)
{
    DIR *mydir;
    struct dirent *myfile;
    struct stat mystat;

    char buf[512];
    mydir = opendir(loc);
    while ((myfile = readdir(mydir)) != NULL)
    {
        sprintf(buf, "%s/%s", loc, myfile->d_name);
        stat(buf, &mystat);
        if (mystat.st_size == 0)
            printf(BLUE "[FOLDER]" COLOR_RESET);
        else
            printf(GREEN "[%d KB]" COLOR_RESET, mystat.st_size);
        printf(" %s\n", myfile->d_name);
    }
    closedir(mydir);
}

int main()
{
    char name[256];

    while (true) {
        PROMPT
        gets(name);

        if (command("ls")) ls("./");
        else if (command("clear")) clear();
        else if (command("x") ||
                (command("q") ||
                (command("exit")))) {
            break;
        } else system(name);
    }

    return 0;
}