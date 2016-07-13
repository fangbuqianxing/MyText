//
//  NewsModel.h
//  07-1网易新闻
//
//  Created by 玉飞 on 16/7/12.
//  Copyright © 2016年 yufei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, copy)  NSString  *title;
@property (nonatomic, copy)  NSString  *imgsrc;
@property (nonatomic, copy)  NSString  *source;
@property (nonatomic, strong)NSNumber  *replyCount;
@property (nonatomic, strong)NSArray   *imgextra;
@property (nonatomic, assign)BOOL       imgType;

+ (void)loadNewsDataWithURLString:(NSString *)URLString successBlock:(void(^)(NSArray *))successBlock failedBlock:(void(^)(NSError *))failedBlock;

@end
/*
 postid : "PHOT22PF5000100A"
 hasCover : false
 hasHead : 1
 replyCount : 29495
 hasImg : 1
 digest : ""
 hasIcon : true
 docid : "9IG74V5H00963VRO_BRP339ESluowenwenupdateDoc"
 title : "湖南华容县新华垸溃口进行合龙"
 order : 1
 priority : 312
 lmodify : "2016-07-12 11:40:59"
 boardid : "photoview_bbs"
 ads
 photosetID : "00AP0001|2188773"
 template : "normal1"
 votecount : 28026
 skipID : "00AP0001|2188773"
 alias : "Top News"
 skipType : "photoset"
 cid : "C1348646712614"
 hasAD : 1
 imgextra
 source : "网易原创"
 ename : "iosnews"
 imgsrc : "http://cms-bucket.nosdn.127.net/f111804d53d54ea4b3f18de36d4a2bb220160712102645.jpeg"
 tname : "头条"
 ptime : "2016-07-12 10:24:25"
 
 */