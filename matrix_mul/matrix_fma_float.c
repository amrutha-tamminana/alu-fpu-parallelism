#include <math.h>
#include <time.h>
#include <stdio.h>
int main(void){
        int m;
        int n;
        int p;
        scanf("%d",&m);
        scanf("%d",&n);
        scanf("%d",&p);
        float a[m][n];
        float b[n][p];
        int r[m][p];
        for(int i=0;i<m;i++){
                for(int j=0;j<p;j++){
                        r[i][j]=0;
                }
        }
        for(int i=0;i<m;i++){
                for(int j=0;j<n;j++){
                        scanf("%.2f",&a[i][j]);
                }
        }
        for(int i=0;i<n;i++){
                for(int j=0;j<p;j++){
                        scanf("%.2f",&b[i][j]);
                }
        }
clock_t start = clock();
        for(int i=0;i<m;i++){
                for(int j=0;j<p;j++){
                        for(int k=0;k<n;k++){
                                r[i][j]=fmaf(a[i][k], b[k][j], r[i][j]);
				r[i][j]=(int)r[i][j];
                        }
                }
        }
 clock_t end = clock();
 double time_taken = (double)(end - start) / CLOCKS_PER_SEC;
printf("Execution time: %.6f seconds\n", time_taken);
        return 0;
}
