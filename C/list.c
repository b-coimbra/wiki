#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
  int data;
  struct node_t *next;
} Node;

Node *create(int data)
{
  Node *new = (Node*) malloc(sizeof(Node));

  new->data = data;
  new->next = NULL;

  return new;
}

Node *insert(Node *head, int data)
{
  Node *new = create(data);

  if (new == NULL) {
    head = new;
    return head;
  }

  new->next = head;
  head = new;

  return head;
}

Node *locate(Node *head, int data)
{
  Node *aux = head;

  while (aux->data != data)
    aux = aux->next;

  return aux;
}

void append(Node **head, int data)
{
  Node *tail = *head;
  Node *new = create(data);

  while (tail->next != NULL)
    tail = tail->next;

  tail->next = new;
}

void insertAt(Node **head, int location, int data)
{
  Node *new = create(data);
  Node *found = locate(*head, location);

  new->next = found->next;
  found->next = new;
}

void show(Node *head)
{
  for (Node *i = head; i != NULL; i = i->next)
    printf("%d\n", i->data);
}

int main()
{
  Node *head = NULL;

  head = insert(head, 3);
  head = insert(head, 5);
  head = insert(head, 8);

  append(&head, 2);

  /* insertAt(&head, 5, 9); */

  show(head);
}
