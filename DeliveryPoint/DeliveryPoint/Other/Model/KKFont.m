//
//  KKFont.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKFont.h"

@interface KKFont()
/** 所有的 字体设置 **/
@property (nonatomic, strong) NSDictionary *allFonts;
@end

@implementation KKFont

- (NSDictionary *)allFonts {
    if(_allFonts == nil) {
        _allFonts = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Font" ofType:@"plist"]];;
    }
    return _allFonts;
}

- (NSDictionary *)currentFonts {
    KKFontSize type = self.fontType;
    
    if (type == KKFontSizeMin) {
        return self.allFonts[@"min"];
    } else if (type == KKFontSizeMiddle) {
        return self.allFonts[@"middle"];
    } else {
        return self.allFonts[@"max"];
    }
}

+ (instancetype)shareFont {
    static KKFont *fontObj = nil;
    static dispatch_once_t onceToken;
    if (fontObj == nil) {
        dispatch_once(&onceToken, ^{
            fontObj = [[KKFont alloc] init];
            fontObj.fontType = (KKFontSize)[[NSUserDefaults standardUserDefaults] integerForKey:KKFontKey];
        });
    }
    
    return fontObj;
}

- (void)setFontType:(KKFontSize)fontType {
    @synchronized (self) {
        _fontType = fontType;
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:fontType] forKey:KKFontKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


@end
