//
//  CycleCollectionViewCell.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import <UIImageView+WebCache.h>

@interface CycleCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation CycleCollectionViewCell

- (void)setCycle:(CycleModel *)cycle {

    _cycle = cycle;
    
    _titleLabel.text = cycle.title;
    
    [_imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:cycle.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    
}

@end
