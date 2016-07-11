//
//  KKHPNewsInfoViewController.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNewsInfoViewController.h"
#import "KKHPNewsInfoTableViewCell.h"
#import <DKNightVersion.h>

@interface KKHPNewsInfoViewController ()

@end

@implementation KKHPNewsInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeViewBgColorDefault");
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(64+KKHomePageTagsToNavMargin + KKHomePageTagsBarHeight, 0, 44, 0);
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"KKHPhlidTableViewCellID";
    KKHPNewsInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[KKHPNewsInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"我是%zd", indexPath.section];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"我是%zd ", indexPath.row];
    
    return cell;
}

@end
