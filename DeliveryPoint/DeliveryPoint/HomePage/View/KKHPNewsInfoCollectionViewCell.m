//
//  KKHPNewsInfoCollectionViewCell.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//


#import "KKHPNewsInfoCollectionViewCell.h"
#import <DKNightVersion.h>


@interface KKHPNewsInfoCollectionViewCell()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end


@implementation KKHPNewsInfoCollectionViewCell


- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setText:(NSString *)text {
    _text = text;
    self.label.text = text;
    [self KK_setDisSelectColor];
}

// 设置选中时文字颜色
- (void)KK_setSelectColor {
    self.label.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTagSelectColor");
}

// 设置反选、平时文字颜色
- (void)KK_setDisSelectColor {
    self.label.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellTextColor");
    
}

@end
