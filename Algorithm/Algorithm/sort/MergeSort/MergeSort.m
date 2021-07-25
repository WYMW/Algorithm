//
//  MergeSort.m
//  Algorithm
//
//  Created by YmWw on 2021/7/17.
//

#import "MergeSort.h"

@implementation MergeSort

+(void)mergeSort:(NSMutableArray*)array start:(NSInteger)start end:(NSInteger)end {
    if (start >= end) {
        return;
    }
    NSInteger mid = start + (end - start) / 2.0;
    [MergeSort mergeSort:array start:start end:mid];
    [MergeSort mergeSort:array start:mid + 1 end:end];
    [MergeSort merge:array start:start mid:mid+1 end:end + 1];
}

+ (void)merge:(NSMutableArray *)array start:(NSInteger)start mid:(NSInteger)mid end:(NSInteger)end {
    
    NSArray *leftArray = [NSArray arrayWithArray:[array subarrayWithRange:NSMakeRange(start, mid - start)]];
    NSArray *rightArray = [NSArray arrayWithArray:[array subarrayWithRange:NSMakeRange(mid, end - mid)]];
    int i = 0;
    int j = 0;
    for (NSInteger index = 0; index < leftArray.count + rightArray.count; index++) {
        
        if (i < leftArray.count && j < rightArray.count) {
            
            if ([leftArray[i] doubleValue] <= [rightArray[j] doubleValue]) {
                array[index + start] = leftArray[i];
                i++;
            } else {
                array[index + start] = rightArray[j];
                j++;
            }
        } else if (i < leftArray.count) {
            array[index + start] = leftArray[i];
            i++;
        } else {
            array[index + start] = rightArray[j];
            j++;
        }

    }
}

+ (void)testMerge:(NSMutableArray *)array {
    [MergeSort mergeSort:array start:0 end:[array count] - 1];
    for (int i = 0; i < array.count; i++) {
        NSLog(@"===%@", array[i]);
    }
}

@end
