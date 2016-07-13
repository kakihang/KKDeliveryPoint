//
//  KKHPNewsInfoVC.m
//  DeliveryPoint
//
//  Created by kaki on 16/7/7.
//  Copyright © 2016年 liudhkk. All rights reserved.
//

#import "KKHPNewsInfoVC.h"
#import "KKHPNewsInfoTVCell.h"
#import "KKHPTagsModel.h"
#import "KKNewsContentModel.h"

#import <DKNightVersion.h>
#import <MJRefresh.h>
#import <AFNetworking.h>
#import <AFNetworkActivityIndicatorManager.h>
#import <MJExtension.h>


static NSString *cellID_ = @"KKHPhlidTableViewCellID";

@interface KKHPNewsInfoVC () <UITableViewDataSource>
/** 内容数组 **/
@property (nonatomic, strong) NSMutableArray <KKNewsContentModel *> *infos;
/** 管理器 **/
@property (nonatomic, strong)  AFHTTPSessionManager *manager;
/** 队列 **/
@property (nonatomic, strong) NSOperationQueue *queue;
/** list url **/
@property (nonatomic, strong) NSString *listUrl;
/** 网络参数 **/
@property (nonatomic, strong) NSMutableDictionary *params;
/** 页数 **/
@property (atomic, assign) NSInteger page;
/** 全部渠道加锁 **/
@property (atomic, assign) NSInteger allInterger;
@end

@implementation KKHPNewsInfoVC


#pragma mark - 懒加载

- (NSMutableArray *)infos {
    if(_infos == nil) {
        _infos = [NSMutableArray array];
    }
    return _infos;
}

- (AFHTTPSessionManager *)manager {
    if(_manager == nil) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (NSString *)listUrl {
    if(_listUrl == nil) {
        _listUrl = [NSString kk_stringUrlWithRootKey:self.tagsModel.type key:@"list"];
    }
    return _listUrl;
}

- (NSOperationQueue *)queue {
    if(_queue == nil) {
        _queue = [NSOperationQueue new];
    }
    return _queue;
}



#pragma mark - method

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.dk_backgroundColorPicker = KKColorWithRootkeyColorKey(homePage, @"homeViewBgColorDefault");
    
    self.tableView.contentInset = UIEdgeInsetsMake(64+KKHomePageTagsToNavMargin+10, 0, 44, 0);
    
    // 在状态栏显示网络状态 菊花
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [self setupRefresh];
}

- (void)setupRefresh {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    self.tableView.mj_footer.hidden = YES;
}

- (void)loadNewData {
    self.page = 1;
    [self.infos removeAllObjects];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (0 == self.index) {
        params[@"rows"] = @6;
        
        // 全部，需遍历3个渠道
        NSBlockOperation *operationTop = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"top" key:@"list"] params:params];
        }];
        
        NSBlockOperation *operationInfo = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"info" key:@"list"] params:params];
        }];
        
        NSBlockOperation *operationLore = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"lore" key:@"list"] params:params];
        }];
        
        [self.queue addOperations:@[operationTop, operationInfo, operationLore] waitUntilFinished:YES];
        
    } else {
        // 根据type和ID获取数据
        params[@"id"] = @(self.tagsModel.ID);
        params[@"page"] = @(self.page);
        [self getNewNetWorkData:self.listUrl params:params];
    }
    
}

- (void)getNewNetWorkData:(NSString *)url params:(NSMutableDictionary *)params {
    
    NSLog(@"\n%@\n%@", url, params);
    self.params = params;
    
    [self.manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *infos = [KKNewsContentModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]];
        
        [self.infos addObjectsFromArray:infos];
        
        if (0 == self.index) {
            self.allInterger++;
            if (self.allInterger == 3) {
                [self.tableView reloadData];
                [self.tableView.mj_header endRefreshing];
                self.tableView.mj_footer.hidden = NO;
                self.allInterger = 0;
                self.page++;
            }
        } else {
            if (params != self.params) {
                return;
            }
            self.page++;
            [self.tableView reloadData];
            [self.tableView.mj_header endRefreshing];
            self.tableView.mj_footer.hidden = NO;
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", [error localizedDescription]);
        [self.tableView.mj_header endRefreshing];
    }];
}

- (void)loadMoreData {
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"page"] = @(self.page);
    
    if (0 == self.index) {
        params[@"rows"] = @6;
        
        // 全部，需遍历3个渠道
        NSBlockOperation *operationTop = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"top" key:@"list"] params:params];
        }];
        
        NSBlockOperation *operationInfo = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"info" key:@"list"] params:params];
        }];
        
        NSBlockOperation *operationLore = [NSBlockOperation blockOperationWithBlock:^{
            [self getNewNetWorkData:[NSString kk_stringUrlWithRootKey:@"lore" key:@"list"] params:params];
        }];
        
        [self.queue addOperations:@[operationTop, operationInfo, operationLore] waitUntilFinished:YES];
        
    } else {
        // 根据type和ID获取数据
        params[@"id"] = @(self.tagsModel.ID);
        [self getMoreNetWorkData:self.listUrl params:params];
        
    }
}

- (void)getMoreNetWorkData:(NSString *)url params:(NSMutableDictionary *)params {
    
    NSLog(@"\n%@\n%@", url, params);
    self.params = params;
    
    [self.manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *infos = [KKNewsContentModel mj_objectArrayWithKeyValuesArray:responseObject[@"tngou"]];
        
        [self.infos addObjectsFromArray:infos];
        
        if (0 == self.index) {
            if (self.page == 3) {
                [self.tableView reloadData];
                [self.tableView.mj_footer endRefreshing];
                self.tableView.mj_footer.hidden = NO;
            }
        } else {
            if (params != self.params) {
                return;
            }
            self.page++;
            [self.tableView reloadData];
            [self.tableView.mj_footer endRefreshing];
            self.tableView.mj_footer.hidden = NO;
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@", [error localizedDescription]);
        [self.tableView.mj_footer endRefreshing];
    }];
}

- (void)dealloc {
    [self.manager invalidateSessionCancelingTasks:YES];
    if (self.queue) {
        [self.queue cancelAllOperations];
    }
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    KKHPNewsInfoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID_];
    if (!cell) {
        cell = [[KKHPNewsInfoTVCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID_];
    }
    
    cell.textLabel.text = self.infos[indexPath.row].title;
    
    return cell;
}


@end
