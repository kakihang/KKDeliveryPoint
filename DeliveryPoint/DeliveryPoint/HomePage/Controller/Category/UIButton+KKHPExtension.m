//
//  UIButton+KKHPExtension.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIButton+KKHPExtension.h"
#import <DKNightVersion.h>

@implementation UIButton (KKHPExtension)


+ (instancetype)kk_buttonForNavBack {
    UIButton *button = [[UIButton alloc] init];
    
    [button setImage:[UIImage imageNamed:KKStringWithRootkeyStringKey(homePage, @"homeNavBackButtonImage")] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:KKStringWithRootkeyStringKey(homePage, @"homeNavBackButtonImage_click")] forState:UIControlStateHighlighted];
    
    return button;
}

@end
