//
//  KKShareData.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKShareData.h"


@interface KKShareData()
// 网址信息
@property (nonatomic, strong) NSDictionary *tngouLinks;

@end


@implementation KKShareData

#pragma mark - 懒加载

- (NSDictionary *)tngouLinks {
    if(_tngouLinks == nil) {
        _tngouLinks = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tngou" ofType:@"plist"]];
        if (!_tngouLinks) {
            NSLog(@"error: 文件 tngou.plist 不存在");
        }
    }
    return _tngouLinks;
}


#pragma mark - 流程方法

/**
 *  @author liudhkk, 16-07-13 16:07:57
 *
 *  建立单例，初始化所有的参数属性:
 *  1.获取各级网址字符串 写入缓存
 *  2.获取所有的频道 写入缓存
 *  3.初始化沙盒里我的频道参数 写入缓存
 *  4.获取颜色图片plist文件，写入缓存
 *  5.获取所有字体plist文件，写入缓存
 */
+ (instancetype)shareData {
    KKLogBegin;
    static KKShareData *shareData;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareData = [[KKShareData alloc] init];
        // 缓存网址数据
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [shareData tngouLinks];
        });
        // 缓存所有频道数据 top/info/lore/department/place/area/
        
    });
    KKLogEnd;
    return shareData;
}



#pragma mark - 网络链接

// 全部链接数据
- (NSDictionary *)getAllTngouLinks {
    return self.tngouLinks;
}

/**
 *  @author liudhkk, 16-07-13 23:07:56
 *
 *  按key值获取网络链接，最后的key值url不需要传，只需要传一级与二级key
 *  如top list,即返回字典:key :list 下的url字符串
 *
 *  @return
 */
- (NSString *)getUrlStringByKey:(NSString *)rootKey key:(NSString *)key {
    NSString *url = self.tngouLinks[rootKey][key];
    if (url.length == 0) {
        NSLog(@"%s", __func__);
        NSLog(@"error: value by keys[:%@ :%@] is null", rootKey, key);
    }
    return url;
}





@end
