//
//  QuicklySort.m
//  Algorithm
//
//  Created by Appbi on 2021/7/24.
//

#import "QuicklySort.h"

@implementation QuicklySort

+ (NSInteger)partition:(NSMutableArray *)array start:(NSInteger)start end:(NSInteger)end {
    NSInteger changePosition = -1;
    NSNumber *compareNumber = array[end];
    for (NSInteger i = start; i < end; i++) {
        if ([array[i] doubleValue] <= [compareNumber doubleValue]) {
            changePosition += 1;
            NSNumber *t = array[changePosition + start];
            array[changePosition + start] = array[i];
            array[i] = t;
        }
    }
    NSNumber *t = array[changePosition + start + 1];
    array[changePosition + start + 1] = array[end];
    array[end] = t;
    if (changePosition > -1) {
        return changePosition + start + 1;
    }
    return changePosition;
}

+ (void)quicklySort:(NSMutableArray *)array start:(NSInteger)start end:(NSInteger)end {
    NSLog(@"start = %ld, end = %ld", start, end);
    if (start < end) {
        NSInteger p = [QuicklySort partition:array start:start end:end];
        NSLog(@"p = %ld", p);

        [QuicklySort quicklySort:array start:start end:p-1];
        [QuicklySort quicklySort:array start:p + 1 end:end];
    }
}
@end
