#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
    int data;
    struct node_t *next;
} Node;

Node *create(int data, Node *node)
{
    Node *new = (Node*) malloc(sizeof(Node));

    if (new == NULL)
        exit(0);

    new->data = data;
    new->next = node;

    return new;
}

Node *append(int data, Node *node)
{
    if (node == NULL)
        return NULL;

    Node *tail = node;

    while (tail->next != NULL)
        tail = tail->next;

    Node *new  = create(data, NULL);
    tail->next = new;

    return node;
}

void list(Node *node)
{
    for (Node *i = node; i; i = i->next)
        printf("%d\n", i->data);
}

int main()
{
    Node *head = NULL;

    head = create(1, head);

    head = append(5, head);
    head = append(6, head);

    list(head);

    return 0;
}
