//
//  HZProfileSlideView.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/31.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZProfileSlideView.h"

@interface HZProfileSlideView ()

@end

@implementation HZProfileSlideView
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width / 2;
        self.avatarImageView.layer.masksToBounds = YES;
    }
    return self;
}

@end
