//
//  KKHPTagsModel.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKHPTagsModel : NSObject <NSCoding>

/** 分类id，需要查询该类下的列表就需要传入才参数 **/
@property (nonatomic, assign) NSInteger ID;
/** 分类名称 **/
@property (nonatomic, strong) NSString *name;
/** 分类的标题（网页显示的标题） **/
@property (nonatomic, strong) NSString *title;
/** 分类的关键词（网页显示的标题） **/
@property (nonatomic, strong) NSString *keywords;

+ (instancetype)tagFirstModel;

@end
