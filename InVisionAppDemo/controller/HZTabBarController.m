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
#import "HZTabBar.h"
#import "HZProfileSlideView.h"
#import "UIView+Extension.h"

#define HZRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

@interface HZTabBarController ()
<
    UITabBarControllerDelegate,
    HZTabBarDelegate,
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, strong) NSArray<NSString *> *functionArray;
@property (nonatomic, strong) UIButton *maskButton;
@property (nonatomic, strong) HZProfileSlideView *profileSlideView;
@end

@implementation HZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.functionArray = @[@"Profile", @"Push Notifications", @"Feedback", @"Sign Out"];

    [self addCustomTabBar];
    [self addAllChildViewControllers];
    
    UIButton *maskButton = [[UIButton alloc] initWithFrame:self.view.bounds];
    maskButton.backgroundColor = [UIColor grayColor];
    maskButton.alpha = 0;
    [maskButton addTarget:self action:@selector(closeProfileView:) forControlEvents:UIControlEventTouchUpInside];
    maskButton.hidden = YES;
    [self.view addSubview:maskButton];
    self.maskButton = maskButton;
    
    HZProfileSlideView *profileSlideView = [[[NSBundle mainBundle] loadNibNamed:@"HZProfileSildeView" owner:self options:nil] firstObject];
    profileSlideView.frame = CGRectMake(self.view.width, 0, self.view.width * 3 / 4, self.view.height);
    profileSlideView.avatarImageView.layer.cornerRadius = profileSlideView.avatarImageView.frame.size.width / 2;
    profileSlideView.avatarImageView.layer.masksToBounds = YES;
    profileSlideView.tableView.delegate = self;
    profileSlideView.tableView.dataSource = self;
    [self.view addSubview:profileSlideView];
    self.profileSlideView = profileSlideView;
}
- (void)addCustomTabBar {
    HZTabBar *customTabBar = [[HZTabBar alloc] init];
    customTabBar.tabBarDelegate = self;
    [self setValue:customTabBar forKeyPath:@"tabBar"];
}

- (void)addAllChildViewControllers {
    HZLaunchPadViewController *launchPad = [[HZLaunchPadViewController alloc] init];
    [self addOneChildVc:launchPad title:@"" imageName:@"lanuchpad_tabbar_icon"];
    
    HZMyProjectsViewController *myProject = [[HZMyProjectsViewController alloc] init];
    [self addOneChildVc:myProject title:@"" imageName:@"myprojects_tabbar_icon"];
    
    UIViewController *compose = [[UIViewController alloc] init];
    [self addOneChildVc:compose title:@"COMPOSE" imageName:@"tabbar_compose_icon_add_highlighted"];
    
    UIViewController *discover = [[UIViewController alloc] init];
    [self addOneChildVc:discover title:@"DISCOVERY" imageName:@"tabbar_discover"];
}

+ (void)initialize {
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:245/255.0 green:7/255.0 blue:67/255.0 alpha:1.0]];
}

- (void)addOneChildVc:(UIViewController *)childVc
                title:(NSString *)title
            imageName:(NSString *)imageName {
    childVc.view.backgroundColor = HZRandomColor;
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navVc];
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, 20);
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

}

- (void)closeProfileView:(UIButton *)button {
    [UIView animateWithDuration:0.7
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.profileSlideView.transform = CGAffineTransformMakeTranslation(self.profileSlideView.width, 0);
                     } completion:nil];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];

    [UIView animateWithDuration:0.3
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.maskButton.alpha = 0;
                     } completion:^(BOOL finished) {
                         self.maskButton.hidden = YES;
                     }];
}

- (void)tabBarDidClickedProfileButton:(HZTabBar *)tabBar {
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         _profileSlideView.transform = CGAffineTransformMakeTranslation(-_profileSlideView.width, 0);
                     } completion:nil];
    for (UITableViewCell *cell in self.profileSlideView.tableView.visibleCells) {
        cell.transform = CGAffineTransformMakeTranslation(cell.tag * 25, 0);

        [UIView animateWithDuration:0.7
                              delay:0.2
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             cell.transform = CGAffineTransformMakeTranslation(0, 0);
                         } completion:nil];
    }
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    self.maskButton.hidden = NO;
    [UIView animateWithDuration:0.2
                          delay:0.3
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.maskButton.alpha = 0.5;
                     } completion:nil];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.functionArray.count;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.4];
    [transition setType:kCATransitionFade];
    [self.view.layer addAnimation:transition forKey:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"profile"];
    cell.textLabel.text = self.functionArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.tag = indexPath.row;
    return  cell;
}

@end
