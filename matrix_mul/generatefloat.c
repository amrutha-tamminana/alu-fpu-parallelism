#include <stdio.h>
int main() {
    int i, j;
    float val;
    // --- Matrix A: 1000x100 ---
    for (i = 0; i < 800; i++) {
        for (j = 0; j < 900; j++) {
            val = (float)((i + j) % 50);
            printf("%.2f ", val);
        }
        printf("\n");
    }
    printf("\n"); // Blank line between matrices
    // --- Matrix B: 100x1000 ---
    for (i = 0; i < 900; i++) {
        for (j = 0; j < 800; j++) {
            val = (float)((2 * i + 3 * j) % 50);
            printf("%.2f ", val);
        }
        printf("\n");
    }

    return 0;
}
