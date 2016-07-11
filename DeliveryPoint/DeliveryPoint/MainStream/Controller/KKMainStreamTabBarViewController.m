//
//  KKMainStreamTabBarViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//



#import "KKMainStreamTabBarViewController.h"
#import "KKHomePageViewController.h"
#import "KKDiscoveryViewController.h"
#import "KKMeViewController.h"
#import "KKHPTagDatas.h"
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
    
    [self setupTabBar];
    
}

- (void)setupTabBar {
    
    
    
    // 修改tabBar的渲染颜色
    self.tabBar.dk_tintColorPicker = KKColorWithRootkeyColorKey(mainStream, @"tintColor");
    
    // 修改tabBar的背景颜色
    self.tabBar.dk_barTintColorPicker = KKColorWithRootkeyColorKey(mainStream, @"tabBarbgColor");
    
    // 统一设置所有UITabBarItem属性
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKMSTabBarFontSize]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:KKMSTabBarFontSize]} forState:UIControlStateSelected];
    
    // 已添加UIView方式,修改tabbar的背景颜色
    //    UIView *bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    //    [self.tabBar insertSubview:bgView atIndex:0];
    
    [self setupViewController:[[KKHomePageViewController alloc] init] navTitle:nil tabBarTitle:@"首页" image:KKStringWithRootkeyStringKey(mainStream, @"homePageItemImage") selectedImage:KKStringWithRootkeyStringKey(mainStream, @"homePageItemImageClick")];
    
    [self setupViewController:[[KKDiscoveryViewController alloc] init] navTitle:@"发现" tabBarTitle:@"发现" image:KKStringWithRootkeyStringKey(mainStream, @"disconverItemImage") selectedImage:KKStringWithRootkeyStringKey(mainStream, @"disconverItemImageClick")];
    
    [self setupViewController:[[KKMeViewController alloc] init] navTitle:@"我" tabBarTitle:@"我" image:KKStringWithRootkeyStringKey(mainStream, @"meItemImage") selectedImage:KKStringWithRootkeyStringKey(mainStream, @"meItemImageClick")];
    
}

- (void)setupViewController:(UIViewController *)viewController navTitle:(NSString *)navTitle tabBarTitle:(NSString *)tabBarTitle image:(NSString *)image selectedImage:(NSString *)selectedImage {
    
    viewController.navigationItem.title = navTitle;
    
    viewController.tabBarItem.title = tabBarTitle;
    viewController.tabBarItem.image = [UIImage imageNamed:image];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    // 导航啦
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
