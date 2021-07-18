//
//  HeapSort.m
//  Algorithm
//
//  Created by YmWw on 2021/7/18.
//

#import "HeapSort.h"

@implementation HeapSort

+ (void)maxHeapify:(NSMutableArray *)arry index:(NSInteger)index {
    if (2 * index > [arry count]) {
        return;
    }
    [HeapSort maxHeapify:arry index:2 * index];
    if (2 * index <= [arry count]) {
        [HeapSort maxHeapify:arry index: 2 * index + 1];
    }
    
    if (2 * index <= [arry count]) {
        long maxIndex = 2 * index - 1;
        if ([arry[2 * index - 1] doubleValue] < [arry[2 * index] doubleValue]) {
            maxIndex = 2 * index;
        }
        
        if ([arry[index - 1] doubleValue] < [arry[maxIndex] doubleValue]  ) {
            NSNumber *t = arry[index - 1] ;
            arry[index - 1] = arry[maxIndex];
            arry[maxIndex] = t;
        }
    }
}

+ (void)testHeapify {
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@(8),@(6),@(5),@(3),nil];
    [HeapSort maxHeapify:array index:1];
    for (int i = 0; i < [array count]; i++) {
        NSLog(@"%@", array[i]);
    }
    
}

@end
