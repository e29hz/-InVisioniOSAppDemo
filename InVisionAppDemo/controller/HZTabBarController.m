//
//  HZTabBarController.m
//  MobileBlogDemo
//
//  Created by 鄂鸿桢 on 16/8/29.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZTabBarController.h"
#import "HZLaunchPadViewController.h"
#import "HZMyProjectsViewController.h"

#define HZRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface HZTabBarController ()<UITabBarControllerDelegate>

@end

@implementation HZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addAllChildViewControllers];
    
}

- (void)addAllChildViewControllers {
    HZLaunchPadViewController *launchPad = [[HZLaunchPadViewController alloc] init];
    [self addOneChildVc:launchPad title:@"LAUNCHPAD" imageName:@"tabbar_home"];
    
    HZMyProjectsViewController *myProject = [[HZMyProjectsViewController alloc] init];
    [self addOneChildVc:myProject title:@"MY PROJECTS" imageName:@"tabbar_message_center"];
    
    UIViewController *compose = [[UIViewController alloc] init];
    [self addOneChildVc:compose title:@"COMPOSE" imageName:@"tabbar_compose_icon_add_highlighted@2x"];
    
    UIViewController *discover = [[UIViewController alloc] init];
    [self addOneChildVc:discover title:@"DISCOVERY" imageName:@"tabbar_discover"];
    
    UIViewController *profile = [[UIViewController alloc] init];
    [self addOneChildVc:profile title:@"PROFILE" imageName:@"tabbar_profile"];
}

+ (void)initialize {
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:245/255.0 green:7/255.0 blue:67/255.0 alpha:1.0]];
}

//- (void)viewWillAppear:(BOOL)animated {
//    for (UITabBarItem *tabBarItem in self.tabBar.items) {
//        tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 10);
//    }
//}

- (void)addOneChildVc:(UIViewController *)childVc
                title:(NSString *)title
            imageName:(NSString *)imageName {
    childVc.view.backgroundColor = HZRandomColor;
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:childVc];

    [self addChildViewController:navVc];
    navVc.tabBarItem.title = @"";
    navVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 20);
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

}

@end
