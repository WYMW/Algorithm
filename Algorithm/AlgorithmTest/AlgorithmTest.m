//
//  AlgorithmTest.m
//  AlgorithmTest
//
//  Created by YmWw on 2021/7/17.
//

#import <XCTest/XCTest.h>
#import "MergeSort.h"
#import "HeapSort.h"
#import "QuicklySort.h"
@interface AlgorithmTest : XCTestCase

@end

@implementation AlgorithmTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testMergeSort {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@(3), @(9), @(2), @(8), @(1), @(7), @(6), @(10)]];
    [MergeSort testMerge:array];
    NSArray *result = [NSArray arrayWithArray:array];
    NSArray *sortArray = @[@(1), @(2), @(3),@(6), @(7), @(8),@(9), @(10)];
    BOOL success = YES;
    for (int i = 0; i < [sortArray count]; i++) {
        if ([result[i] doubleValue] != [ sortArray[i] doubleValue]) {
            success = NO;
            break;
        }
    }
    XCTAssertTrue(success, @"排序失败");
    
    NSMutableArray *array2 = [[NSMutableArray alloc] initWithArray:@[@(0), @(0), @(2), @(9), @(1), @(7), @(6), @(10)]];
    [MergeSort testMerge:array2];
    NSArray *result2 = [NSArray arrayWithArray:array2];
    NSArray *sortArray2 = @[@(0), @(0), @(1),@(2), @(6), @(7),@(9), @(10)];
    success = YES;
    for (int i = 0; i < [sortArray2 count]; i++) {
        if ([result2[i] doubleValue] != [ sortArray2[i] doubleValue]) {
            success = NO;
            break;
        }
    }
    
    XCTAssertTrue(success, @"排序失败");
}

- (void)testHeapSort {
    [HeapSort testHeapify];
}

- (void)testQuickSort {
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@(2), @(8), @(7), @(1), @(3), @(5), @(6), @(4)]];
    [QuicklySort quicklySort:array start:0 end:[array count] - 1];
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@", array[i]);
    }
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
