#include <stdio.h>
#include <time.h>

// high-resolution timer
double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

// inline function for floating-point modulo
static inline double fp_mod(double a, double b) {
    return a - b * (double)((long long)(a / b));
}

int main() {
    long long start, end;

    printf("Enter the range: ");
    scanf("%lld %lld", &start, &end);

    long long count = 0;
    long long num = start;

    double begin = now();
    while(num <= end) {
        if(num <= end) {
            int isPrime = 1;
            if(num <= 1) isPrime = 0;
            else if(num <= 3) isPrime = 1;
            else if(num % 2 == 0 || num % 3 == 0) isPrime = 0;
            else {
                for(long long i = 5; i*i <= num; i += 6) {
                    if(num % i == 0 || num % (i+2) == 0) {
                        isPrime = 0;
                        break;
                    }
                }
            }
            if(isPrime) count++;
        }
        if(num + 1 <= end) {
            double nd = (double)(num + 1);
            int isPrimeF = 1;
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
        }
        num += 2;
    }
    double completed = now();

    printf("Total primes found: %lld\n", count);
    printf("Time taken: %.9f seconds\n", completed - begin);

    return 0;
}
