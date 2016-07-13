//
//  NewsModel.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "NewsModel.h"
#import "NetWorkTool.h"

@implementation NewsModel

+ (instancetype)NewsModelWithDict:(NSDictionary *)dict {

    NewsModel *model = [[NewsModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (void)loadNewsDataWithURLString:(NSString *)URLString successBlock:(void (^)(NSArray *))successBlock failedBlock:(void (^)(NSError *))failedBlock {

    NetWorkTool *network = [NetWorkTool sharedNetWorkTool];
    
    [network GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        NSString *key = responseObject.keyEnumerator.nextObject;
        
        NSArray *dictArr = responseObject[key];
        
        NSMutableArray *ArrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        
        [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            NewsModel *model = [NewsModel NewsModelWithDict:obj];
            
            [ArrM addObject:model];
        }];
        
        if (successBlock) {
            
            successBlock(ArrM.copy);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (failedBlock) {
            failedBlock(error);
        }
    }];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@--%@--%@",self.title,self.source,self.replyCount];
}

@end
