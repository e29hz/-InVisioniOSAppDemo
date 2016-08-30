//
//  HZMyProjectsViewController.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZMyProjectsViewController.h"

@interface HZMyProjectsViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HZMyProjectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                          style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"myprojects"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row];
    return cell;
}

@end
