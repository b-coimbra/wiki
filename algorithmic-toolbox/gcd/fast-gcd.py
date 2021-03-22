def euclid_gcd(a, b):
    if a == 0: return b
    if b == 0: return a

    if a > b:
        # find gcd of B
        return euclid_gcd(b, a % b)
    else:
        # find gcd of A
        return elucid_gcd(a, b % a)

print(euclid_gcd(357, 234))
