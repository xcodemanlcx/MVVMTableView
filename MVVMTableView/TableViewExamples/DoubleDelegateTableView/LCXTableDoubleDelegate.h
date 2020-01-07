//
//  LCXTableDoubleDelegate.h
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+LCXListModel.h"
#import "LCXTableViewCell.h"
#import "UITableView+LCXRegisterCellClasses.h"

NS_ASSUME_NONNULL_BEGIN

/**
 适用：单分区，cell样式任意多个；
 */

@interface LCXTableDoubleDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

#pragma - block : UITableViewDataSource

@property (nonatomic, copy) void(^cellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *selectedCellIndexPath,NSInteger cellActionIndex);

#pragma - block : UITableViewDelegate

@property (nonatomic, copy) void(^didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
