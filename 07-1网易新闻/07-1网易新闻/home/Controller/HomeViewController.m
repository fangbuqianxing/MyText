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

@interface HomeViewController ()<UICollectionViewDataSource,UIScrollViewDelegate>


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
        
        UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(channelLabelClick:)];
        
        [label addGestureRecognizer:tapLabel];
        
        label.userInteractionEnabled = YES;
    }];
    
    self.channelScrollView.contentSize = CGSizeMake(_channels.count *labelW, 0);
}

- (void)channelLabelClick:(UITapGestureRecognizer *)recognizer {

    ChannelLabel *label = (ChannelLabel *)recognizer.view;
    
    CGFloat offsetX = label.center.x - self.view.bounds.size.width * 0.5;
    
    CGFloat min_offsetX = 0;
    CGFloat max_offsetX = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (offsetX < min_offsetX) {
        
        offsetX = min_offsetX;
    }else if(offsetX > max_offsetX){
        offsetX = max_offsetX;
    }
    
    [self.channelScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:label.tag inSection:0];
    
    [self.homeCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / self.homeFlowLayout.itemSize.width;
    
    ChannelLabel *label = self.channelScrollView.subviews[index];
    
    CGFloat label_offsetX = label.center.x - self.view.bounds.size.width * 0.5;
    
    CGFloat min_offsetX = 0;
    CGFloat max_offsetX = self.channelScrollView.contentSize.width - self.view.bounds.size.width;
    
    if (label_offsetX < min_offsetX) {
        
        label_offsetX = min_offsetX;
    }else if(label_offsetX > max_offsetX){
        label_offsetX = max_offsetX;
    }
    
    [self.channelScrollView setContentOffset:CGPointMake(label_offsetX, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat index_float = scrollView.contentOffset.x / self.homeFlowLayout.itemSize.width;
    
    NSInteger left_index = (NSInteger)index_float;
    
    NSInteger right_index = left_index + 1;
    
    CGFloat right_scale = index_float - left_index;
    
    CGFloat left_scale = 1 - right_scale;
    
    ChannelLabel *leftLabel = self.channelScrollView.subviews[left_index];
    
    leftLabel.scale = left_scale;
    
    if (right_index < self.channelScrollView.subviews.count) {
        
        ChannelLabel *rightLabel = self.channelScrollView.subviews[right_index];
        
        rightLabel.scale = right_scale;
    }
    
    
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
