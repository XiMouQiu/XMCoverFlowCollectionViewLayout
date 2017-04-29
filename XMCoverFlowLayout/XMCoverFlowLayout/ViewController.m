//
//  ViewController.m
//  XMCoverFlowLayout
//
//  Created by qiuximou on 16/5/8.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import "ViewController.h"
#import "XMCoverFlowLayout.h"
#import "XMCollectionViewCell.h"


@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,collectionviewCellHeightDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray * heightArray;
@end

@implementation ViewController

#pragma mark lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //传固定高度，在实际应用中，在获得数据之后提前计算好高度存入数组，可提高滑动的体验
    self.heightArray = @[@(123),@(133),@(133),@(140),@(145),@(115),@(160)];
    XMCoverFlowLayout * layout = [[XMCoverFlowLayout alloc]init];
    layout.delegate = self;
    layout.numberOfColum = 2;
    layout.cellPadding = 10;
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XMCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"XMCollectionViewCell"];
    [[NSRunLoop currentRunLoop] addTimer:nil forMode:NSDefaultRunLoopMode];
    NSLog(@"this is test git command");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XMCollectionViewCell" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    //    if (indexPath.row % 2 == 0) {
    //        cell.label.backgroundColor = [UIColor redColor];
    //    }
    return cell;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView heightForPhotoAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.heightArray[indexPath.row] integerValue];
}


@end
