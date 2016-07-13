//
//  KKHPTagViewModel.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KKHPTagViewModel : NSObject

// button的个数
@property (nonatomic, assign) NSInteger buttonCount;

// button的text
- (NSString *)textForNum:(NSInteger)number;


@end
