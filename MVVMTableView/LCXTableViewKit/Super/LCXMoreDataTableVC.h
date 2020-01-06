//
//  LCXMoreDataTableVC.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/30.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

//LCXTableViewTool
#import "LCXTableViewKit.h"

//加载更多： 列表数据逻辑处理
#import "NSMutableArray+LCXHandleMoreData.h"
//加载更多： 刷新提示UI
#import "UIScrollView+LCXRefresh.h"

//数据为空：自定义UI
#import "NSObject+LCXDataNullViewHandle.h"
#import "LCXDataNullView+Style.h"

//网络异常：自定义UI
#import "NSObject+LCXNoNetworkViewHandle.h"
#import "LCXNoNetworkView+Style.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXMoreDataTableVC : UIViewController

@property (nonatomic, strong) UITableView *tableView;
// 列表数据
@property(nonatomic, strong) NSMutableArray *dataArr;
// 数据总量
@property(nonatomic, assign) NSUInteger totalSize;
// 数据获取成功后，最新页码
@property(nonatomic, assign) NSUInteger page;

// 上拉刷新提示UI处理
- (void)handleRefreshFooterWithTotalSize:(NSUInteger)totalSize pageSize:(NSUInteger)pageSize;

@end

NS_ASSUME_NONNULL_END
