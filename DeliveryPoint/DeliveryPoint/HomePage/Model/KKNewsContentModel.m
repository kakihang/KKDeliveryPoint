//
//  KKNewsContentModel.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/11.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKNewsContentModel.h"
#import <MJExtension.h>

@implementation KKNewsContentModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"@id",
             @"descri" : @"description"};
}

@end
