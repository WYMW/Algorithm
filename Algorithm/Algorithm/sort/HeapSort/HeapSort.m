//
//  HeapSort.m
//  Algorithm
//
//  Created by YmWw on 2021/7/18.
//

#import "HeapSort.h"
#import <math.h>
@implementation HeapSort

+ (void)maxHeapify:(NSMutableArray *)arry index:(NSInteger)index end:(NSInteger)end {
    NSInteger left = index * 2 + 1;
    NSInteger right = index * 2 + 2;
    NSInteger large = index;
    if (left < end && [arry[left] isGreaterThan: arry[large]]) {
        large = left;
    }
    if (right < end && [arry[right] isGreaterThan: arry[large]] ) {
        large = right;
    }
    if (large != index) {
        id t = arry[large];
        arry[large] = arry[index];
        arry[index] = t;
        [HeapSort maxHeapify:arry index:large end:end];
    }
}

+ (void)testHeapify {
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@(6),@(8),@(5),@(7),@(4),@(2), @(80),nil];
    [HeapSort heapSort:array];
}

+ (void)generateBigHeap:(NSMutableArray *)array end:(NSInteger)end {
    int deep = floor(log2(end)) + 1;
    int start = pow(2, deep - 1) - 2;
    for (int i = start; i >= 0; i--) {
        [HeapSort maxHeapify:array index:i end:end];
    }
}

+(void)heapSort:(NSMutableArray *)array {
    for (NSUInteger i = array.count; i > 0; i--) {
        [HeapSort generateBigHeap:array end:i];
        id t = array[0];
        array[0] = array[i - 1];
        array[i - 1] = t;
    }
    for (int i = 0; i < [array count]; i++) {
        NSLog(@"%@", array[i]);
    }
    
}

@end
