//
//  UITableView+LCXHandleActionCell.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LCXActionBlock.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^LCXCellActionBlock)(NSIndexPath *actionCellIndexPath,NSInteger cellActionIndex);

@interface UITableView (LCXHandleActionCell)

/**
 处理响应 事件
 */
- (UITableViewCell *)lcx_reuseCellID:(NSString *)reuseCellID cellActionBlock:(LCXCellActionBlock)cellActionBlock;

@end

NS_ASSUME_NONNULL_END
