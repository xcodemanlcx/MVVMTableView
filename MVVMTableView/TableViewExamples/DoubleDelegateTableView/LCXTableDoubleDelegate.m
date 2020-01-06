//
//  LCXTableDoubleDelegate.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "LCXTableDoubleDelegate.h"
#import "UIView+LCXActionBlock.h"

@implementation LCXTableDoubleDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = _dataArr[indexPath.row];
    
    //1 复用id
    LCXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableView.lcx_reuseCellIDs[0]];

    //2 cell响应事件
    if (_cellForRowAtIndexPathBlock) {
        __weak typeof(self) weakSelf = self;
        __weak typeof(cell) weakCell = cell;
            if (!cell.lcx_actionBlock) {
                cell.lcx_actionBlock = ^(NSInteger actionIndex) {
                    NSIndexPath *selectedCellIndexPath = [tableView indexPathForCell:weakCell];
                    weakSelf.cellForRowAtIndexPathBlock(tableView, selectedCellIndexPath, actionIndex);
                };
            }
    }

    // 3 传值
    cell.cellModel = model;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *model = _dataArr[indexPath.row];
    return 80;//model.lcx_cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_didSelectRowAtIndexPathBlock) {
        _didSelectRowAtIndexPathBlock(tableView,indexPath);
    }
}
@end
