//
//  KKHPNavBar.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/5.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNavBar.h"
#import <DKNightVersion.h>
#import <UIView+SDAutoLayout.h>
#import <Masonry.h>

@interface KKHPNavBar()
/** 主页标题 **/
@property (nonatomic, weak) UILabel *titleLabel;
/** 搜索button **/
@property (nonatomic, weak) UIButton *searchButton;

@end


@implementation KKHPNavBar

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    /** 设置title位置 **/
    self.titleLabel.x = self.width * 0.05;
    self.titleLabel.y = self.height * 0.2;
    [self.titleLabel sizeToFit];
    
    /** 设置搜索按钮位置 **/
    self.searchButton.x = CGRectGetMaxX(self.titleLabel.frame) + self.width*0.1;
    self.searchButton.y = self.titleLabel.y;
    self.searchButton.width = (self.width - self.searchButton.x) * 0.95;
    self.searchButton.height = self.height * 0.6;
    
    CGFloat margin = 20;
    CGFloat iamgeViewX = self.searchButton.imageView.x;
    if (iamgeViewX > margin) {
        CGFloat curX = iamgeViewX - margin;
        self.searchButton.imageEdgeInsets = UIEdgeInsetsMake(0, -curX, 0, curX);
    }
    
    margin = CGRectGetMaxX(self.searchButton.imageView.frame) + margin;
    CGFloat titleLabelX = self.searchButton.titleLabel.x;
    if (titleLabelX > margin) {
        CGFloat curX = titleLabelX - margin;
        self.searchButton.titleEdgeInsets = UIEdgeInsetsMake(0, -curX, 0, curX);
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%s", __func__);
        self.barTintColor = [UIColor orangeColor];
        self.dk_barTintColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTabBarbgColor");
        
        
        
        // 导航栏的标题
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.backgroundColor = [UIColor clearColor];
        [titleLabel setText:@"新闻资讯"];
        titleLabel.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeNavTitleColor");
        
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        // 导航栏的搜索按钮
        UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [searchButton setBackgroundImage:[UIImage new] forState:UIControlStateNormal];
        searchButton.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeNavSearchBgColor");
        
        
        [searchButton setImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
        searchButton.tag = 1001;
        [searchButton setTitle:@"搜索更多" forState:UIControlStateNormal];
        searchButton.titleLabel.font = [UIFont systemFontOfSize:14];
        searchButton.layer.cornerRadius = 10;
        [searchButton dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
            KKButtonTitleColorForThemeVersion(homePage, @"homeNavSearchTextColor");
        } forState:UIControlStateNormal];
        [self addSubview:searchButton];
        
        self.searchButton = searchButton;
        
    }
    
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//}




@end
