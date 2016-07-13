//
//  CycleModel.h
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CycleModel : NSObject

@property (nonatomic, copy)NSString  *title;
@property (nonatomic, copy)NSString  *imgsrc;


+ (void)loadCycleDataWithURLString:(NSString *)URLString successBlock:(void(^)(NSArray *cycleList))successBlock failedBlock:(void(^)(NSError *error))failedBlock;

@end
/*
 {
 "title": "台风过后 福建灾区汽车路边\"叠罗汉\"",
 "tag": "photoset",
 "subtitle": "",
 "imgsrc": "http://cms-bucket.nosdn.127.net/c2b6d14d50de46cf97debc65f1a5535720160711114723.jpeg",
 "url": "00AP0001|2188711"
 },
 */