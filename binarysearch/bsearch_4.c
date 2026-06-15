#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define N 1000000
#define REPEATS 1000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main() {
    static int arr[N];
    for (int i = 0; i < N; i++)
        arr[i] = i + 1;

    int target = 999999;
    int ans = -1;
    volatile int dummy = 0;

    double start = now();
    for (int rep = 0; rep < REPEATS; rep++) {
        int l = 0;
        int r = N - 1;

        while (l <= r) {
            int mid = l + ((r - l) >> 1);
            int cmp = (arr[mid] < target);
            int eq  = (arr[mid] == target);
            l = cmp ? mid + 1 : l;
            r = cmp ? r : mid - 1;
            ans = eq ? mid : ans;
        }
        dummy += ans;
    }
    double end = now();

    printf("Dummy: %d\n", dummy);
    printf("Time: %.9lf sec\n", end - start);

    if (ans != -1)
        printf("Target found at %d\n", ans);
    else
        printf("Target not found\n");

    return 0;
}
