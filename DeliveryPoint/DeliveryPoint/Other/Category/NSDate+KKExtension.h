//
//  NSDate+KKExtension.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (KKExtension)
- (NSDateComponents *)deltaFrom:(NSDate *)from;
- (NSDateComponents *)deltaFrom:(NSString *)fromDate format:(NSString *)format;
- (NSString *)getBigUnitFrom:(NSString *)fromDate format:(NSString *)format;

- (BOOL)isThisYear;
- (BOOL)isToday;
- (BOOL)isYesterday;

// 传入自1970以来的秒数，返回日期字符串，具体格式请参考代码
+ (NSString *)kk_stringTimeFromSeconds:(NSTimeInterval)time;

@end
