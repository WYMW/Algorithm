//
// Created by Barry on 2021/7/25.
//
#include "stdlib.h"
#include "stdio.h"
#include "math.h"
void merge(int *a, int start, int mid, int end) {
    int n1 = mid - start + 1;
    int n2 = end - mid;
    int *left = (int *) calloc(n1 + 1, sizeof(int));
    int *right = (int *) calloc(n2 + 1, sizeof(int ));
    for (int i = 0; i < n1; ++i) {
        left[i]  = a[start + i];
    }
    left[n1] = INT32_MAX;
    for (int i = 0; i < n2; ++i) {
        right[i] = a[mid + 1 + i];
    }
    right[n2] = INT32_MAX;
    int i = 0;
    int j = 0;
    for (int k = start; k <= end; ++k) {
        if (left[i] <= right[j]) {
            a[k] = left[i];
            i++;
        } else {
            a[k] = right[j];
            j++;
        }
    }
    free(left);
    free(right);
}

void merge_sort(int *a, int start, int end) {
    if (start < end) {
        int mid = start + floor((end - start) / 2);
        merge_sort(a, start, mid);
        merge_sort(a, mid + 1, end);
        merge(a, start, mid, end);
    }
}

int main() {
    int a[8] = { 2, 5, 7, 4, 1, 3, 2, 6 };
    merge_sort(a, 0,  7);
    for (int i = 0; i < 8; ++i) {
        printf("%d ", a[i]);
    }
    printf("\n");

}
