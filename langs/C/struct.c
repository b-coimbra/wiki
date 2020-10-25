#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NAME "Bruno"

typedef struct _person {
    char *name;
    unsigned int age;
} Person;

int main()
{
    Person *person = (Person*)malloc(sizeof(Person));
    person->name = (char*)malloc(strlen(NAME) + 1);
    strcpy(person->name, NAME);
    person->age = 17;

    printf("%s, %d", person->name, person->age);

    return 0;
}