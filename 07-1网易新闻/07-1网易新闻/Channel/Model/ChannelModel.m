//
//  ChannelModel.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "ChannelModel.h"

@implementation ChannelModel

+ (instancetype)ChannelModelWithDict:(NSDictionary *)dict {

    ChannelModel *model = [[ChannelModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

+ (NSArray *)ChannelModels {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"topic_news.json" ofType:nil];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    NSArray *dictArr = jsonDict[@"tList"];
    
    NSMutableArray *tmpM = [NSMutableArray arrayWithCapacity:dictArr.count];
    
    [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        ChannelModel *model = [ChannelModel ChannelModelWithDict:obj];
        
        [tmpM addObject:model];
    }];
    
    [tmpM sortUsingComparator:^NSComparisonResult(ChannelModel *  _Nonnull obj1, ChannelModel *  _Nonnull obj2) {
        
        return [obj1.tid compare:obj2.tid];
    }];
    
    return tmpM.copy;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

- (NSString *)description {

    return [NSString stringWithFormat:@"%@ -- %@", _tname, _tid];
}

@end
