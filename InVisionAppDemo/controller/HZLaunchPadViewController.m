//
//  HZLaunchPadViewController.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZLaunchPadViewController.h"

@interface HZLaunchPadViewController ()

@end

@implementation HZLaunchPadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (UITabBarItem *tabBarItem in self.tabBarController.tabBar.items) {
        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 30);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
