//
//  KKHomePageVC.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHomePageVC.h"
#import "KKHPNewsInfoVC.h"
#import "KKHPTagsSView.h"
#import "KKHPTagButton.h"
#import "KKHPTagGetData.h"
#import "KKHPTagsModel.h"
#import "KKHPTagsManagerVC.h"
#import "KKHPTagManegerV.h"
#import "UIButton+KKHPSearchButton.h"
#import "UILabel+KKHPNarTitle.h"
#import <DKNightVersion.h>
#import <UIView+SDAutoLayout.h>


static NSString *cellID_ = @"collectionCellID";

@interface KKHomePageVC () <UIScrollViewDelegate>
/** 标签数组 **/
@property (nonatomic, strong) NSMutableArray <KKHPTagsModel*>*tagsArray;
/** 底部内容 **/
@property (nonatomic, weak) UIScrollView *contentView;
/** 顶部滑动标签 **/
@property (nonatomic, weak) UIScrollView *tagView;
/** 选中的标签 **/
@property (nonatomic, weak) KKHPTagButton *selectButton;
/** 搜索按钮 **/
@property (nonatomic, weak) UIButton *searchbutton;
@end

@implementation KKHomePageVC


#pragma mark - 懒加载

- (NSMutableArray *)tagsArray {
    if(_tagsArray.count == 0) {
        _tagsArray = [[KKHPTagGetData kk_HPGetTagDatas] mutableCopy];
    }
    return _tagsArray;
}


#pragma mark - 过程方法

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupView) name:KKHomePageTagReloadDataMessage object:nil];
    
    // 设置导航栏
    [self setupNav];
    
    // 添加数据刷新界面
    [self setupView];
}


//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    if (self.tabBarController.tabBar.isHidden) {
//        self.tabBarController.tabBar.hidden = NO;
//    }
//}


- (void)setupNav {
    
    // 设置左边的标题
    UILabel *label = [UILabel labelForTitle:@"新闻资讯" rect:self.navbar.frame];
    [self.navbar addSubview:label];
    
    // 设置右边的搜索按钮
    UIButton *button = [UIButton buttonForSearch:self.navbar.frame];
    [button addTarget:self action:@selector(pushToSearch:) forControlEvents:UIControlEventTouchUpInside];
    [self.navbar addSubview:button];
    self.searchbutton = button;
}


// 跳转到搜索页面
- (void)pushToSearch:(UIButton*)sender {
    NSLog(@"%s", __func__);
}


- (void)setupView {
    
    if (self.tagsArray.count == 0) {
        return;
    }
    
    NSLog(@"收到数据:%zd", self.tagsArray.count);
    
    // 添加自控制器
    [self setupChildVC];
    
    // 设置底部内容窗口
    [self setupContentView];
    
    // 设置顶部标签
    [self setupTags];
}


- (void)setupChildVC {
    // 第一个为全部
    for (int i=0; i<self.tagsArray.count; i++) {
        KKHPNewsInfoVC *vc = [[KKHPNewsInfoVC alloc] init];
        vc.index = i;
        [self addChildViewController:vc];
        
        if (i == 0) {
            continue;
        }
        
        vc.tagsModel = self.tagsArray[i];
    }
}


// 设置底部内容窗口
- (void)setupContentView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *contentView = [[UIScrollView alloc] init];
    contentView.frame = self.view.bounds;
    contentView.delegate = self;
    // 添加内容view,放到最底层
    [self.view insertSubview:contentView atIndex:0];
    
    contentView.contentSize = CGSizeMake(contentView.width * self.childViewControllers.count, 0);
    
    // 整页滚动
    contentView.pagingEnabled = YES;
    // 取消弹性
    contentView.bounces = NO;
    
    self.contentView = contentView;
    [self resetScrollView:contentView tabBar:YES];
    
    // 添加第一个控制器的view
    [self scrollViewDidEndScrollingAnimation:contentView];
}


