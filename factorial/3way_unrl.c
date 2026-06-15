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
	double pf1=1.0;
        double pf2=1.0;
        long long repeats=10000000;
        long long dummy=0;
double start=now();
        for(int r=0;r<repeats;r++){
                p=1;
		pf1=1.0;
                pf2=1.0;
                for(int i=3;i<=n;i+=3){
                        p*=i;
			pf1*=(i-1);
                        pf2*=(i-2);
                }
                dummy++;
        }
        long long ans=p*(long long)pf1*(long long)pf2;
	if(n%3==1) ans*=n;
	else if(n%3==2) ans = ans*n*(n-1);
double end=now();
double time=end-start;
        printf("Dummy=%lld\n",dummy);
        printf("%lld\n",ans);
        printf("%.9lf\n",time);
        return 0;
}

