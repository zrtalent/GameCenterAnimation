//
//  NSArray+WF.m
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "NSArray+WF.h"

@implementation NSArray (WF)
- (NSArray *)getRandomArray
{
    NSMutableArray *rdmArray = [NSMutableArray array];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        unsigned int rdmIndex = arc4random_uniform((u_int32_t)rdmArray.count + 1);
        [rdmArray insertObject:obj atIndex:rdmIndex];
    }];
    NSLog(@"!!%@", rdmArray);
    return rdmArray;
}
@end
