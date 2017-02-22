#!/usr/bin/env python
"""
newton_no_deps.py

Josh Kaplan
contact@joshkaplan.org

A script for using Newton's method for solving roots of
a function. Modify the functions f and df which should be the original
function and it's derivative respectively.

Based on the blog post by Daniel Homola found here:
http://danielhomola.com/2016/02/09/newtons-method-with-10-lines-of-python/
"""
from __future__ import print_function, division
import sys
from sympy import *

MAJ = sys.version_info.major
MIN = sys.version_info.minor

# These paramaters may be tweaked to adjust the performance of the program
# TOL   - the tolerance used to test if the answer is "close enough"
# MAX   - the maximum number of iterations before giving up
# GUESS - the initial guess for the root
TOL = 1e-5 
MAX = 1e5   
GUESS = -1   

# Define your symbols, function, and symbol you're solving for.
#M, E, e, p = symbols('M E e p')
#FUNC = E - e*sin(E) - M
#SOLVE_FOR = E

x, y, z = symbols('x y z')
FUNC = x**2 + 2*x
SOLVE_FOR = E

# This is the function being used.
def f(x):
    return FUNC.subs(SOLVE_FOR, x)

# This is the derivative of the function, f.
def df(x):
    return diff(FUNC).subs(SOLVE_FOR, x)


# This is Newton's Method. This should not be changed. 
def newtons_method(f, df, x0, tol):
    x = x0
    for n in xrange(0, int(MAX)):
        x = x - f(x)/df(x)    # This is the heart of Newton's Method
        if abs(0 - f(x)) < tol:  # If within tolerance of zero, stop
            break
    else:
        print('Maximum number of iterations reached.')

    print('Root:       ', x)
    print('f(%.2f) =   ' % x, f(x))
    print('Iterations: ', n)


if __name__ == '__main__':
    newtons_method(f, df, GUESS, TOL)
