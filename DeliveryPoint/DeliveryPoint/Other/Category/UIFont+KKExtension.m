//
//  UIFont+KKExtension.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIFont+KKExtension.h"

@implementation UIFont (KKExtension)
+ (instancetype)kk_setFontSize:(NSString *)fontSize {
    
    return [UIFont systemFontOfSize:[fontSize doubleValue]];
}
@end
