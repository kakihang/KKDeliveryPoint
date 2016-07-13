//
//  KKNewsContentModel.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/11.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKNewsContentModel : NSObject

/** ID编码 **/
@property (nonatomic, assign) NSInteger ID;
/** 关键词 **/
@property (nonatomic, strong) NSString *keywords;
/** 标题 **/
@property (nonatomic, strong) NSString *title;
/** 简介 **/
@property (nonatomic, strong) NSString *descri;
/** 图片 **/
@property (nonatomic, copy) NSString *img;
/** 分类ID **/
@property (nonatomic, assign) NSInteger infoclass;
/** 访问数 **/
@property (nonatomic, assign) NSInteger count;
/** 评论数 **/
@property (nonatomic, assign) NSInteger rcount;
/** 收藏数 **/
@property (nonatomic, assign) NSInteger fcount;
/** 发布时间 **/
@property (nonatomic, assign) NSInteger time;

@end
