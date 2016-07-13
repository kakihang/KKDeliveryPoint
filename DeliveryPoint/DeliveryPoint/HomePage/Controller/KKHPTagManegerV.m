//
//  KKHPTagManegerV.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/13.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagManegerV.h"
#import "KKHPTagsModel.h"
#import <DKNightVersion.h>
#import <UIView+SDAutoLayout.h>
#import <Masonry.h>
#import <POP.h>



@interface KKHPTagManegerV()
/** 返回栏 **/
@property (nonatomic, strong) UIView *backView;
// 返回栏标题
@property (nonatomic, strong) UILabel *label;
// 编辑按钮
@property (nonatomic, strong) UIButton *editButton;

// 频道
// 我的频道
@property (nonatomic, strong) NSMutableArray <KKHPTagsModel*> *mineTags;
// 社会热点频道
@property (nonatomic, strong) NSMutableArray <KKHPTagsModel*> *topTags;
// 健康咨询频道
@property (nonatomic, strong) NSMutableArray <KKHPTagsModel*> *infoTags;
// 健康知识频道
@property (nonatomic, strong) NSMutableArray <KKHPTagsModel*> *loreTags;

@end



@implementation KKHPTagManegerV

#pragma mark - 懒加载
- (UIView *)backView {
    if(_backView == nil) {
        _backView = [[UIView alloc] init];
        // 设置颜色
        _backView.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTagBgColor");
    }
    return _backView;
}

- (UILabel *)label {
    if(_label == nil) {
        _label = [[UILabel alloc] init];
        _label.text = @"频道管理";
        _label.font = [UIFont systemFontOfSize:KKHPTagsFontSize];
        _label.backgroundColor = [UIColor clearColor];
        _label.dk_textColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeCellTextColor");
        [_label sizeToFit];
    }
    return _label;
}

- (UIButton *)editButton {
    if(_editButton == nil) {
        _editButton = [[UIButton alloc] init];
        [_editButton setImage:[UIImage imageNamed:KKStringWithRootkeyStringKey(homePage, @"homeTagManBackXImage")] forState:UIControlStateNormal];
        [_editButton setImage:[UIImage imageNamed:KKStringWithRootkeyStringKey(homePage, @"homeTagManBackXImage_click")] forState:UIControlStateHighlighted];
    }
    return _editButton;
}



#pragma mark - 加载方法

- (void)layoutSubviews {
    
    // 设置约束
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(KKHomePageTagsBarHeight);
    }];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.backView);
    }];
    
    [self.editButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(KKHomePageTagsWidth/2);
        make.height.mas_equalTo(KKHomePageTagsHeight);
        make.right.mas_equalTo(self).mas_equalTo(-10);
        make.top.mas_equalTo(self).mas_equalTo(5);
    }];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        // 设置背景颜色
        self.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTagManViewBgColor");
        
        // 设置返回栏
        [self addSubview:self.backView];
        
        // 设置文字
        [self.backView addSubview:self.label];
        
        // 设置编辑按钮
        [self.backView addSubview:self.editButton];
        [self.editButton addTarget:self action:@selector(clickEdit:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return self;
}



#pragma mark - 流程方法

static UIWindow *window_;
+ (void)show {
    // 新建Window窗口
    window_ = [[UIWindow alloc] initWithFrame:MAINBOUNDS];
    window_.y += NAVIGATIONHEIGHT;
    window_.height -= NAVIGATIONHEIGHT;
    
    // 设置为可见，默认为不可见
    window_.hidden = NO;
    
    KKHPTagManegerV *tagMana = [[KKHPTagManegerV alloc] initWithFrame:window_.bounds];
    [window_ addSubview:tagMana];
}


- (void)clickEdit:(UIButton *)sender {
    [self cancelWithCompletionBlock];
}

- (void)cancelWithCompletionBlock {
    self.userInteractionEnabled = NO;
    
    // 位移动画
    POPBasicAnimation *animCenter = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    // 动画节奏
    animCenter.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    // 最后的位置
    animCenter.toValue = [NSValue valueWithCGPoint:CGPointMake(window_.centerX, window_.centerY - 100)];
    
    // 透明度动画
    POPBasicAnimation *animAlpha = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    animAlpha.toValue = [NSNumber numberWithDouble:0.0];
    animAlpha.duration = 0.5f;
    
    [window_ pop_addAnimation:animCenter forKey:nil];
    [window_ pop_addAnimation:animAlpha forKey:nil];
    
    [animCenter setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
    }];
}


@end
