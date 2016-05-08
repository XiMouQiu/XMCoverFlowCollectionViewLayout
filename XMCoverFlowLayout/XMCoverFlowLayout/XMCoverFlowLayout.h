//
//  XMCoverFlowLayout.h
//  collectionViewFlowLayout
//
//  Created by qiuximou on 16/5/8.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol collectionviewCellHeightDelegate <NSObject>

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XMCoverFlowLayout : UICollectionViewLayout
//列数
@property (assign, nonatomic) NSInteger numberOfColum;
//获取每个cell 高度代理
@property (weak, nonatomic) id<collectionviewCellHeightDelegate>delegate;
//cell间距
@property (assign, nonatomic) NSInteger cellPadding;

@property (assign, nonatomic) NSInteger contentHeight;
@property (strong, nonatomic) NSMutableArray * attributesArray;

@end
