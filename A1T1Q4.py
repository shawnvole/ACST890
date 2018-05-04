#!/usr/bin/python
n = int(input("How many terms in the sequence?"))

n1 = 1
n2 = 1
i = 0

if n <= 0:
    print('Please enter a positive integer')
elif n <= 1:
    print('Fibonacci Sequence:')
    print(n1)
else:
    print('Fibonacci Sequence:')
    while i < n:
        print(n1, end= ',')
        n1, n2 = n2, n1+n2
        i += 1
