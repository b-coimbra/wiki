#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct _node {
    void *data;
    struct _node *next;
} Node;

typedef struct _linkedList {
    Node *head;
    Node *tail;
    Node *current;
} LinkedList;

typedef struct _employee {
    char name[32];
    unsigned char age;
} Employee;

typedef void(*DISPLAY)(void*);
typedef int(*COMPARE)(void*, void*);

int compareEmployee(Employee *e1, Employee *e2) {
    return strcmp(e1->name, e2->name);
}

void displayEmployee(Employee *employee) {
    printf("%s\t%d\n", employee->name, employee->age);
}

void initializeList(LinkedList *list)
{
    list->head = NULL;
    list->tail = NULL;
    list->current = NULL;
}

// assign node's "next" pointer to the list head if the linked list is not empty
// holds pointer to void to allow any type of data
void addHead(LinkedList *list, void *data)
{
    Node *node = (Node*) malloc(sizeof(Node));
    node->data = data;

    if (list->head == NULL) {
        list->tail = node;
        node->next = NULL;
    } else {
        node->next = list->head;
    }
    list->head = node;
}

// allocates memory for a new node, assigns data to the "data" field
// the node will be always added to the tail, that's why the "next" field is assigned to NULL
void addTail(LinkedList *list, void *data)
{
    Node *node = (Node*) malloc(sizeof(Node));
    node->data = data;
    node->next = NULL;

    if (list->head == NULL)
        list->head = node;
    else
        list->tail->next = node;

    list->tail = node;
}

// traverses list until a match is found or the list's end is encountered
Node *getNode(LinkedList *list, COMPARE compare, void *data)
{
    Node *node = list->head;
    while (node != NULL) {
        if (compare(node->data, data) == 0)
            return node;
        node = node->next;
    }
    return NULL;
}

// deleting nodes
void delete(LinkedList *list, Node *node) {
    if (node == list->head) {
        if (list->head->next == NULL)
            list->head = list->head = NULL;
        else
            list->head = list->head->next;
    } else {
        Node *tmp = list->head;
        // if the node does not exist in the list
        while (tmp != NULL && tmp->next != node)
            tmp = tmp->next;
        if (tmp != NULL)
            tmp->next = node->next;
    }
    free(node);
}

void displayLinkedList(LinkedList *list, DISPLAY display) {
    puts("Linked list:");
    Node *current = list->head;
    while (current != NULL) {
        display(current->data);
        current = current->next;
    }
}

int main()
{
    LinkedList linkedList;

    Employee *samuel = (Employee*) malloc(sizeof(Employee));
    strcpy(samuel->name, "Samuel");
    samuel->age = 32;

    Employee *sally = (Employee*) malloc(sizeof(Employee));
    strcpy(sally->name, "Sally");
    sally->age = 28;

    Employee *susan = (Employee*) malloc(sizeof(Employee));
    strcpy(susan->name, "Susan");
    susan->age = 45;

    initializeList(&linkedList);

    addHead(&linkedList, samuel);
    addHead(&linkedList, sally);
    addHead(&linkedList, susan);

    displayLinkedList(&linkedList, (DISPLAY)displayEmployee);

    Node *node = getNode(&linkedList,
                         (int (*)(void*, void*))compareEmployee, samuel);
    delete(&linkedList, node);

    return 0;
}
