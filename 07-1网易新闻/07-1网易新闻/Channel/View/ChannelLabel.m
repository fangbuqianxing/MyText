//
//  ChannelLabel.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "ChannelLabel.h"

@implementation ChannelLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.textAlignment = NSTextAlignmentCenter;
        
        self.font = [UIFont systemFontOfSize:16.0];
        
        self.backgroundColor =  [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    }
    return self;
}

- (void)setScale:(CGFloat)scale {

    _scale = scale;
    
    CGFloat minScale = 1 + 0.2 * 
}

@end
