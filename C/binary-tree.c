#include <stdio.h>
#include <stdlib.h>

typedef struct node_t {
  int data;
  struct node_t *left, *right;
} Node;

Node *create(int data) {
  Node *new = (Node*) malloc(sizeof(Node));

  new->data = data;
  new->left = new->right = NULL;

  return new;
};

Node *insert(Node *root, int data)
{
  if (root == NULL)
    return create(data);
  else {
    if (data <= root->data)
      root->left = insert(root->left, data);
    else
      root->right = insert(root->right, data);

    return root;
  }
}

void list(Node *root)
{
  printf("%d\n", root->data);
  if (root->left)
    list(root->left);
  if (root->right)
    list(root->right);
}

int compare(Node *n1, Node *n2)
{
  if (n1 == NULL && n2 == NULL)
    return n1 == n2;

  if (n1->data != n2->data)
    return 1;

  return compare(n1->left, n2->left) && compare(n1->right, n2->right);
}

int main()
{
  Node *root = create(10);

  root->left = create(20);
  root->right = create(30);

  list(root);

  return 0;
}
