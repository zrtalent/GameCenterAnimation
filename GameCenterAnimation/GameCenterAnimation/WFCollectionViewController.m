//
//  WFCollectionViewController.m
//  Quan
//
//  Created by 开发者 on 15/3/10.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "WFCollectionViewController.h"
#import "WFCollectionViewCell.h"

@interface WFCollectionViewController () <UICollectionViewDelegate>
@property (nonatomic, assign) NSInteger currPage;
@property (nonatomic, strong) WFCollectionViewCell *currCell;
@end

@implementation WFCollectionViewController

static NSString * const reuseIdentifier = @"WFCollectionViewCell";

+ (instancetype)newsController
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置滚动方向为水平
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    // 设置item大小
    flowLayout.itemSize = [UIScreen mainScreen].bounds.size;
    // 设置item间距
    flowLayout.minimumLineSpacing = 0;
    
    return [[WFCollectionViewController  alloc] initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"WFCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    // 是否分页显示
    self.collectionView.pagingEnabled = YES;
    // 取消显示水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = FALSE;
    // 去除回弹效果
    self.collectionView.bounces = FALSE;

}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WFCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.tag = indexPath.item;
    [cell assembleSubViewsWithScale:1];
    // Configure the cell
//    [cell assembleSubViews];
    return cell;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
        WFCollectionViewCell *currCell = self.collectionView.visibleCells[0];
//        [currCell assembleSubViews];
        [currCell endAnimation];
//        NSLog(@"%ld", self.collectionView.subviews.count);
    
}

// 结束滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
//     1.计算当前滚动到得页码
//    static NSInteger prevPage = 0;
//    NSInteger currPage = scrollView.contentOffset.x / self.view.bounds.size.width;
//    if(currPage != prevPage)
//    {
//        WFCollectionViewCell *currCell = [self.collectionView.visibleCells lastObject];
//        [currCell disperseSubViews];
//        prevPage = currPage;
//    }
    _currPage = scrollView.contentOffset.x / self.view.bounds.size.width;
    WFCollectionViewCell *currCell = [self.collectionView.visibleCells lastObject];
    [currCell beginAnimation];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    /*CGFloat offset = (NSInteger)self.collectionView.contentOffset.x % screenWidth;
    WFCollectionViewCell *firstCell = [self.collectionView.visibleCells firstObject];
    WFCollectionViewCell *secondCell = [self.collectionView.visibleCells lastObject];
    
    WFCollectionViewCell *currCell;
    WFCollectionViewCell *nextCell;
    if(firstCell.tag != secondCell.tag)
    {
        if ((firstCell.tag == _currPage)){
            currCell = firstCell;
            nextCell = secondCell;
        }
        else
        {
            currCell = secondCell;
            nextCell = firstCell;
        }
        
        _currCell = nextCell;
        
        CGFloat scale = (CGFloat)((NSInteger)(offset - 0.01) % (screenWidth / 2)) / (screenWidth / 2);
        
        if(MIN(firstCell.tag, secondCell.tag) < _currPage)
        {
            // 往右滑
            if((offset < screenWidth / 2))
            {
                [nextCell assembleSubViewsWithScale:scale];
            }
            else
            {
                [currCell assembleSubViewsWithScale:(1 - scale)];
            }
        }
        else
        {
            // 往左滑
            if((offset < screenWidth / 2))
            {
                [currCell assembleSubViewsWithScale:scale];
            }
            else
            {
                [nextCell assembleSubViewsWithScale:(1 - scale)];
            }
        }

    }
    */
    NSInteger screenWidth = [UIScreen mainScreen].bounds.size.width;
    NSInteger offset = ABS(self.collectionView.contentOffset.x - _currPage * screenWidth);
    
    WFCollectionViewCell *currCell;
    WFCollectionViewCell *nextCell;
    WFCollectionViewCell *firstCell = [self.collectionView.visibleCells firstObject];
    WFCollectionViewCell *secondCell = [self.collectionView.visibleCells lastObject];

    if ((firstCell.tag == _currPage)){
        currCell = firstCell;
        nextCell = secondCell;
    }
    else
    {
        currCell = secondCell;
        nextCell = firstCell;
    }
    
    [currCell assembleSubViewsWithScale: MIN(((CGFloat)offset / screenWidth * 2), 1)];
    [nextCell assembleSubViewsWithScale: MIN((2.0 - (CGFloat)offset / screenWidth * 2), 1)];

}
@end
