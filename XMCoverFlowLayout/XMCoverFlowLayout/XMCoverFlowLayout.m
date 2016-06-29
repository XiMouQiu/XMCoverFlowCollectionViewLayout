//
//  XMCoverFlowLayout.m
//  collectionViewFlowLayout
//
//  Created by qiuximou on 16/5/8.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import "XMCoverFlowLayout.h"
#define SREENWIDTH [UIScreen mainScreen].bounds.size.width

@implementation XMCoverFlowLayout

- (void)prepareLayout
{
    //在要展示的时候计算好cell 高度，可以提高滑动性能
    float columWidth = (SREENWIDTH -40)/_numberOfColum;
    NSMutableArray * xoffset = [NSMutableArray new];
    for (int i = 0; i < _numberOfColum; i ++) {
        [xoffset addObject:@(columWidth * i)];
    }
    
    NSInteger colum = 0;
    NSMutableArray * yoffset = [NSMutableArray new];
    [yoffset addObject:@(0)];
    [yoffset addObject:@(0)];
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < items; i++) {
        NSIndexPath * path = [NSIndexPath indexPathForItem:i inSection:0];
        NSInteger photoHeight = [self.delegate collectionView:self.collectionView heightForPhotoAtIndexPath:path];
        //计算好cell 高度
        NSInteger cellHeight = photoHeight + self.cellPadding;
        //计算cell frame
        CGRect frame = CGRectMake([xoffset[colum] integerValue] , [yoffset[colum] integerValue] + self.cellPadding , columWidth, cellHeight);
        
        CGRect insetFrame = CGRectInset(frame, _cellPadding, _cellPadding);
        UICollectionViewLayoutAttributes * attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:path];
        attributes.frame = insetFrame;
        //将布局添加到数组中
        [self.attributesArray addObject:attributes];
        _contentHeight = MAX(_contentHeight, CGRectGetHeight(frame));
        NSInteger height = [yoffset[colum] integerValue] + cellHeight;
        [yoffset replaceObjectAtIndex:colum withObject:@(height)];
        colum = colum >= (_numberOfColum - 1)?0: ++colum;
    }
}

- (CGSize)collectionViewContentSize
{
    return CGSizeMake(SREENWIDTH/_numberOfColum, _contentHeight);
}

//- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return nil;
//}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray * layoutAttributes = [NSMutableArray new];
    for (int i = 0; i < self.attributesArray.count; i++) {
        if (CGRectIntersectsRect([self.attributesArray[i] frame], rect)) {
            [layoutAttributes addObject:self.attributesArray[i]];
//            [self layoutAttributesForItemAtIndexPath:nil];
        }
    }
    return layoutAttributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  nil;
}
- (NSMutableArray *)attributesArray
{
    if (!_attributesArray) {
        self.attributesArray = [NSMutableArray new];
    }
    return _attributesArray;
}
@end
