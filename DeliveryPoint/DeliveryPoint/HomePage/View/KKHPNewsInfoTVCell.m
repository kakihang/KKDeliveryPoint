//
//  KKHPNewsInfoTVCell.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNewsInfoTVCell.h"
#import <DKNightVersion.h>

@implementation KKHPNewsInfoTVCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeViewBgColorDefault");
    //    self.backgroundColor = [UIColor orangeColor];
    // cell 标题 颜色
    self.textLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellTextColor");
    
    // cell 说明颜色
    self.detailTextLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellDetailTextColor");
}

@end
