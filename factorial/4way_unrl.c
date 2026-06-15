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
        long long p1=1;
	long long p2=1;
        double pf1=1.0;
        double pf2=1.0;
        long long repeats=10000000;
        long long dummy=0;
double start=now();
        for(int r=0;r<repeats;r++){
                p1=1;
		p2=1;
                pf1=1.0;
                pf2=1.0;
                for(int i=4;i<=n;i+=4){
                        p1*=i;
                        p1*=(i-1);
                        pf1*=(i-2);
			pf2*=(i-3);
                }
                dummy++;
        }
        long long ans=p1*p2*(long long)pf1*(long long)pf2;
        if(n%4==1) ans*=n;
        else if(n%4==2) ans = ans*n*(n-1);
	else if(n%4==3) ans=ans*n*(n-1)*(n-2);
double end=now();
double time=end-start;
        printf("Dummy=%lld\n",dummy);
        printf("%lld\n",ans);
        printf("%.9lf\n",time);
        return 0;
}
