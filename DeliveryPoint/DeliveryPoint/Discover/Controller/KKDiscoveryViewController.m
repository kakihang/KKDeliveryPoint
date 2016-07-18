//
//  KKDiscoveryViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/4.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKDiscoveryViewController.h"
#import <DKNightVersion.h>



@interface KKDiscoveryViewController ()
// label
@property (nonatomic, strong) UILabel *label;
@end

@implementation KKDiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 测试 **/
    NSLog(@"%s", __func__);
    self.label = [[UILabel alloc] init];
    self.label.text = @"abc";
    self.label.frame = CGRectMake(100, 100, 50, 50);
    [self.view addSubview:self.label];
    self.label.backgroundColor = [UIColor orangeColor];
    self.label.textColor = [UIColor blackColor];
    [self.label kk_setFont:KKFontPickerWithInteger([UIFont systemFontOfSize:10],[UIFont systemFontOfSize:13],[UIFont systemFontOfSize:16])];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"kkqwertyuiop" object:nil];
    NSInteger ar = arc4random_uniform(3);
    if (ar == 0) {
        [[KKFontSizeManager sharedManager] kk_MaxSize];
    } else if (ar == 1) {
        [[KKFontSizeManager sharedManager] kk_MinSize];
    } else {
        [[KKFontSizeManager sharedManager] kk_MiddleSize];
    }
}



@end
