//
//  HZLaunchPadViewController.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZLaunchPadViewController.h"
#import "HZLanuchCollectionViewCell.h"

@interface HZLaunchPadViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation HZLaunchPadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageArray = @[@"copy",
                        @"facebook",
                        @"instagram",
                        @"line",
                        @"linkin",
                        @"meipai",
                        @"qq",
                        @"qzone",
                        @"sinaweibo",
                        @"twitter",
                        @"wechat",
                        @"wechattimeline"];
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.text = @"LAUNCHPAD";
    self.navigationItem.titleView = self.titleLabel;
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置headerView的尺寸大小
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds
                                                          collectionViewLayout:layout];
    [collectionView registerClass:[HZLanuchCollectionViewCell class] forCellWithReuseIdentifier:@"invision"];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.navigationItem.titleView.hidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self collectionViewDisplayCellAnimaition];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.navigationItem.titleView.hidden = YES;
}

- (void)collectionViewDisplayCellAnimaition {
    for (int i = 0 ;i < self.collectionView.visibleCells.count; i++) {
        HZLanuchCollectionViewCell *cell = self.collectionView.visibleCells[i];
        CGFloat cellY = cell.frame.origin.y;
        int rowCount = (int)((cellY - 30) / 130);
        cell.transform = CGAffineTransformMakeTranslation(0, rowCount * 15);
        
        [UIView animateWithDuration:0.7
                              delay:rowCount * 0.1
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             cell.transform = CGAffineTransformMakeTranslation(0, 0);
                         } completion:nil];
        
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HZLanuchCollectionViewCell *cell = (HZLanuchCollectionViewCell *)[collectionView
                                                                      dequeueReusableCellWithReuseIdentifier:@"invision"
                                                                                                forIndexPath:indexPath];
    [cell.imageView setImage:[UIImage imageNamed:self.imageArray[indexPath.row]]];
    cell.titleLabel.text = self.imageArray[indexPath.row];
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(30, 30, 30, 30);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 15;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout *)collectionViewLayout
    minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 30;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath {
    int rowCount = (int)(indexPath.row / 3);
    cell.transform = CGAffineTransformMakeTranslation(0, rowCount * 15);
    
    [UIView animateWithDuration:0.7
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         cell.transform = CGAffineTransformMakeTranslation(0, 0);
                     } completion:nil];
}

@end
