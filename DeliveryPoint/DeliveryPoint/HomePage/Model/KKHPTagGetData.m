//
//  KKHPTagGetData.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagGetData.h"
#import "KKHPTagsModel.h"
#import "KKTngouParams.h"
#import <AFNetworking.h>
#import <MJExtension.h>

// 归档解档地址
#define KKHPTagsPath [[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"Preferences/DeliveryPoint.homepage.tags.plist"]

@interface KKHPTagGetData()

// 所有的频道数据
@property (nonatomic, strong) NSMutableArray *allChannels;
@end


@implementation KKHPTagGetData


+ (NSArray *)kk_HPGetTagDatas {
    // 从沙盒取出存放数组
    NSArray *tags = [NSKeyedUnarchiver unarchiveObjectWithFile:KKHPTagsPath];
    if (tags == nil) {
        // 从网络获取
        [[[KKHPTagGetData alloc] init] loadNewData];
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
        
        NSMutableArray *arr = [KKHPTagsModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]];
        [arr setValue:@"top" forKey:@"type"];
        [arr setValue:@"classify" forKey:@"section"];
        
        [self loadMoreData:arr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"link error[%@ %@]", link, [error localizedDescription]);
        sleep(1);
        [self loadNewData];
    }];
}

- (void)loadMoreData:(NSArray *)array {
    
    NSString *link = [KKTngouParams shareTngou].getInfoLinks[@"classify"][@"url"];
    
    [[AFHTTPSessionManager manager] GET:link parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSMutableArray *arr = [KKHPTagsModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]];
        [arr setValue:@"info" forKey:@"type"];
        [arr setValue:@"classify" forKey:@"section"];
        
        NSMutableArray *data = [[array arrayByAddingObjectsFromArray:arr] mutableCopy];
        
        [data insertObject:[KKHPTagsModel tagFirstModel] atIndex:0];
        
        
        // 数据归档
        [KKHPTagGetData kk_HPSaveTagDatas:data];
        
        // 获取数据后，发通知消息
        NSLog(@"发通知消息 %zd", data.count);
        [[NSNotificationCenter defaultCenter] postNotificationName:KKHomePageTagReloadDataMessage object:nil];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"link error[%@ %@]", link, [error localizedDescription]);
        sleep(1);
        [self loadMoreData:array];
    }];
}

@end
