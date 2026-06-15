#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define N 10000

int main(void) {
    int arr[N];

    // Fill the array with 0 to N-1
    for (int i = 0; i < N; i++)
        arr[i] = i;

    // Seed random number generator
    srand(time(NULL));

    // Fisher–Yates shuffle for random unique values
    for (int i = N - 1; i > 0; i--) {
        int j = rand() % (i + 1);
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }

    // Open file to write
    FILE *fp = fopen("input.txt", "w");
    if (!fp) {
        printf("Error creating file\n");
        return 1;
    }

    // Write all numbers separated by spaces
    for (int i = 0; i < N; i++)
        fprintf(fp, "%d ", arr[i]);

    fclose(fp);
    printf("✅ File 'input.txt' created with %d unique integers.\n", N);

    return 0;
}
