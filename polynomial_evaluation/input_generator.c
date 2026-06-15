#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    long long d = 100000; // CHANGE based on time needed
    long long x = 20000;

    printf("%lld\n", x);
    printf("%lld\n", d);

    srand(time(NULL));
    for (long long i = 0; i <= d; i++) {
        printf("%d ", rand() % 100); // small coefficients
    }
    return 0;
}
