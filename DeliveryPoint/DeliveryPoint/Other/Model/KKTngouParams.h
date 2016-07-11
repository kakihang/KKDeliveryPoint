//
//  KKTngouParams.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//  服务器数据链接存储对象

#import <Foundation/Foundation.h>

@interface KKTngouParams : NSObject

// 全部数据
- (NSDictionary *)getAllTngouLinks;

// top 社会热点
- (NSDictionary *)getTopLinks;

// info 健康资讯
- (NSDictionary *)getInfoLinks;

// lore 健康知识
- (NSDictionary *)getLorelinks;


// 单例
+ (instancetype)shareTngou;

@end


