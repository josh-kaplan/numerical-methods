/**
 * newton1d.c
 * 
 * Josh Kaplan
 * 
 * This is a generic implementation of Newton's Method in 1-dimension.
 * Edit the function, f, and it's derivative, df, for your specific problem.
 * 
 * Compile: run "make newton1d" or "gcc newton1d.c -o newton1d"
 * Execute: run "./newton1d" 
 */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/**
 * This is our function who's root we want to find.
 */
double f(double x)
{
    return 2.0*powf(x,2.0) - 32.0;
}

/**
 * This is the derivative of the function, f, who's root we want to find.
 */
double df(double x)
{
    return 4*x;
}


int main(void)
{
    int i;
    int N;
    double X;
    double TOL;
    double F;
    double DF;

    // Newton's Method Parameters
    X   = 10.0;                 // Initial guess   
    N   = 1000;                 // Maximum Iterations
    TOL = 1e-3;                 // Tolerance

    // Newton's Method
    for (i = 0; i < N; i++)
    {
        F  = f(X);              // Function f(x)
        DF = df(X);             // Derivative f'(x) 
        X  = X - F/DF;          // New guess
        if (fabs(F) < TOL)      // If close enough
            break;              // break
    }
    // Display results
    printf("Converged to %6.4f in %d iterations\n", X, i);
}
