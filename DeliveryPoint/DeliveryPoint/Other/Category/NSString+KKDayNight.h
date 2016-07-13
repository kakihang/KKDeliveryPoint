//
//  NSString+KKDayNight.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KKDayNight)

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey :(NSString *)fourthKey;

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey;

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey;

+ (instancetype)kk_stringWithKey:(NSString *)firstKey;


+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey :(NSString *)fourthKey;

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey;

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey;

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey;


@end
