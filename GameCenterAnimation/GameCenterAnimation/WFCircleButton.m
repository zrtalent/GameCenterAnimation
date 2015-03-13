//
//  WFCircleButton.m
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "WFCircleButton.h"
#import "NSArray+WF.h"

#define DISTANCE 5
@interface WFCircleButton ()


@property (nonatomic, assign)BOOL isInit;
@end
@implementation WFCircleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (void)layoutSubviews
{
    [super layoutSubviews];
    if(CGRectEqualToRect(_initFrame, CGRectZero))
    {
        _initFrame = self.frame;
        NSLog(@"----");
    }
}

- (void) beginAnimation{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
    anim.valueFunction = nil;
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(DISTANCE, DISTANCE)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(DISTANCE, -DISTANCE)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(-DISTANCE, -DISTANCE)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(-DISTANCE, DISTANCE)];
    
    anim.values = @[value1, value2, value3, value4];
    anim.values = [anim.values getRandomArray];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:anim.values];
//    [arr addObject:arr[0]];
    NSValue *curr = [NSValue valueWithCGPoint:CGPointZero];
    [arr insertObject:curr atIndex:0];
    [arr addObject:curr];
    anim.values = arr;
    
    anim.duration = 5.0;
    anim.repeatCount = CGFLOAT_MAX;
    anim.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:anim forKey:@"anim"];
}

- (void)endAnimation{
    [self.layer removeAnimationForKey:@"anim"];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return contentRect;
}
@end
