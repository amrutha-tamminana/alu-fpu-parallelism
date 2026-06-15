#include <time.h>
#include <stdio.h>
int main(void){
        int m;
        int n;
        int p;
        scanf("%d",&m);
        scanf("%d",&n);
        scanf("%d",&p);
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
clock_t start = clock();
        for(int i=0;i<m;i++){
                for(int j=0;j<p;j++){
			float arr[n];
                        for(int k=0;k<n;k++){
				
				arr[k]=(float)a[i][k]*(float)b[k][j];
                        }
			for(int k=1;k<n;k++){
				arr[k]=arr[k-1]+arr[k];
			}
			r[i][j]=(int)arr[n-1];
                }
        }
clock_t end = clock();

    double time_taken = (double)(end - start) / CLOCKS_PER_SEC;
    printf("Execution time: %.6f seconds\n", time_taken);
        return 0;
}
