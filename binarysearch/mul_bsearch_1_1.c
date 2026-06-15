// dual_pipeline_bsearch.c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 1000000
#define REPEATS 10000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main() {
    static long long arr[N];
    static double arr_fp[N];

    long long target1;
    double target2;

    // read input
    for (long long i = 0; i < N; i++) {
        if (scanf("%lld", &arr[i]) != 1) return 1;
        arr_fp[i] = (double)arr[i];  // one-time conversion, not in loop
    }
    scanf("%lld", &target1);
    scanf("%lf", &target2);

    long long ans1 = -1;
    long long ans2 = -1;
    long long dummy = 0;

    double start = now();

    for (long long rep = 0; rep < REPEATS; rep++) {
        long long l1 = 0, r1 = N - 1;
        long long l2 = 0, r2 = N - 1;
        ans1 = ans2 = -1;
        dummy++;

        while (l1 <= r1 || l2 <= r2) {
            // ---- ALU pipeline (integer) ----
            if (l1 <= r1) {
                long long mid1 = (l1 + r1) >> 1;
                long long val1 = arr[mid1];
                if (val1 == target1) { ans1 = mid1; l1 = r1 + 1; }
                else if (val1 < target1) l1 = mid1 + 1;
                else r1 = mid1 - 1;
            }

            // ---- FPU pipeline (double) ----
            if (l2 <= r2) {
                long long mid2 = (l2 + r2) >> 1;
                double val2 = arr_fp[mid2];
                if (val2 == target2) { ans2 = mid2; l2 = r2 + 1; }
                else if (val2 < target2) l2 = mid2 + 1;
                else r2 = mid2 - 1;
            }
        }
    }

    double end = now();
    printf("%lld\n", dummy);
    printf("%.9lf\n", end - start);

    if (ans1 == -1) printf("target1 not found\n");
    else printf("target1 at %lld\n", ans1);

    if (ans2 == -1) printf("target2 not found\n");
    else printf("target2 at %lld\n", ans2);

    return 0;
}
