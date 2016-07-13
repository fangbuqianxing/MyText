//
//  HomeCollectionViewCell.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "NewsTableViewController.h"

@interface HomeCollectionViewCell ()

@property (nonatomic, strong) NewsTableViewController *newsVC;

@end

@implementation HomeCollectionViewCell

- (void)setURLString:(NSString *)URLString {

    _URLString = URLString;
    
    self.newsVC.URLString = URLString;
    
}

- (void)awakeFromNib {

    UIStoryboard *newSB = [UIStoryboard storyboardWithName:@"NewsTableViewController" bundle:nil];
    
    NewsTableViewController *newsVC = [newSB instantiateInitialViewController];
    
    self.newsVC = newsVC;
    
    newsVC.tableView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:newsVC.tableView];
    
}

@end
