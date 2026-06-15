#include <stdio.h>
#include <time.h>

double now() {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC_RAW, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main() {
    long long start, end;
    long long count = 0;

    printf("Enter the start of the range: ");
    scanf("%lld", &start);

    printf("Enter the end of the range: ");
    scanf("%lld", &end);

    double begin = now();
    for (long long num = start; num <= end; num++) {

        int isPrime = 1;

        if (num <= 1) {
            isPrime = 0;
        }
        else if (num <= 3) {
            isPrime = 1;
        }
        else if (num % 2 == 0 || num % 3 == 0) {
            isPrime = 0;
        }
        else {
            for (long long i = 5; i * i <= num; i += 6) {
                if (num % i == 0 || num % (i + 2) == 0) {
                    isPrime = 0;
                    break;
                }
            }
        }

        if (isPrime)
            count++;
    }
    double completed = now();
    printf("Total prime numbers found between %lld and %lld: %lld\n", start, end, count);
    printf("Time taken = %.9f seconds\n", completed-begin);
    return 0;
}
