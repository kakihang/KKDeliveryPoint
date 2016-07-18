//
//  NSObject+KKFont.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KKFontSizeManager.h"


@interface NSObject (KKFont)
- (id)kk_manager;
@end



@interface KKDeallocBlockExecutor : NSObject

+ (instancetype)executorWithDeallocBlock:(void (^)())deallocBlock;
@property (nonatomic, copy) void (^deallocBlock)();


@end



