#include <stdio.h>

int main() {
    int i, j;

    // --- Matrix A: 1000x500 ---
    for (i = 0; i <800; i++) {
        for (j = 0; j < 900; j++) {
            printf("%.2f ", (i + j) % 50);
        }
        printf("\n");
    }

    printf("\n"); // Blank line between matrices

    // --- Matrix B: 500x1000 ---
    for (i = 0; i < 900; i++) {
        for (j = 0; j < 800; j++) {
            printf("%.2f ", (2 * i + 3 * j) % 50);
        }
        printf("\n");
    }

    return 0;
}
