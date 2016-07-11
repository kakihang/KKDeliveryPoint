//
//  KKTngouParams.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKTngouParams.h"


@interface KKTngouParams()
/** 网络链接数据 **/
@property (nonatomic, strong) NSDictionary *tngouLinks;

@end


@implementation KKTngouParams

- (NSDictionary *)tngouLinks {
    if(_tngouLinks == nil) {
        _tngouLinks = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tngou" ofType:@"plist"]];
        if (!_tngouLinks) {
            NSLog(@"error: 文件 tngou.plist 不存在");
        }
    }
    return _tngouLinks;
}

// 全部数据
- (NSDictionary *)getAllTngouLinks {
    return self.tngouLinks;
}

// top 社会热点
- (NSDictionary *)getTopLinks {
    return self.tngouLinks[@"top"];
}

// info 健康资讯
- (NSDictionary *)getInfoLinks {
    return self.tngouLinks[@"info"];
}

// lore 健康知识
- (NSDictionary *)getLorelinks {
    return self.tngouLinks[@"lore"];
}

// 单例
static KKTngouParams *params_;
+ (instancetype)shareTngou {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        params_ = [[KKTngouParams alloc] init];
    });
    
    return params_;
}


@end
