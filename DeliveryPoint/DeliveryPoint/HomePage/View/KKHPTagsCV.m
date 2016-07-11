//
//  KKHPTagsCV.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/10.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagsCV.h"
#import <DKNightVersion.h>

@implementation KKHPTagsCV

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        self.backgroundColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

@end
