#include <stdio.h>
#include <time.h>
double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
int main() {
    int m;
    scanf("%d", &m);
    int A[m];
    int B[m];
    long long dummy=0;
    long long repeats = 100000;
    for (int i = 0; i < m; i++){
	scanf("%d", &A[i]);
	B[i] = A[i];
    }
 double start_i = now();
for(int r=0; r < repeats; r++){
    for (int i = 0; i < m; i++)A[i] = B[i];
//here B[] is just used to prevent optimisation to see the time
    for (int i = 1; i < m; i++)A[i] += A[i-1];
    dummy++;
}
    double end_i = now();
printf("sum=%lld\n",A[m-1]);
printf("Dummy=%lld\n",dummy);
printf("Time=%.9lf\n",end_i-start_i);
return 0;
}
