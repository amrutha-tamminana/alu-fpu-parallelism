#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
int main(){
long long d;
double x;
scanf("%lf",&x);
scanf("%lld",&d);
double *coeff = malloc((d + 1) * sizeof(double));
    for (long long i = 0; i <= d; i++)
        scanf("%lf", &coeff[i]);
    long long mid = d / 2;
    clock_t start1 = clock();
double r1=0.0;
for(long long i=d;i>=mid+1;i--){
r1=fma(r1,x,coeff[i]);
}
double xp=pow(x,mid+1);
clock_t end1 = clock();
clock_t start2=clock();
long long r2=0;
for(long long i=mid;i>=0;i--){
r2=r2*x+coeff[i];
}
double r2f=(double)r2;
double result=fma(r1,xp,r2);
clock_t end2=clock();
double time1=(double)(end1-start1)/CLOCKS_PER_SEC;
double time2=(double)(end2-start2)/CLOCKS_PER_SEC;
double timediff=time1+time2; 
   printf("%.0f\n", result);
printf("%.8f",timediff);
return 0;
}
