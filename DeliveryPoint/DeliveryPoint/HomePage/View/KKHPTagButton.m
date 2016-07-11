//
//  KKHPTagButton.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/9.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagButton.h"
#import <DKNightVersion.h>

@implementation KKHPTagButton

+ (instancetype)buttonCreate:(NSString *)text {
    KKHPTagButton *button = [[KKHPTagButton alloc] init];
    
    // 赋值
    [button setTitle:text forState:UIControlStateNormal];
    
    // 设置 size
    CGFloat width = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, KKHomePageTagsHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:KKHPTagsFontSize]} context:nil].size.width + 20;
    button.size = CGSizeMake(width, KKHomePageTagsHeight);
    
    // 设置字体颜色
    [button dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
        KKButtonTitleColorForThemeVersion(homePage, @"homeCellTextColor");
    } forState:UIControlStateNormal];
    
    [button dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
        KKButtonTitleColorForThemeVersion(homePage, @"homeTagSelectColor");
    } forState:UIControlStateSelected];
    
    //    [button dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
    //        KKButtonTitleColorForThemeVersion(homePage, @"homeTagSelectColor");
    //    } forState:UIControlStateFocused];
    
    return button;
    
}

@end
