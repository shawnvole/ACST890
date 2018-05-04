#!/usr/bin/python
import sys

x=float(sys.argv[1])
if x<= 18200:
    t = 0
    a = x-t
    print('The income-tax for', x, 'income is ', t, 'and after-tax income is', a)
elif x<= 37000:
    t = (x-18200)*0.19
    a = x-t
    print('The income-tax for', x, 'income is ', t, 'and after-tax income is', a)
elif x<= 87000:
    t = (x-37000)*0.325+3572
    a = x-t
    print('The income-tax for', x, 'income is ', t, 'and after-tax income is', a)
elif x<=180000:
    t = (x-87000)*0.37+19822
    a = x-t
    print('The income-tax for', x, 'income is ', t, 'and after-tax income is', a)
else:
    t = (x-180000)*0.45+54532
    a = x-t
    print('The income-tax for', x, 'income is ', t, 'and after-tax income is', a)
