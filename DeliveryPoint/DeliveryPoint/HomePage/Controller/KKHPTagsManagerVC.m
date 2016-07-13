//
//  KKHPTagsManagerVC.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/12.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPTagsManagerVC.h"
#import "UIButton+KKHPExtension.h"
#import <DKNightVersion.h>


@interface KKHPTagsManagerVC ()

@end


@implementation KKHPTagsManagerVC


#pragma mark -
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.alpha = 0.8;
    
    // 导航栏设置
    [self setupNav];
    
    //    self.view.backgroundColor = [UIColor yellowColor];
    
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    // 隐藏tabBar
    //    if (!self.tabBarController.tabBar.hidden) {
    //        self.tabBarController.tabBar.hidden = YES;
    //    }
}


- (void)setupNav {
    // 设置导航栏背景颜色
    self.navbar.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeTabBarbgColor");
    
    // 设置title
    [self setNavBarTitle:@"频道管理"];
    [self setNavBarTitleDKColor:KKColorWithRootkeyColorKey(homePage, @"homeNavTitleColor")];
    
    // 设置右边的返回button
    UIButton *button = [UIButton kk_buttonForNavBack];
    [button addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    [self setNavBarLeftBtn:button];
}

- (void)backClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
