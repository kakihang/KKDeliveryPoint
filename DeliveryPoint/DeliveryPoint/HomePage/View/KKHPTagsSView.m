//
//  KKHPTagsSView.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/9.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagsSView.h"
#import <DKNightVersion.h>

@implementation KKHPTagsSView

- (void)layoutSubviews {
    
}

+ (instancetype)tagsSView:(CGRect)rect {
    KKHPTagsSView *tagsSV = [[KKHPTagsSView alloc] initWithFrame:rect];
    
    // 标签栏背景颜色
    tagsSV.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTagBgColor");
    
    // 隐藏滑动栏
    tagsSV.showsVerticalScrollIndicator = NO;
    tagsSV.showsHorizontalScrollIndicator = NO;
    
    return tagsSV;
}

@end
