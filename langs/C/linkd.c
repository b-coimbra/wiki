#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
    int data;
    struct node_t *next;
} Node;

struct node_t *head;

void Insert(int x)
{
    Node *temp = (Node*) malloc(sizeof(Node));

    temp->data = x;
    temp->next = head;

    head = temp;
}

void Print()
{
    Node *temp = head;

    while (temp != NULL) {
        printf("%d\n", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

int main()
{
    head = NULL;

    Insert(3);
    Insert(4);
    Print();

    return 0;
}
