//
//  KKMainStreamTabBarViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//



#import "KKMainStreamTabBarViewController.h"
#import "KKCustomNavigationC.h"
#import "KKHomePageVC.h"
#import "KKDiscoveryViewController.h"
#import "KKMeViewController.h"
#import "KKHPTagGetData.h"
#import <DKNightVersion.h>

/**
 *  @author liudhkk, 16-07-06 14:07:36
 *
 *  1. 受夜间模式影响
 *  2. 字体不受字体设置影响
 */


@implementation KKMainStreamTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 标签数据预处理
    [KKHPTagGetData kk_HPGetTagDatas];
    
    // 修改tabBar的渲染颜色
    self.tabBar.dk_tintColorPicker = KKColorWithRootkeyColorKey(mainStream, @"tintColor");
    
    // 修改tabBar的背景颜色
    self.tabBar.dk_barTintColorPicker = KKColorWithRootkeyColorKey(mainStream, @"tabBarbgColor");
    
    // 统一设置所有UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKMSTabBarFontSize]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKMSTabBarFontSize]} forState:UIControlStateSelected];
    
    // 添加首页子控制器
    [self setupViewController:[[KKHomePageVC alloc] init]
                     navTitle:nil
                  tabBarTitle:@"首页"
                        image:KKStringWithRootkeyStringKey(mainStream, @"homePageItemImage")
                selectedImage:KKStringWithRootkeyStringKey(mainStream, @"homePageItemImageClick")];
    
    // 添加发现子控制器
    [self setupViewController:[[KKDiscoveryViewController alloc] init]
                     navTitle:@"发现" tabBarTitle:@"发现"
                        image:KKStringWithRootkeyStringKey(mainStream, @"disconverItemImage")
                selectedImage:KKStringWithRootkeyStringKey(mainStream, @"disconverItemImageClick")];
    
    // 添加我子控制器
    [self setupViewController:[[KKMeViewController alloc] init]
                     navTitle:@"我" tabBarTitle:@"我"
                        image:KKStringWithRootkeyStringKey(mainStream, @"meItemImage")
                selectedImage:KKStringWithRootkeyStringKey(mainStream, @"meItemImageClick")];
}

- (void)setupViewController:(KKCustomVC *)viewController
                   navTitle:(NSString *)navTitle
                tabBarTitle:(NSString *)tabBarTitle
                      image:(NSString *)image
              selectedImage:(NSString *)selectedImage {
    
    /** 统一设置子控制器底色、导航栏颜色 **/
    // 如有特殊需求请求具体子控制器内修改
    viewController.view.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeViewBgColorDefault");
    viewController.navbar.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTabBarbgColor");
    
    KKCustomNavigationC *nav = [[KKCustomNavigationC alloc] initWithRootViewController:viewController];
    
    [viewController setNavBarTitle:navTitle];
    viewController.tabBarItem.title = tabBarTitle;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 添加子控制器
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
