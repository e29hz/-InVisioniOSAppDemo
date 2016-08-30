//
//  HZLanuchCollectionViewCell.m
//  InVisionAppDemo
//
//  Created by 鄂鸿桢 on 16/8/30.
//  Copyright © 2016年 e29hz. All rights reserved.
//

#import "HZLanuchCollectionViewCell.h"

@implementation HZLanuchCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat imageX = 20;
        CGFloat imageY = 0;
        CGFloat imageW = self.bounds.size.width - (imageX * 2);
        CGFloat imageH = imageW;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageW, imageH)];
        [self.contentView addSubview:self.imageView];
        
        CGFloat labelX = 0;
        CGFloat labelY = imageH + 10;
        CGFloat labelW = self.bounds.size.width;
        CGFloat labelH = 20;
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
    }
    
    return self;
}

@end
