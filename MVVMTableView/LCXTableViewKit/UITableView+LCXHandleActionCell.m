//
//  UITableView+LCXHandleActionCell.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+LCXHandleActionCell.h"

@implementation UITableView (LCXHandleActionCell)

- (UITableViewCell *)lcx_reuseCellID:(NSString *)reuseCellID cellActionBlock:(LCXCellActionBlock)cellActionBlock{
    
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:reuseCellID];
    
    if (cellActionBlock) {
            if (!cell.lcx_actionBlock) {
                __weak typeof(self) weakSelf = self;
                __weak typeof(cell) weakCell = cell;
                cell.lcx_actionBlock = ^(NSInteger cellActionIndex) {
                    NSIndexPath *actionCellIndexPath = [weakSelf indexPathForCell:weakCell];
                    
                   //cell中的响应事件
                    cellActionBlock(actionCellIndexPath,cellActionIndex);
                };
        }
    }
    return cell;
}

@end
