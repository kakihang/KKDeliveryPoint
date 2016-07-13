//
//  NSString+KKStringUrl.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KKStringUrl)
+ (instancetype)kk_stringUrlWithRootKey:(NSString *)rootKey key:(NSString *)key;

@end
