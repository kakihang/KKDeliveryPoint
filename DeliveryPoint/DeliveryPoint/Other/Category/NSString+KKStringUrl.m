//
//  NSString+KKStringUrl.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "NSString+KKStringUrl.h"
#import "KKTngouParams.h"

@implementation NSString (KKStringUrl)

+ (instancetype)kk_stringUrlWithRootKey:(NSString *)rootKey key:(NSString *)key {
    NSDictionary *dict = [KKTngouParams shareTngou].getAllTngouLinks;
    NSString *stringUrl = dict[rootKey][key][@"url"];
    if (!stringUrl) {
        NSLog(@"error: values of keys is null[key:%@ :%@ :url]", rootKey, key);
    }
    return stringUrl;
}
@end
