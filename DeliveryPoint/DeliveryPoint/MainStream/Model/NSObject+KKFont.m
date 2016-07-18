//
//  NSObject+KKFont.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "NSObject+KKFont.h"
#import <objc/runtime.h>



NSString * const KKFontSizeChangingNotificaitonX = @"KK.FONTSIZECHANGENOTIFICATION";

@interface NSObject ()

@property (nonatomic, strong) NSMutableDictionary<NSString *, KKFontPicker> *kpickers;

@end



@implementation NSObject (KKFont)

- (id)dk_manager {
    return [KKFontSizeManager sharedManager];
}

static void *DKViewDeallocHelperKey;
- (NSMutableDictionary<NSString *, KKFontPicker> *)kpickers {
    NSMutableDictionary<NSString *, KKFontPicker> *kpickers = objc_getAssociatedObject(self, @selector(kpickers));
    if (!kpickers) {
        
        @autoreleasepool {
            // Need to removeObserver in dealloc
            if (objc_getAssociatedObject(self, &DKViewDeallocHelperKey) == nil) {
                __unsafe_unretained typeof(self) weakSelf = self; // NOTE: need to be __unsafe_unretained because __weak var will be reset to nil in dealloc
                id deallocHelper = [self addDeallocBlock:^{
                    [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
                }];
                objc_setAssociatedObject(self, &DKViewDeallocHelperKey, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
            }
        }
        
        kpickers = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(kpickers), kpickers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [[NSNotificationCenter defaultCenter] removeObserver:self name:KKFontSizeChangingNotificaitonX object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(font_updateColor) name:KKFontSizeChangingNotificaitonX object:nil];
    }
    return kpickers;
}


- (KKFontSizeManager *)kk_manager {
    return [KKFontSizeManager sharedManager];
}

- (void)font_updateColor {
    
    
    [self.kpickers enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, KKFontPicker  _Nonnull picker, BOOL * _Nonnull stop) {
        SEL sel = NSSelectorFromString(selector);
        
        id result = [UIFont systemFontOfSize:arc4random_uniform(10)+10];
        [UIView animateWithDuration:0.3
                         animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                             [self performSelector:sel withObject:result];
#pragma clang diagnostic pop
                         }];
    }];
}


static void *kNSObject_DeallocBlocks;

- (id)addDeallocBlock:(void (^)())deallocBlock {
    if (deallocBlock == nil) {
        return nil;
    }
    
    NSMutableArray *deallocBlocks = objc_getAssociatedObject(self, &kNSObject_DeallocBlocks);
    if (deallocBlocks == nil) {
        deallocBlocks = [NSMutableArray array];
        objc_setAssociatedObject(self, &kNSObject_DeallocBlocks, deallocBlocks, OBJC_ASSOCIATION_RETAIN);
    }
    // Check if the block is already existed
    for (KKDeallocBlockExecutor *executor in deallocBlocks) {
        if (executor.deallocBlock == deallocBlock) {
            return nil;
        }
    }
    
    KKDeallocBlockExecutor *executor = [KKDeallocBlockExecutor executorWithDeallocBlock:deallocBlock];
    [deallocBlocks addObject:executor];
    return executor;
}


@end


@implementation KKDeallocBlockExecutor

+ (instancetype)executorWithDeallocBlock:(void (^)())deallocBlock {
    KKDeallocBlockExecutor *o = [KKDeallocBlockExecutor new];
    o.deallocBlock = deallocBlock;
    return o;
}

- (void)dealloc {
    if (self.deallocBlock) {
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}
@end

