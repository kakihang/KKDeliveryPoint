//
//  KKNewsInfoViewModel.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKNewsInfoViewModel.h"
#import "KKNewsContentModel.h"

@implementation KKNewsInfoViewModel

- (NSMutableArray <KKNewsContentModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray <KKNewsContentModel *> alloc] init];
    }
    return _dataList;
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)iconUrlForRow:(NSInteger)row {
    // 添加NSString的类别，转换成URL，类别放PCH中
    return [NSURL URLWithString:self.dataList[row].img];
}

- (NSString *)titleForRow:(NSInteger)row {
    return self.dataList[row].title;
}

- (NSString *)detailTextForRow:(NSInteger)row {
    return self.dataList[row].descri;
}

// 访问人数
- (NSString *)visitCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%zd", self.dataList[row].count];
}

// 收藏人数
- (NSString *)collectCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%zd", self.dataList[row].rcount];
}

// 评论人数
- (NSString *)commentCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%zd", self.dataList[row].fcount];
}

// time
- (NSString *)timeForRow:(NSInteger)row {
    return [NSDate kk_stringTimeFromSeconds:self.dataList[row].time/1000];
    
}

@end
