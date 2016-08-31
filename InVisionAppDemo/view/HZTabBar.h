//
//  HZTabBar.h
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/31.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HZTabBar;
@protocol HZTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickedProfileButton:(HZTabBar *)tabBar;

@end

@interface HZTabBar : UITabBar
@property (nonatomic, weak) id<HZTabBarDelegate> tabBarDelegate;
@end
