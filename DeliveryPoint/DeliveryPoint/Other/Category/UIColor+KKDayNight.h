//
//  UIColor+KKDayNight.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (KKDayNight)

+ (instancetype)kk_setRedBlueGreenAlphaColor:(NSString *)redBlueGreenAlpha;


+ (instancetype)kk_colorWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey :(NSString *)fourthKey;

+ (instancetype)kk_colorWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey;

+ (instancetype)kk_colorWithKey:(NSString *)firstKey :(NSString *)secondKey;

+ (instancetype)kk_colorWithKey:(NSString *)firstKey;

@end
