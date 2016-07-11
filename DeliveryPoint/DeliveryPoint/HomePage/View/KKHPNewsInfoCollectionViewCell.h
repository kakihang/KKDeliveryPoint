//
//  KKHPNewsInfoCollectionViewCell.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKHPNewsInfoCollectionViewCell : UICollectionViewCell
/** text **/
@property (nonatomic, strong) NSString *text;

// 设置选中时文字颜色
- (void)KK_setSelectColor;
// 设置反选、平时文字颜色
- (void)KK_setDisSelectColor;

@end
