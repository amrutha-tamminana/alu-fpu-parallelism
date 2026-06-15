#include <stdio.h>
#include <time.h>
#include <math.h>

// high-resolution timer
double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

// inline function for FP modulo to avoid fmod library calls
static inline double fp_mod(double a, double b) {
    return a - b * (double)((long long)(a / b));
}

int main() {
    long long start, end;

    printf("Enter the range: ");
    scanf("%lld %lld", &start, &end);

    long long mid = start + (end - start) / 2;  // split range
    long long count = 0;

    long long num_int = start;       // ALU numbers
    double num_double = (double)(mid + 1);  // FPU numbers

    double begin = now();
    while(num_int <= mid || num_double <= (double)end) {
        if(num_int <= mid) {
            int isPrime = 1;
            if(num_int <= 1) isPrime = 0;
            else if(num_int <= 3) isPrime = 1;
            else if(num_int % 2 == 0 || num_int % 3 == 0) isPrime = 0;
            else {
                for(long long i = 5; i*i <= num_int; i += 6) {
                    if(num_int % i == 0 || num_int % (i+2) == 0) {
                        isPrime = 0;
                        break;
                    }
                }
            }
            if(isPrime) count++;
            num_int++;
        }
        if(num_double <= (double)end) {
            int isPrimeF = 1;
            double nd = num_double;
            if(nd <= 1.0) isPrimeF = 0;
            else if(fp_mod(nd, 2.0) == 0.0 || fp_mod(nd, 3.0) == 0.0) isPrimeF = 0;
            else {
                for(double i = 5.0; i*i <= nd; i += 6.0) {
                    if(fp_mod(nd, i) == 0.0 || fp_mod(nd, i+2.0) == 0.0) {
                        isPrimeF = 0;
                        break;
                    }
                }
            }
            if(isPrimeF) count++;
            num_double += 1.0;
        }
    }
    double completed = now();

    printf("Total primes found: %lld\n", count);
    printf("Time taken: %.9f seconds\n", completed - begin);

    return 0;
}
