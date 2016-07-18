//
//  KKFontSizeManager.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKFontSizeManager.h"

NSString * const KKFontSizeVersionMin = @"MIN";
NSString * const KKFontSizeVersionMiddle = @"MIDDLE";
NSString * const KKFontSizeVersionMax = @"MAX";

NSString * const KKFontSizeChangingNotificaiton = @"KK.FONTSIZECHANGENOTIFICATION";
NSString * const KKFontSizeSandboxVersionKey = @"kaki.kk.fontsize.version.manager.fontVersion.n";

@implementation KKFontSizeManager

+ (KKFontSizeManager *)sharedManager {
    static dispatch_once_t once;
    static KKFontSizeManager *instance;
    dispatch_once(&once, ^{
        instance = [self new];
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        KKFontVersion *fontVersion = [userDefaults valueForKey:KKFontSizeSandboxVersionKey];
        fontVersion = fontVersion ?: KKFontSizeVersionMin;
        instance.fontVersion = fontVersion;
        
    });
    return instance;
}

- (void)kk_MinSize {
    self.fontVersion = KKFontSizeVersionMin;
}

- (void)kk_MiddleSize {
    self.fontVersion = KKFontSizeVersionMiddle;
}

- (void)kk_MaxSize {
    self.fontVersion = KKFontSizeVersionMax;
}

- (void)setFontVersion:(KKFontVersion *)fontVersion {
    
    if ([_fontVersion isEqualToString:fontVersion]) {
        // if type does not change, don't execute code below to enhance performance.
        return;
    }
    _fontVersion = fontVersion;
    
    // Save current theme version to user default
    [[NSUserDefaults standardUserDefaults] setValue:fontVersion forKey:KKFontSizeSandboxVersionKey];
    [[NSNotificationCenter defaultCenter] postNotificationName:KKFontSizeChangingNotificaiton
                                                        object:nil];
}


KKFontPicker KKFontPickerWithInteger(UIFont *normal, ...) {
    
    UIFont *normalFont = normal;
    
    // 从配置文件取出有多少个字体
    NSArray<KKFontVersion *> *themes = @[KKFontSizeVersionMin, KKFontSizeVersionMiddle, KKFontSizeVersionMax];
    NSMutableArray<UIFont *> *fonts = [[NSMutableArray alloc] initWithCapacity:themes.count];
    [fonts addObject:normalFont];
    NSUInteger num_args = themes.count - 1;
    va_list putins;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wvarargs"
    va_start(putins, num_args);
#pragma clang diagnostic pop
    for (NSUInteger i = 0; i < num_args; i++) {
        UIFont *font = va_arg(putins, UIFont *);
        [fonts addObject:font];
    }
    va_end(putins);
    
    return ^(KKFontVersion *fontVersion) {
        NSUInteger index = [themes indexOfObject:fontVersion];
        return fonts[index];
    };
}

@end
