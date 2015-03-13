//
//  WFCollectionViewCell.h
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFCollectionViewCell : UICollectionViewCell
- (void)assembleSubViews;
- (void)disperseSubViews;

- (void)assembleSubViewsWithScale:(CGFloat)scale;

- (void)beginAnimation;
- (void)endAnimation;
@end
