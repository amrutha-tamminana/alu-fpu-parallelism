#include <time.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

#define repeats 10000000

int main(void) {
    long long n, r;
    printf("Enter n: ");
    scanf("%lld", &n);
    printf("Enter r: ");
    scanf("%lld", &r);

    if (r > n) {
        printf("nCr = 0\n");
        return 0;
    }
    if (r == 0 || r == n) {
        printf("nCr = 1\n");
        return 0;
    }
    if (r > n - r)
        r = n - r;

    int mid = r / 2;
    int fpuCount = r - mid;

    long long result1 = 1;
    double result2 = 1.0;
    long long dummy = 0;

    // Precompute FPU numerator and denominator
    double *fpuNum = malloc(fpuCount * sizeof(double));
    double *fpuDen = malloc(fpuCount * sizeof(double));
    for (int j = 0; j < fpuCount; j++) {
        fpuNum[j] = (double)(n - r + mid + 1 + j);
        fpuDen[j] = (double)(mid + 1 + j);
    }

    double start = now();
    for (long long rep = 0; rep < repeats; rep++) {
        long long alu_tmp = 1;
        double fpu_tmp = 1.0;

        for (int i = 1; i <= fpuCount; i++) {
            if (i <= mid) {
                long long num = (n - r + i);
                alu_tmp = (alu_tmp * num) / (i);
            }

            fpu_tmp = (fpu_tmp * fpuNum[i-1]) / fpuDen[i-1];
        }

        result1 = alu_tmp;
        result2 = fpu_tmp;
        dummy++;
    }

    double end = now();
    long long finalResult = llround(result1 * result2);
    printf("nCr = %lld\n", finalResult);
    printf("Time = %.9f seconds\n", end - start);
    printf("dummy = %lld\n", dummy);

    free(fpuNum);
    free(fpuDen);

    return 0;
}
