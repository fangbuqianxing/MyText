//
//  CycleModel.m
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import "CycleModel.h"
#import "NetWorkTool.h"

@implementation CycleModel

+ (instancetype)CycleModelWithDict:(NSDictionary *)dict {

    CycleModel *model = [[CycleModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

+ (void)loadCycleDataWithURLString:(NSString *)URLString successBlock:(void (^)(NSArray *))successBlock failedBlock:(void (^)(NSError *))failedBlock {

    [[NetWorkTool sharedNetWorkTool]GET:URLString parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        
        NSString *key = responseObject.keyEnumerator.nextObject;
        
        NSArray *dictArr = responseObject[key];
        
        NSMutableArray *ArrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        
        [dictArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
           
            CycleModel *model = [CycleModel CycleModelWithDict:obj];
            
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
    return [NSString stringWithFormat:@"%@--%@",self.title,self.imgsrc];
}

@end
