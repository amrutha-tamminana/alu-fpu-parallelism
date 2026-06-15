#include <stdio.h>
#include <arm_neon.h>
#include <time.h>
#define m 800
#define n 900
#define block 64
static int a[m][n];
static int b[n][m];
static int bt[m][n];
static int r[m][m];
int main() {
    	for(int i=0;i<m;i++){
        	for(int j=0;j<n;j++){
            		scanf("%d",&a[i][j]);
		}
	}
	for(int i=0;i<n;i++){
                for(int j=0;j<m;j++){
                        scanf("%d",&b[i][j]);
                }
        }
	for(int i=0;i<n;i++){
		for(int j=0;j<m;j++){
			bt[j][i]=b[i][j];
		}
	}
	for(int i=0;i<m;i++){
		for(int j=0;j<m;j++){
			r[i][j]=0;
		}
	}
    	clock_t start=clock();
    	for(int ii=0;ii<m;ii+=block){
        	for(int jj=0;jj<m;jj+=block){
            		for(int kk=0;kk<n;kk+=block){
                		for(int i=ii;i<ii+block && i<m;i++){
                    			for(int j=jj;j<jj+block && j<m;j++){
                        			float32x4_t vs=vdupq_n_f32(0.0f);//initialise neon register(stores 4 float)
                        			int k;
                        			for(k=kk;k+4<=kk+block && k+4<=n;k+=4){
                            				int32x4_t va=vld1q_s32(&a[i][k]);//load 4 numbers from row of a
                            				int32x4_t vb=vld1q_s32(&bt[k][j]);//load 4 separate numbers from column of b
                            				float32x4_t vfa=vcvtq_f32_s32(va);
                            				float32x4_t vfb=vcvtq_f32_s32(vb);//convert the values in a and b to float
                            				vs=vfmaq_f32(vs,vfa,vfb);//use fma for computation
                        			}
                        			float sum=vgetq_lane_f32(vs,0)+vgetq_lane_f32(vs,1)+vgetq_lane_f32(vs,2)+vgetq_lane_f32(vs,3);
						//extract all 4 partial sums and add them
						//i.e sum=vs[0]+vs[1]+vs[2]+vs[3]
                        			for (;k<kk+block && k<n;k++){
                            				sum+=(float)a[i][k]*(float)b[k][j];
						}
                        			r[i][j]+=(int)sum;//to handle the leftover elements 
						//like if after taking all 4 elements if rest 3 are left this will take care of that part
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
