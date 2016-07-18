//
//  KKFontSizeManager.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NSString KKFontVersion;

typedef UIFont *(^KKFontPicker)(KKFontVersion *fontVersion);

KKFontPicker KKFontPickerWithInteger(UIFont *normal, ...);


@interface KKFontSizeManager : NSObject

@property (nonatomic, strong) KKFontVersion *fontVersion;

+ (KKFontSizeManager *)sharedManager;

- (void)kk_MinSize;

- (void)kk_MiddleSize;

- (void)kk_MaxSize;

@end
