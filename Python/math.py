#!/usr/bin/env python
# -*- coding: utf-8 -*-

import math

a,b,c = input("Digite os coeficientes separados por vírgula: ")

d = (b**2) - (4*a*c)

if d < 0:
    print "Não há solução real."
elif d == 0:
    x = (-b + math.sqrt(d)) / (2*a)
    print "Há uma solução: " + str(x)
else:
    x1 = (-b + math.sqrt(d)) / (2*a)
    x2 = (-b - math.sqrt(d)) / (2*a)
    print "Hã duas soluções: " + str(x1) + " e " + str(x2)

###########################################################
###########################################################

def sum(a: int,b: int) -> str:
    return a + b

print("A soma é", sum(4,5))

###########################################################
###########################################################

value = input("Qual foi sua nota?")

result = {
  'a': lambda x: x * 5,
  'b': lambda x: x + 7,
  'c': lambda x: x - 2
}[value](x)

###########################################################
###########################################################

def diff21(n):
    if n <= 21:
        return 21 - n
    else:
        return (n - 21) * 2

print diff21(19)
