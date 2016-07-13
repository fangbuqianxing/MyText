//
//  NewsTableViewCell.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface NewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgsrcImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *replycountLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgsrcImageViews;


@end

@implementation NewsTableViewCell



- (void)setNews:(NewsModel *)news {

    _news = news;
    
    [self.imgsrcImageView sd_setImageWithURL:[NSURL URLWithString:news.imgsrc] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
    
    _titleLabel.text = news.title;
    _sourceLabel.text = news.source;
    
    if ([news.replyCount intValue] == 0) {
      _replycountLabel.text = @"0";
        
    }else {
    
        _replycountLabel.text = [NSString stringWithFormat:@"%@",news.replyCount];
    }
    
    if (news.imgextra.count > 0) {
        
        [_imgsrcImageViews enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSDictionary *imageURLDict = news.imgextra[idx];
            
            NSString *URLString = imageURLDict[@"imgsrc"];
            
            [obj sd_setImageWithURL:[NSURL URLWithString:URLString] placeholderImage:[UIImage imageNamed:@"placeholderImage"]];
        }];
    }
    
}

@end
