//
//  UILabel+KKFont.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UILabel+KKFont.h"
#import <objc/runtime.h>

@interface UILabel()

@property (nonatomic, strong) NSMutableDictionary<NSString *, KKFontPicker> *kpickers;
@end


@implementation UILabel (KKFont)

- (KKFontPicker)kk_fontPicker {
    return objc_getAssociatedObject(self, @selector(kk_fontPicker));
}

- (void)kk_setFont:(KKFontPicker)picker {
    objc_setAssociatedObject(self, @selector(kk_fontPicker), picker, OBJC_ASSOCIATION_COPY_NONATOMIC);
    self.font = picker([KKFontSizeManager sharedManager].fontVersion);
    [self.kpickers setValue:[picker copy] forKey:@"setFont:"];
}


@end
