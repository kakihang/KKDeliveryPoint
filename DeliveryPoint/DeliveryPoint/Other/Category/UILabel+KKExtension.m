//
//  UILabel+KKExtension.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UILabel+KKExtension.h"

@implementation UILabel (KKExtension)

+ (instancetype)kk_labelTitle:(NSString *)title fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.font = [UIFont systemFontOfSize:size];
    return label;
}

@end
