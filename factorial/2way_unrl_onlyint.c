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
        long long p2=1;
        long long dummy=0;
double start=now();
        for(int r=0;r<repeats;r++){
                p=1;
                p2=1;
                for(int i=2;i<=n;i+=2){
                        p*=i;
                        p2*=(i-1);
                }
                dummy++;
        }
        long long ans=p*p2;
        if(n%2==1) ans*=n;
double end=now();
double time=end-start;
        printf("Dummy=%lld\n",dummy);
        printf("%lld\n",ans);
        printf("%.9lf\n",time);
        return 0;
}
