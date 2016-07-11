//
//  KKHPTagDatas.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagDatas.h"
#import "KKHPTagsModel.h"
#import "KKTngouParams.h"
#import <AFNetworking.h>
#import <MJExtension.h>

// 归档解档地址
#define KKHPTagsPath [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Preferences/DeliveryPoint.homepage.tags.plist"]



@interface KKHPTagDatas()


@end


@implementation KKHPTagDatas


+ (NSArray *)kk_HPGetTagDatas {
    // 从沙盒取出存放数组
    NSArray *tags = [NSKeyedUnarchiver unarchiveObjectWithFile:KKHPTagsPath];
    if (tags == nil) {
        // 从网络获取
        [[[KKHPTagDatas alloc] init] loadNewData];
    }
    return tags;
}

// 归档
+ (void)kk_HPSaveTagDatas:(NSArray *)arr {
    [NSKeyedArchiver archiveRootObject:arr toFile:KKHPTagsPath];
    
    
}

- (void)loadNewData {
    NSString *link = [KKTngouParams shareTngou].getTopLinks[@"classify"][@"url"];
    
    [[AFHTTPSessionManager manager] GET:link parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [self loadMoreData:[KKHPTagsModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]]];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"link error[%@ %@]", link, [error localizedDescription]);
    }];
}

- (void)loadMoreData:(NSArray *)array {
    
    NSString *link = [KKTngouParams shareTngou].getInfoLinks[@"classify"][@"url"];
    
    [[AFHTTPSessionManager manager] GET:link parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *data = [[array arrayByAddingObjectsFromArray:[KKHPTagsModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]]] mutableCopy];
        
        [data insertObject:[KKHPTagsModel tagFirstModel] atIndex:0];
        
        // 数据归档
        [KKHPTagDatas kk_HPSaveTagDatas:data];
        
        // 获取数据后，发通知消息
        NSLog(@"发通知消息 %zd", data.count);
        [[NSNotificationCenter defaultCenter] postNotificationName:KKHomePageTagReloadDataMessage object:nil];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"link error[%@ %@]", link, [error localizedDescription]);
    }];
}

@end
