#include <stdio.h>
#include <time.h>
#include <time.h>

#define n 1000000
#define repeats 1000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
int main() {
    long long int target;

    long long int arr[n];
    for (long long int i = 0; i < n; i++)
        scanf("%lld", &arr[i]);

    scanf("%lld", &target);

    double l = 0, r = n - 1;
    long long int ans = -1;
    long long int dummy =0;
    double start = now();
    for(long long int i=0 ;i<repeats;i++){
         l = 0.0;
         r = n - 1;
         ans = -1;
         dummy += 1;
         while (l <= r) {
                double mid = l + (r - l) / 2;
                long long int int_mid = (long long int)mid;
                if (arr[int_mid] == target) {
                        ans = int_mid;
                        break;
                } else if (arr[int_mid] < target) {
                        l = mid + 1;
                } else {
                        r = mid - 1;
                }
        }
     }
    double end = now();
    double time_taken = (end - start);
    printf("%lld\n",dummy);
    printf("%.9lf\n",time_taken);
    if(ans == -1){
        printf("target not found");
    }
    else{
        printf("target is present at %lld\n", ans);
    }
    return 0;
}

