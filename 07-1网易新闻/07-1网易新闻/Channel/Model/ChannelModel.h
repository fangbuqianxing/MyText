//
//  ChannelModel.h
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, copy)NSString  *tname;

@property (nonatomic, copy)NSString  *tid;

+ (NSArray *)ChannelModels;
@end
