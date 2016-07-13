//
//  KKHPTagManegerV.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSInteger colButCount_ = 4; // 一行有多少个button
static CGFloat topMargin_ = 20.0; // 我的频道与返回栏距离
static CGFloat channelMargin_ = 35.0; // 频道与频道之间的距离
static CGFloat buttonMargin_ = 10.0; // 标签之间的距离
static CGFloat channelToButtonMargin_ = 20.0; // 频道与频道内标签的距离
static CGFloat buttonHeight_ = 80.0; // 标签高度
static CGFloat channelHeight_ = 40.0; // 频道label高度
static CGFloat channelWidth_ = 280.0; // 频道label宽度


@interface KKHPTagManegerV : UIView

+ (void)show;

@end
