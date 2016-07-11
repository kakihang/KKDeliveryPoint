//
//  NSString+KKDayNight.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/6.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "NSString+KKDayNight.h"

@implementation NSString (KKDayNight)

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey :(NSString *)fourthKey {
    return [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey][fourthKey];
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey {
    return [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey];
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey{
    return [KKDayNightData shareDayNightData][firstKey][secondKey];
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey {
    return [KKDayNightData shareDayNightData][firstKey];
}


+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey :(NSString *)fourthKey {
    return [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey][fourthKey];
}

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey {
    return [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey];
}

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey :(NSString *)secondKey{
    return [KKDayNightData shareDayNightData][firstKey][secondKey];
}

+ (instancetype)kk_fontSizeStringWithKey:(NSString *)firstKey {
    return [KKDayNightData shareDayNightData][firstKey];
}

@end
