//
//  QuicklySort.h
//  Algorithm
//
//  Created by Appbi on 2021/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuicklySort : NSObject
+ (NSInteger)partition:(NSMutableArray *)array start:(NSInteger)start end:(NSInteger)end;
+ (void)quicklySort:(NSMutableArray *)array start:(NSInteger)start end:(NSInteger)end;
@end

NS_ASSUME_NONNULL_END
