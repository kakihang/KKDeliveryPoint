//
//  KKHPTagsModel.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagsModel.h"
#import <MJExtension.h>

static NSString *KID = @"KID";
static NSString *KName = @"KName";
static NSString *KTitle = @"KTitle";
static NSString *KKeywords = @"KKeywords";
static NSString *KType = @"KType";
static NSString *KSection= @"KSection";

@implementation KKHPTagsModel 

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID" : @"id"};
}

+ (instancetype)tagFirstModel {
    KKHPTagsModel *tag = [[KKHPTagsModel alloc] init];
    tag.ID = 0;
    tag.name = @"全部";
    tag.title = @"全部";
    tag.keywords = @"全部";
    
    return tag;
}

#pragma mark - <NSCoding> 数据归档解档

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:self.ID forKey:KID];
    [aCoder encodeObject:self.name forKey:KName];
    [aCoder encodeObject:self.title forKey:KTitle];
    [aCoder encodeObject:self.keywords forKey:KKeywords];
    [aCoder encodeObject:self.type forKey:KType];
    [aCoder encodeObject:self.section forKey:KSection];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.ID = [aDecoder decodeIntegerForKey:KID];
    self.name = [aDecoder decodeObjectForKey:KName];
    self.title = [aDecoder decodeObjectForKey:KTitle];
    self.keywords = [aDecoder decodeObjectForKey:KKeywords];
    self.type = [aDecoder decodeObjectForKey:KType];
    self.section = [aDecoder decodeObjectForKey:KSection];
    return self;
}

@end
