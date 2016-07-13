//
//  UIButton+KKHPSearchButton.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "UIButton+KKHPSearchButton.h"
#import <DKNightVersion.h>

@implementation UIButton (KKHPSearchButton)

+ (instancetype)buttonForSearch:(CGRect)rect {
    // 导航栏的搜索按钮
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
    searchButton.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeNavSearchBgColor");
    
    
    [searchButton setImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    searchButton.tag = 1001;
    [searchButton setTitle:@"搜索更多" forState:UIControlStateNormal];
    searchButton.titleLabel.font = [UIFont systemFontOfSize:14];
    searchButton.layer.cornerRadius = 10;
    [searchButton dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
        KKButtonTitleColorForThemeVersion(homePage, @"homeNavSearchTextColor");
    } forState:UIControlStateNormal];
    
    
    /** 设置搜索按钮位置 **/
    searchButton.x = rect.size.width*0.5;
    searchButton.y = rect.size.height * 0.4;
    searchButton.width = (rect.size.width - searchButton.x) * 0.95;
    searchButton.height = (rect.size.height - searchButton.y) * 0.7;
    
    CGFloat margin = 20;
    CGFloat iamgeViewX = searchButton.imageView.x;
    if (iamgeViewX > margin) {
        CGFloat curX = iamgeViewX - margin;
        searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, -curX, 0, curX);
    }
    
    margin = CGRectGetMaxX(searchButton.imageView.frame) + margin;
    CGFloat titleLabelX = searchButton.titleLabel.x;
    if (titleLabelX > margin) {
        CGFloat curX = titleLabelX - margin;
        searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, -curX, 0, curX);
    }
    
    return searchButton;
}



@end
