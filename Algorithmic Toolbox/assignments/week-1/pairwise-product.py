n = input() # no need to use this
numbers = map(int, input().split())

a, b = sorted(numbers)[-2:]
result = a * b

print(result)
