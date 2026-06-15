#include <stdio.h>
#include <stdlib.h>
#include <time.h>

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
    long long int target3;

    long long int arr[n];
    for (long long int i = 0; i < n; i++)
        scanf("%lld", &arr[i]);

    scanf("%lld", &target1);
    scanf("%lld", &target2);
    scanf("%lld", &target3);

    long long int l1 = 0, l2 = 0, l3 = 0, r1 = n - 1, r2 = n - 1, r3 = n - 1;
    long long int ans1 = -1,ans2 = -1,ans3 = -1;
    long long int dummy =0;
    double start = now();
    for(long long int i=0 ;i<repeats;i++){
         l1 =0, l2 =0, l3 = 0;
         r1 = n-1, r2 = n-1, r3 = n - 1;
         ans1 = -1, ans2 = -1, ans3 = -1;
         dummy += 1;
         while (l1 <= r1 || l2 <= r2 || l3 <= r3) {
		if(l1 <= r1){

                        long long int mid1 = l1 + (r1 - l1) / 2;

                        if (arr[mid1] == target1) {
                                ans1 = mid1;
                                l1 = r1 + 1;
                        } else if (arr[mid1] < target1) {
                                l1 = mid1 + 1;
                        } else {
                                r1 = mid1 - 1;
                        }
                }

                if(l2 <= r2){
                         long long int mid2 = l2 + (r2 - l2) / 2;

                        if (arr[mid2] == target2) {
                                ans2 = mid2;
                                l2 = r2 + 1;
                        } else if (arr[mid2] < target2) {
                                l2 = mid2 + 1;
                        } else {
                                r2 = mid2 - 1;
                        }
		}

		if(l3 <= r3){
                         long long int mid3 = l3 + (r3 - l3) / 3;

                        if (arr[mid3] == target3) {
                                ans3 = mid3;
                                l3 = r3 + 1;
                        } else if (arr[mid3] < target3) {
                                l3 = mid3 + 1;
                        } else {
                                r3 = mid3 - 1;
                        }
               }

        }

    }
    double end = now();
    double time_taken = (end - start);
    printf("%lld\n",dummy);
    printf("%.9lf\n",time_taken);
    if(ans1 == -1){
        printf("target1 not found\n");
    }
    else{
        printf("target1 is present at %lld\n", ans1);
    }
    if(ans2 == -1){
        printf("target2 not found\n");
    }
    else{
        printf("target2 is present at %lld\n", ans2);
    }
    if(ans3 == -1){
        printf("target3 not found\n");
    }
    else{
        printf("target3 is present at %lld\n", ans3);
    }
    return 0;
}
