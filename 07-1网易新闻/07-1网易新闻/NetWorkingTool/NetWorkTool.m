//
//  NetWorkTool.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "NetWorkTool.h"

@implementation NetWorkTool

+ (instancetype)sharedNetWorkTool {

    static NetWorkTool *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:@"http://c.m.163.com/nc/"];
        
        instance = [[NetWorkTool alloc] initWithBaseURL:baseURL];
    });
    return instance;
}

@end
