//
//  KKMeViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKMeViewController.h"
#import <UIView+SDAutoLayout.h>
#import <DKNightVersion.h>
#import <AFNetworking.h>

@interface KKMeViewController ()
@end

@implementation KKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(me, @"viewBgColorDefault");
    
    /** 设置一个测试用的夜间模式按钮 **/
    [self setupSwitch];
    
    UIButton *bt = [[UIButton alloc] init];
    bt.frame = CGRectMake(100, 100, 100, 50);
    [bt addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [bt setTitle:@"button" forState:UIControlStateNormal];
    [bt dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
        return [themeVersion isEqualToString:DKThemeVersionNormal]?[UIColor whiteColor]:[UIColor blueColor];
    } forState:UIControlStateNormal];
    [bt dk_setTitleColorPicker:^UIColor *(DKThemeVersion *themeVersion) {
        return [themeVersion isEqualToString:DKThemeVersionNormal]?[UIColor redColor]:[UIColor whiteColor];
    } forState:UIControlStateHighlighted];
    [self.view addSubview:bt];
}

- (void)click {
    NSLog(@"click");
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
}

- (void)setupSwitch {
    
    UISwitch *swi = [[UISwitch alloc] init];
    swi.transform = CGAffineTransformMakeScale(3, 3);
    swi.center = self.view.center;
    [swi setOn:![self.dk_manager.themeVersion isEqualToString:DKThemeVersionNormal]];
    NSLog(@"themeVersion:%@", self.dk_manager.themeVersion);
    [swi addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view  addSubview:swi];
    
}

- (void)switchValueChange:(UISwitch *)swi {
    if (swi.isOn) {
        [self.dk_manager nightFalling];
    } else {
        [self.dk_manager dawnComing];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /** 字体大小存沙盒测试 **/
    //    NSLog(@"test old--%zd----", [KKFont shareFont].fontType);
    //    NSInteger aa = arc4random_uniform(3);
    //    NSLog(@"test new --%zd", aa);
    //    [KKFont shareFont].fontType = (KKFontSize)aa;
    NSLog(@"test---0---%s", __func__);
    NSLog(@"%@", [self textNet]);
    NSLog(@"test--000--%s", __func__);
}

- (NSDictionary *)textNet {
    NSLog(@"test---1---%s--%@", __func__, [NSThread currentThread]);
    __block NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [[AFHTTPSessionManager manager] GET:@"http://www.tngou.net/api/lore/classify" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        dict = responseObject;
        NSLog(@"test---2---%s-%@", __func__, [NSThread currentThread]);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"link error[%@]",[error localizedDescription]);
    }];
    NSLog(@"test---3---%s", __func__);
    return dict;
}

@end
