#include <stdio.h>
#include <time.h>
double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}
int main(void){
        int n;
        scanf("%d",&n);
        long long p=1;
	long long repeats=10000000;
	long long dummy=0;
double start=now();
	for(int r=0;r<repeats;r++){
		p=1;
	        for(int i=1;i<=n;i++){
        	        p*=i;
        	}
		dummy++;
	}
double end=now();
double time=end-start;
	printf("Dummy=%lld\n",dummy);
        printf("%lld\n",p);
	printf("%.9lf\n",time);
        return 0;
}


