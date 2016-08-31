//
//  HZMyProjectsViewController.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZMyProjectsViewController.h"
#import "HZProjectTableViewCell.h"

@interface HZMyProjectsViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *nameArray;

@end

@implementation HZMyProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageArray = @[@"IMG_2612", @"IMG_2615", @"IMG_2618", @"IMG_2619", @"IMG_2622"];
    self.nameArray = @[@"BICYCLE", @"CHAIRMAN", @"JAMBE", @"VINES", @"MACHINE"];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                          style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    self.titleLabel.text = @"MY PROJECTS";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 160, 30)];
    [centerView addSubview:self.titleLabel];

    self.navigationItem.titleView = centerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.titleLabel.transform = CGAffineTransformMakeTranslation(-10, 0);
    self.titleLabel.hidden = NO;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.titleLabel.transform = CGAffineTransformMakeTranslation(0, 0);
                     } completion:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.titleLabel.transform = CGAffineTransformMakeTranslation(-50, 0);
                     } completion:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imageArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 240;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HZProjectTableViewCell *cell = (HZProjectTableViewCell *)[[[NSBundle mainBundle]loadNibNamed:@"HZProjectTableViewCell"
                                                                                           owner:self
                                                                                         options:nil] firstObject];
    cell.coverImageView.layer.cornerRadius = 8;
    cell.coverImageView.layer.masksToBounds = YES;
    cell.coverImageView.image = [UIImage imageNamed:self.imageArray[indexPath.row]];
    cell.detailLabel.text = self.nameArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.titleLabel.transform = CGAffineTransformMakeTranslation(-10, 0);
                     } completion:nil];
}

@end
