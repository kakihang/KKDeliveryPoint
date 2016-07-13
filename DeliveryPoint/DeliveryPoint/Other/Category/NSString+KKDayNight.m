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
    NSString *string = [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey][fourthKey];
    if (string.length == 0) {
        NSLog(@"error key[%@:%@:%@:%@]", firstKey, secondKey, thirdKey, fourthKey);
    }
    return string;
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey :(NSString *)thirdKey {
    NSString *string = [KKDayNightData shareDayNightData][firstKey][secondKey][thirdKey];
    if (string.length == 0) {
        NSLog(@"error key[%@:%@:%@]", firstKey, secondKey, thirdKey);
    }
    return string;
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey :(NSString *)secondKey{
    NSString *string = [KKDayNightData shareDayNightData][firstKey][secondKey];
    if (string.length == 0) {
        NSLog(@"error key[%@:%@]", firstKey, secondKey);
    }
    return string;
}

+ (instancetype)kk_stringWithKey:(NSString *)firstKey {
    NSString *string = [KKDayNightData shareDayNightData][firstKey];
    if (string.length == 0) {
        NSLog(@"error key[%@]", firstKey);
    }
    return string;
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
