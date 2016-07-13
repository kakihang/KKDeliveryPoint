//
//  UILabel+KKHPNarTitle.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UILabel+KKHPNarTitle.h"
#import <DKNightVersion.h>

@implementation UILabel (KKHPNarTitle)

+ (instancetype)labelForTitle:(NSString *)title rect:(CGRect)rect {
    // 导航栏的标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.backgroundColor = [UIColor clearColor];
    [titleLabel setText:title];
    titleLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeNavTitleColor");
    
    /** 设置title位置 **/
    titleLabel.x = rect.size.width * 0.05;
    titleLabel.y = rect.size.height * 0.4;
    [titleLabel sizeToFit];
    
    return titleLabel;
}

@end
