//
//  ViewController.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/11.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "HomeViewController.h"
#import "ChannelLabel.h"
#import "ChannelModel.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *homeFlowLayout;
@property (weak, nonatomic) IBOutlet UIScrollView *channelScrollView;

@property (weak, nonatomic) IBOutlet UICollectionView *homeCollectionView;

@property (nonatomic, strong)NSArray *channels;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.homeFlowLayout.minimumLineSpacing = 0;
    self.homeFlowLayout.minimumInteritemSpacing = 0;
    self.homeFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.homeCollectionView.pagingEnabled = YES;
    
    [self creatChannelLabels];
    
}

- (void)creatChannelLabels {

    _channels = [ChannelModel ChannelModels];
    
    CGFloat labelW = 80;
    
    CGFloat labelH = self.channelScrollView.bounds.size.height;
    
    CGFloat labelY = 0;
    
    [_channels enumerateObjectsUsingBlock:^(ChannelModel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        CGFloat labelX = labelW * idx;
        
        UILabel *label = [[ChannelLabel alloc] initWithFrame:CGRectMake(labelX, labelY, labelW, labelH)];
        
        [self.channelScrollView addSubview:label];
        
        label.text = [_channels[idx] tname];
        
        label.tag = idx;
    }];
    
    self.channelScrollView.contentSize = CGSizeMake(_channels.count *labelW, 0);
}

- (void)viewDidAppear:(BOOL)animated {

    self.homeFlowLayout.itemSize = self.homeCollectionView.bounds.size;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.channels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeCollectionViewCell" forIndexPath:indexPath];
    
    ChannelModel *model = self.channels[indexPath.item];
    
    NSString *URLString = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/%@/0-20.html",model.tid];
    
    cell.URLString = URLString;
    
    
    return cell;
}

@end
