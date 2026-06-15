#include <stdio.h>
#include <time.h>
#include <time.h>

#define n 100000
#define repeats 1000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
int main() {

    long long int int_arr[n];
    double double_arr[n];
    for (long long int i = 0; i < n; i++){
        scanf("%lld", &int_arr[i]);
    }
    double double_target;
    long long int int_target;
    scanf("%lld", &int_target);

    for(long long int i = 0; i < n; i++){
	double_arr[i] = (double)int_arr[i];
    }

    double_target = (double)int_target;

    long long int l = 0, r = n - 1;
    long long int ans = -1;
    long long int dummy =0;
    double start = now();
    for(long long int i=0 ;i<repeats;i++){
         l = 0;
         r = n - 1;
         ans = -1;
         dummy += 1;
         while (l <= r) {
                long long int mid = l + (r - l) / 2;
                if (double_arr[mid] == double_target) {
                        ans = mid;
                        break;
                } else if (double_arr[mid] < double_target) {
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
