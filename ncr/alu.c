#include <stdio.h>
#include <time.h>
#define repeats 10000000
#include <time.h>
double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
int main() {
    long long int n, r;
    printf("maximum value of n can be 67 when r = n/2, othrwise the overflow occurs\n");
    printf("Enter n: ");
    scanf("%lld", &n);
    printf("Enter r: ");
    scanf("%lld", &r);
    long long result = 1;
    if (r > n) {
        printf("nCr = 0\n");
        return 0;
    }
    if (r == 0 || r == n) {
        printf("nCr = 1\n");
        return 0;
    }
    if (r > n - r)   // nCr = nC(n-r)
        r = n - r;
    long long int dummy = 0;
    double start = now();
    for (long long int k = 0; k < repeats; k++){
	    result = 1;
            dummy += 1;
	    for (int i = 1; i <= r; i++) {
        	result = result * (n - r + i) / i;
    	    }
    }
    double end=now();
    printf("nCr = %lld\n", result);
    printf("Time taken = %.9f seconds\n", end-start);
    printf("%lld\n", dummy);
    return 0;
}
