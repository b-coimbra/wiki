def fib(n):
    items = []

    items.insert(0, 0)
    items.insert(1, 1)

    for i in range(2, n):
        items.insert(i, items[i - 1] + items[i - 2])

    return items[n - 1]

print(fib(100))
