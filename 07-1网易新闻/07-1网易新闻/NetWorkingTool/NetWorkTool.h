//
//  NetWorkTool.h
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

@interface NetWorkTool : AFHTTPSessionManager

+ (instancetype)sharedNetWorkTool;

@end
