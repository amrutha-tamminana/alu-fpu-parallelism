#include <stdio.h>
int main() {
    int n = 100000; // 50 million elements
printf("%d\n",n);
    for(int i=0;i<n;i++){
int k=i%100;
printf("%d ",k);
}
    return 0;
}