// 设置滑动标签
- (void)setupTags {
    CGFloat y = 64+KKHomePageTagsToNavMargin;
    CGFloat width = self.view.width - KKHomePageLastTagWidth/* - KKHomePageTagsMargin*/;
    CGFloat height = KKHomePageTagsBarHeight;
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, y, self.view.width, height)];
    
    bgView.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTagBgColor");
    
    KKHPTagsSView *tagView = [[KKHPTagsSView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    
    [bgView addSubview:tagView];
    
    tagView.delegate = self;
    [self.view insertSubview:bgView atIndex:1];
    self.tagView = tagView;
    
    [self setTagButton];
    
    [self setSettingTag:bgView];
}


- (void)setTagButton {
    // 添加按钮
    CGFloat maxX = KKHomePageTagsMargin;
    for (NSInteger i = 0; i < self.tagsArray.count; i++) {
        KKHPTagButton *button = [KKHPTagButton buttonCreate:self.tagsArray[i].name];
        button.tag = i + 1050;
        [button addTarget:self action:@selector(tagClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.origin = CGPointMake(maxX, KKHomePageTagsBarHeight/2.0 - button.height/2.0);
        maxX = CGRectGetMaxX(button.frame) + KKHomePageTagsMargin;
        
        [self.tagView addSubview:button];
    }
    
    self.tagView.contentSize = CGSizeMake(maxX, 0);
    // 默认点击第一个标签
    [self tagClick:(KKHPTagButton *)[self.tagView viewWithTag:1050]];
}


- (void)setSettingTag:(UIView *)bgView {
    
    KKHPTagButton *lastTag = [KKHPTagButton buttonCreate:KKHomePageLastTag];
    [bgView addSubview:lastTag];
    lastTag.sd_layout.rightSpaceToView(bgView, 0).topSpaceToView(bgView, 0).bottomSpaceToView(bgView, 0).widthIs(1.0*KKHomePageTagsWidth/3*2);
    [lastTag addTarget:self action:@selector(clikSetTag:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)clikSetTag:(KKHPTagButton *)clikSetTag {
    //    self.hidesBottomBarWhenPushed = YES;
    //    KKHPTagsManagerVC *tagManager = [[KKHPTagsManagerVC alloc] init];
    //    [self.navigationController pushViewController:tagManager animated:YES];
    //    self.hidesBottomBarWhenPushed = NO;
    
    [UIButton animateWithDuration:0.2 animations:^{
        self.searchbutton.hidden = YES;
        [KKHPTagManegerV show];
    }];
}


- (void)tagClick:(KKHPTagButton *)button {
    if (!button || button == self.selectButton) {
        return;
    }
    
    NSInteger index = button.tag - 1050;
    NSLog(@"click:%zd dis:%zd", index, self.selectButton.tag-1050);
    // 修改按钮状态
    
    self.selectButton.selected = NO;
    button.selected = YES;
    self.selectButton = button;
    
    // 滑动标签
    [UIView animateWithDuration:1.0 animations:^{
        CGPoint tagOffset = self.tagView.contentOffset;
        CGFloat minOffsetX = 0;
        CGFloat maxOffsetX = self.tagView.contentSize.width - self.view.width + KKHomePageLastTagWidth;
        CGFloat minCenterX = self.view.width * 0.5;
        CGFloat maxCenterX = maxOffsetX + minCenterX;
        CGFloat centerX = tagOffset.x + minCenterX;
        
        if (button.centerX <= minCenterX) {
            tagOffset.x = minOffsetX;
        } else if (button.centerX >= maxCenterX) {
            tagOffset.x = maxOffsetX;
        } else {
            tagOffset.x += button.centerX - centerX;
        }
        [self.tagView setContentOffset:tagOffset animated:YES];
    }];
    
    // 滚动 contentView
    CGPoint offset = self.contentView.contentOffset;
    offset.x = index* self.contentView.width;
    [self.contentView setContentOffset:offset animated:YES];
}



#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    if (scrollView == self.tagView) {
        
    } else {
        // 添加子控制器的view
        
        // 当前的索引
        NSInteger index = scrollView.contentOffset.x / scrollView.width;
        NSLog(@"添加第 %zd 个子控制器", index);
        // 取出子控制器
        UIViewController *vc = self.childViewControllers[index];
        vc.view.x = scrollView.contentOffset.x;
        vc.view.y = 0; // 设置控制器view的y值为0，默认是20
        vc.view.height = scrollView.height; // 设置控制器高度为整个屏的高度(默认高度比整屏幕少20)
        
        // 设置内边距
        [scrollView addSubview:vc.view];
        
        // 点击按钮
        [self tagClick:(KKHPTagButton *)[self.tagView viewWithTag:index+1050]];
    }
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (scrollView == self.tagView) {
        
    } else {
        [self scrollViewDidEndScrollingAnimation:scrollView];
    }
}


@end
