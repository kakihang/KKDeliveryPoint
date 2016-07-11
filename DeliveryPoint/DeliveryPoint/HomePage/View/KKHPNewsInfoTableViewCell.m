//
//  KKHPNewsInfoTableViewCell.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/8.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNewsInfoTableViewCell.h"
#import <DKNightVersion.h>

@implementation KKHPNewsInfoTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeViewBgColorDefault");
    
    // cell 标题 颜色
    self.textLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellTextColor");
    
    // cell 说明颜色
    self.detailTextLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellDetailTextColor");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
