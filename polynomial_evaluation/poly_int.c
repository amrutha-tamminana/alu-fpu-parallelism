#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main(void) {
    long long d;
    long long x;
    scanf("%lld", &x);
    scanf("%lld", &d);
    long long *coeff = malloc((d + 1) * sizeof(long long));
    if (coeff == NULL) {
        printf("Memory allocation failed\n");
        return 1;
    }
    for (long long i = 0; i <= d; i++) {
        scanf("%lld", &coeff[i]);
    }
    clock_t start = clock();
	//given d is the degree of polynomial
    long long result = coeff[0];
    for (long long i = 1; i <= d; i++) {
        result = result * x + coeff[i];
    }
    clock_t end = clock();
    printf("%lld\n", result);
    double time = (double)(end - start) / CLOCKS_PER_SEC;
    printf("%.8f\n", time);
    free(coeff);
    return 0;
}

