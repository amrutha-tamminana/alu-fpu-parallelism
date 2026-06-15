#include <stdio.h>
#include <time.h>

#define n 40000
#define repeats 10000000

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main() {

    long long int arr[n];
    double arr_d[n];
    long long int target;
    double d_target;
    for (long long int i = 0; i < n; i++){
        scanf("%lld", &arr[i]);
 	arr_d[i] = (double)arr[i];
    }

    scanf("%lld", &target);
    d_target = (double)target;
    long long int ans;
    double start = now();

    for (long long int r = 0; r < repeats; r++) {

        long long int low = 0;
        long long int high = n - 1;
	ans = -1;
        while (low <= high) {

            long long int mid1 = low + (high - low) / 3;
            long long int mid2 = high - (high - low) / 3;

            if (d_target == arr_d[mid1]) {
		ans = mid1;
                break;
            }

            if (d_target == arr_d[mid2]) {
		ans = mid2;
                break;
            }

            if (d_target < arr_d[mid1]) {
                high = mid1 - 1;
            }
            else if (d_target > arr_d[mid2]) {
                low = mid2 + 1;
            }
            else {
                low = mid1 + 1;
                high = mid2 - 1;
            }
        }
    }

    double end = now();
    printf("time = %f sec\n", end - start);
    if(ans != -1){
	printf("target found at index %lld", ans);
    }
    else{
	printf("target not found");
    }
 
    return 0;
}
