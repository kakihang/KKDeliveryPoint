//
//  KKNewsInfoViewModel.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class KKNewsContentModel;


typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore
};


@interface KKNewsInfoViewModel : NSObject

// cell的个数
@property (nonatomic, assign) NSInteger cellNumber;
// 指定行的图片url
- (NSURL *)iconUrlForRow:(NSInteger)row;
// 指定行显示的题目
- (NSString *)titleForRow:(NSInteger)row;
// 指定行的明细
- (NSString *)detailTextForRow:(NSInteger)row;
// 访问人数
- (NSString *)visitCountForRow:(NSInteger)row;
// 收藏人数
- (NSString *)collectCountForRow:(NSInteger)row;
// 评论人数
- (NSString *)commentCountForRow:(NSInteger)row;
// time
- (NSString *)timeForRow:(NSInteger)row;

// 根据Model来决定的方法和属性

// 当前页数
@property (nonatomic, assign) NSInteger page;
// 所有cell中的类型
@property (nonatomic, strong) NSMutableArray <KKNewsContentModel *> *dataList;

// 请求方法
- (void)getData:(RequestMode)requestMode completionhandler:(void(^)(NSError *error))completionHandler;


@end
