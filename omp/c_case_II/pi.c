/* File: pi.c
   Source: https://gist.github.com/bbengfort/bf62e3487b9732daebd5
   Purpose: OpenMP parallel Pi computation
   */

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
 
int main (int argc, const char *argv[]) {
 
  int i,j;
  double x;
  double pi, sum = 0.0;
  double start, delta;
 
  long steps = atol(argv[1]);
  int MAX_THREADS = atol(argv[2]);
 
  double step = 1.0/(double) steps;
 
  // Compute parallel compute times for 1-MAX_THREADS
  for (j=1; j<= MAX_THREADS; j++) {
 
    printf(" running on %d threads: ", j);
 
    // This is the beginning of a single PI computation
    omp_set_num_threads(j);
 
    sum = 0.0;
    double start = omp_get_wtime();
 
#pragma omp parallel for reduction(+:sum) private(x)
    for (i=0; i < steps; i++) {
      x = (i+0.5)*step;
      sum += 4.0 / (1.0+x*x);
    }
 
    // Out of the parallel region, finalize computation
    pi = step * sum;
    delta = omp_get_wtime() - start;
    printf("PI = %.16g computed in %.4g seconds\n", pi, delta);
  }
}