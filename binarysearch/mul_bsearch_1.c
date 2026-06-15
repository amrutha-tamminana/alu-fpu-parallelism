#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define n 1000000
#define repeats 10000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main() {
    long long int target1;
    long long int target2;

    static long long int arr[n];
    for (long long int i = 0; i < n; i++)
        scanf("%lld", &arr[i]);

    scanf("%lld", &target1);
    scanf("%lld", &target2);

    long long int l1, r1, ans1;
    double l2, r2, ans2;
    long long int dummy = 0;

    double start = now();

    for (long long int i = 0; i < repeats; i++) {
        l1 = 0; r1 = n - 1; ans1 = -1;
        l2 = 0.0; r2 = (double)(n - 1); ans2 = -1.0;

        dummy += 1;

        while (l1 <= r1 || l2 <= r2) {
            if (l1 <= r1) {
                long long int mid1 = l1 + (r1 - l1) / 2;
                if (arr[mid1] == target1) {
                    ans1 = mid1;
                    l1 = r1 + 1;
                } else if (arr[mid1] < target1)
                    l1 = mid1 + 1;
                else
                    r1 = mid1 - 1;
            }
            if (l2 <= r2) {
                double mid2 = floor(l2 + (r2 - l2) / 2.0 + 0.5);
                long long int mid2_int = (long long int)mid2;

                if (arr[mid2_int] == target2) {
                    ans2 = mid2;
                    l2 = r2 + 1;
                } else if ((double)arr[mid2_int] < (double)target2)
                    l2 = mid2 + 1.0;
                else
                    r2 = mid2 - 1.0;
            }
        }
    }

    double end = now();
    double time_taken = (end - start);

    printf("%lld\n", dummy);
    printf("%.9lf\n", time_taken);

    if (ans1 == -1)
        printf("target1 not found\n");
    else
        printf("target1 is present at %lld\n", ans1);

    if (ans2 == -1.0)
        printf("target2 not found\n");
    else
        printf("target2 is present at %.0lf\n", ans2);

    return 0;
}
