//
//  KKFont.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKFont : NSObject
/** 字体大小标识 **/
@property (nonatomic, assign) KKFontSize fontType;
/** 当前字体 **/
@property (nonatomic, strong) NSDictionary *currentFonts;

/** 单例 **/
/** 返回Font.plist文件小或中或大字体的字典 **/

+ (instancetype)shareFont;

@end
