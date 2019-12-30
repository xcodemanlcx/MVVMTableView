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
    self.totalSize = totalSize;
    if (self.dataArr.count < pageSize) {
        //不超过1页，隐藏提示UI
        [self.tableView lcx_hiddenFooter:YES];
    }else{
        [self.tableView lcx_hiddenFooter:NO];
        //超过1页，无更多数据时，显示提示UI
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
