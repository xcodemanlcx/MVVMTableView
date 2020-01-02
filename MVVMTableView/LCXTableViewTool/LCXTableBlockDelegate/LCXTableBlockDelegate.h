//
//  LCXTableBlockDelegate.h
//  MVVMTableView
//
//  Created by lcx on 2020/1/2.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCXTableBlockDelegate : NSObject<UITableViewDelegate,UITableViewDataSource>

#pragma mark - block:UITableViewDataSource

@property (nonatomic, copy) NSInteger (^numberOfRowsInSectionBlock)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UITableViewCell *(^cellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath * indexPath);

#pragma mark - block:UITableViewDelegate

@property (nonatomic, copy) CGFloat (^heightForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void(^didSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END
