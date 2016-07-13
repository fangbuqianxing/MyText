//
//  NewsTableViewController.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableViewCell.h"

@interface NewsTableViewController ()

@property (nonatomic, strong)NSArray *newsList;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)setURLString:(NSString *)URLString {

    _URLString = URLString;
    
    [NewsModel loadNewsDataWithURLString:URLString successBlock:^(NSArray *newsList) {
        
        _newsList = newsList;
        
        [self.tableView reloadData];
        
    } failedBlock:^(NSError *error) {
       
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsModel *news = self.newsList[indexPath.row];
    
    NSString *identifier;
    
    if (news.imgType) {
        identifier = @"BigCell";
    }else if (news.imgextra.count == 2){
        identifier = @"ImagesCell";
    
    }else {
    
        identifier = @"BaseCell";
    }

    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    cell.news = news;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NewsModel *news = self.newsList[indexPath.row];

    if (news.imgType) {
        return 180;
    }else if (news.imgextra.count == 2){
        return 130;
        
    }else {
        
        return 80;
    }
    return 80;
}

@end
