//
//  KKHPNewsInfoVC.h
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AFHTTPSessionManager;
@class KKHPTagsModel;

@interface KKHPNewsInfoVC : UITableViewController
/** 序号 **/
@property (nonatomic, assign) NSInteger index;
/** 数据源 **/
@property (nonatomic, strong) KKHPTagsModel *tagsModel;

@end
