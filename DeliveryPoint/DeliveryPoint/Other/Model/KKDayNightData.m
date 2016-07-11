//
//  KKDayNightData.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKDayNightData.h"

@interface KKDayNightData()
/** 图像和颜色数组 **/
@property (nonatomic, strong) NSDictionary *allDayNightDatas;
@end


@implementation KKDayNightData

- (NSDictionary *)allDayNightDatas {
    if(_allDayNightDatas == nil) {
        _allDayNightDatas = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ImageColor" ofType:@"plist"]];;
    }
    return _allDayNightDatas;
}


+ (NSDictionary *)shareDayNightData {
    static KKDayNightData *dayNightData = nil;
    if (dayNightData == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (dayNightData == nil) {
                dayNightData = [[KKDayNightData alloc] init];
            }
        });
    }
    
    return dayNightData.allDayNightDatas;
}

@end
