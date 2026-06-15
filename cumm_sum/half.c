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
    long long sum=0;
    double fsum=0.0;
    long long dummy=0;
    long long repeats = 100000;
    for (int i = 0; i < m; i++){
        scanf("%d", &A[i]);
    }
double start_i = now();
for(int r=0; r < repeats; r++){
    	sum=0;
    	fsum=0.0;
    	for (int i = 1; i < m; i+=2){
		sum += A[i];
		fsum+= A[i-1];
	}
    dummy++;
}
double end_i = now();
printf("sum=%lld\n",sum+(long long)fsum);
printf("Dummy=%lld\n",dummy);
printf("Time=%.9lf\n",end_i-start_i);
return 0;
}
