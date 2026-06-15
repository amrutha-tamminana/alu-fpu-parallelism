#include <stdio.h>
#include <time.h>
#define block 64
int main(){
        int m,n,p;
	scanf("%d %d %d",&m,&n,&p);
        int a[m][n];
        int b[n][p];
        int r[m][p];
        for(int i=0;i<m;i++){
                for(int j=0;j<p;j++){
                        r[i][j]=0;
                }
        }
        for(int i=0;i<m;i++){
                for(int j=0;j<n;j++){
                        scanf("%d",&a[i][j]);
                }
        }
        for(int i=0;i<n;i++){
                for(int j=0;j<p;j++){
                        scanf("%d",&b[i][j]);
                }
        }
        clock_t start=clock();
        for(int ii=0;ii<m;ii+=block){
                for(int jj=0;jj<p;jj+=block){
                        for(int kk=0;kk<n;kk+=block){
                                for(int i=ii;i<ii+block&&i<m;i++){
                                        for(int j=jj;j<jj+block&&j<p;j++){
                                                float sum=0.0f;
                                                for(int k=kk;k<kk+block&&k<n;k++){
                                                        sum+=(float)a[i][k]*(float)b[k][j];
                                                }
                                                r[i][j]+=(int)sum;
                                        }
                                }
                        }
                }
        }
        clock_t end=clock();
        double time=(double)(end-start)/CLOCKS_PER_SEC;
        printf("%.8f\n",time);
        return 0;
}
