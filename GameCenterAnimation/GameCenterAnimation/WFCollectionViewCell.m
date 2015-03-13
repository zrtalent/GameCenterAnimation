//
//  WFCollectionViewCell.m
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "WFCollectionViewCell.h"
#import "WFCircleButton.h"

@interface WFCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIView *myView;
@end
@implementation WFCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

CGAffineTransform CGAffineTransformMoveToPoint(CGPoint startPoint, CGPoint endPoint, CGFloat sacle)
{
    return CGAffineTransformMakeTranslation((endPoint.x - startPoint.x) * sacle, (endPoint.y - startPoint.y) * sacle);
}
/**
 *  聚集图标 没用上
 */
- (void)assembleSubViews {
//    [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
//        btn.transform = CGAffineTransformMoveToPoint(btn.initFrame.origin, self.contentView.center, 1);
//
//        [btn endAnimation];
////        btn.center = self.contentView.center;
//    }];
//    [UIView animateWithDuration:0.3 animations:^{
//        [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
//            btn.transform = CGAffineTransformMoveToPoint(btn.center, self.contentView.center);
//        }];
//    }completion:^(BOOL finished) {
//        [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
//            [btn endAnimation];
//        }];
//    }];
//    for(int i = 0; i < self.myView.subviews.count; i++)
//    {
//        UIButton *btn = self.myView.subviews[i];
//        btn.center = self.myView.center;
//        NSLog(@"%@", btn);
//    }
}

- (void)assembleSubViewsWithScale:(CGFloat)scale {
    [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
        btn.transform = CGAffineTransformMoveToPoint(btn.center, self.contentView.center, scale);
        NSLog(@"%@", NSStringFromCGPoint(self.contentView.center));
//        [btn endAnimation];
    }];
}
/**
 *  散开图标
 */
- (void)disperseSubViews {
        [UIView animateWithDuration:0.7 animations:^{
            [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
                btn.transform = CGAffineTransformIdentity;
            }];
        } completion:^(BOOL finished) {
            [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
//                [btn beginAnimation];
            }];
        }];
}

- (void)beginAnimation
{
    [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
        [btn beginAnimation];
    }];
}
- (void)endAnimation
{
    [self.myView.subviews enumerateObjectsUsingBlock:^(WFCircleButton *btn, NSUInteger idx, BOOL *stop) {
        [btn endAnimation];
    }];
}
@end
