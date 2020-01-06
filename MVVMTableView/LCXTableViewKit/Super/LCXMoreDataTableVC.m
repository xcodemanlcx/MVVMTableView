//
//  LCXMoreDataTableVC.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/30.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXMoreDataTableVC.h"

@interface LCXMoreDataTableVC ()

@end

@implementation LCXMoreDataTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)handleRefreshFooterWithTotalSize:(NSUInteger)totalSize pageSize:(NSUInteger)pageSize{
    if (self.dataArr.count == 0) return;
    // 1 缓存数据总量
    self.totalSize = totalSize;
    // 2 数据不为空，显示上拉提示UI
    [self.tableView lcx_hiddenFooter:NO];
    // 3 上拉提示，更改状态
    if (self.dataArr.count < pageSize) {
        //数据总量不超过1页
        [self.tableView lcx_noMoreData];
    }else{
        //数据总量超过1页
        if (self.dataArr.count >= self.totalSize) {
            [self.tableView lcx_noMoreData];
        }
    }
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
