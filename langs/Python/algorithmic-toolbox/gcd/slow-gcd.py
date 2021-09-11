def gcd(a, b):
    best = 0;

    for d in range(1, a + b):
        if d != a and d != b: 
            if a % d == 0 and b % d == 0:
                best = d

    return best

print(gcd(10, 4))
