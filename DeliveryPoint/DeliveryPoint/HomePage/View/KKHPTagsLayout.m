//
//  KKHPTagsLayout.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagsLayout.h"

@interface KKHPTagsLayout()
/** 布局属性 **/
@property (nonatomic, strong) NSMutableArray <UICollectionViewLayoutAttributes *> *attrs;
/** 最大x值 **/
@property (nonatomic, assign) CGFloat maxX;
@end

@implementation KKHPTagsLayout

- (NSMutableArray <UICollectionViewLayoutAttributes *> *)attrs {
    if(_attrs == nil) {
        _attrs = [[NSMutableArray <UICollectionViewLayoutAttributes *> alloc] init];
    }
    return _attrs;
}

/** 用来做布局的初始化操作，不建议在init中进行布局初始化 **/
- (void)prepareLayout {
    [super prepareLayout];
    
    // 滑动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // cell的个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        // 创建indexPath
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        
        UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrs addObject:attr];
    }
    
}

/** 当collectionView现实范围发生变化时，是否刷新布局 **/
/** 一旦重新布局,马上调用 layoutAttributesForElementsInRect **/
//- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
//    return NO;
//}

// 决定cell的排布
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    return self.attrs;
}

/** 返回对应的布局属性 **/
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger number = indexPath.row;
    
    // 创建cell属性对象
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 设置cell 的布局属性
    CGFloat width = [self.tagsArray[number] boundingRectWithSize:CGSizeMake(MAXFLOAT, KKHomePageTagsHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:KKHPTagsFontSize]} context:nil].size.width + 20;
    
    CGFloat x = !number ? self.maxX + KKHomePageTagsMargin : self.maxX;
    CGFloat y = KKHomePageTagsToNavMargin;
    CGFloat height = KKHomePageTagsHeight;
    attr.frame = CGRectMake(x, y, width, height);
    
    self.maxX = CGRectGetMaxX(attr.frame) + KKHomePageTagsMargin;
    
    return attr;
}

/** 返回实际的大小 **/
- (CGSize)collectionViewContentSize {
    
    return CGSizeMake(self.maxX > self.collectionView.width ? self.maxX : self.collectionView.width, KKHomePageTagsHeight);
}

/** 深拷贝 **/
- (NSArray *)deepCopyWithArray:(NSArray *)array {
    NSMutableArray *copys = [NSMutableArray arrayWithCapacity:array.count];
    
    for (UICollectionViewLayoutAttributes *attris in array) {
        [copys addObject:[attris copy]];
    }
    return copys;
}

@end
