//
//  CycleCollectionViewController.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "CycleCollectionViewController.h"
#import "CycleModel.h"
#import "CycleCollectionViewCell.h"


@interface CycleCollectionViewController ()

@property (nonatomic, strong)NSArray *cycleList;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *cycleFlowLayout;

@property (nonatomic, weak)UIPageControl  *pageControl;

@end

@implementation CycleCollectionViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.cycleFlowLayout.minimumLineSpacing = 0;
    self.cycleFlowLayout.minimumInteritemSpacing = 0;
    self.collectionView.pagingEnabled = YES;
    
    self.cycleFlowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self loadCycleData];
}

- (void)loadCycleData {

    NSString *URLString = [NSString stringWithFormat:@"ad/headline/0-4.html"];
    
    [CycleModel loadCycleDataWithURLString:URLString successBlock:^(NSArray *cycleList) {
       
        _cycleList = cycleList;
        
        [self.collectionView reloadData];
        
        [self createPageControl];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:cycleList.count inSection:0];
        
        [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
        
    } failedBlock:^(NSError *error) {
       
        NSLog(@"%@",error);
    }];
}

- (void)createPageControl {

    UIPageControl *pageControl = [[UIPageControl alloc] init];
    
    pageControl.numberOfPages = self.cycleList.count;
    
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    
    pageControl.pageIndicatorTintColor = [UIColor greenColor];
    
    [pageControl sizeToFit];
    
//    CGSize pageSize = [pageControl sizeForNumberOfPages:self.cycleList.count];
    
    CGFloat pageX  = self.view.bounds.size.width - pageControl.bounds.size.width - 10;
    
    CGFloat pageY  = self.view.bounds.size.height - pageControl.bounds.size.height - 12;
    
    pageControl.frame = CGRectMake(pageX, pageY, pageControl.bounds.size.width, pageControl.bounds.size.height);
    
    self.pageControl = pageControl;
    
    [self.view addSubview:pageControl];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    self.pageControl.currentPage = index % self.cycleList.count;
    
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    
    NSIndexPath *indexPath ;
    
    if (index == 0) {
        
        indexPath = [NSIndexPath indexPathForItem:_cycleList.count inSection:0];
        
    }else if (index == items - 1) {
    
        indexPath = [NSIndexPath indexPathForItem:self.cycleList.count - 1 inSection:0];
    }
    
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

- (void)viewDidAppear:(BOOL)animated {

    self.cycleFlowLayout.itemSize = self.collectionView.bounds.size;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.cycleList.count *3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * const reuseIdentifier = @"CycleCell";
    
    CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    CycleModel *model = self.cycleList[indexPath.item % _cycleList.count];

    cell.cycle = model;
    
    return cell;
}



@end
