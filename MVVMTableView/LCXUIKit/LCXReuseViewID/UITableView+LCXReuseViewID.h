//
//  UITableView+LCXReuseViewID.h
//  MVVMTableView
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LCXReuseViewID)

//注册复用cell类名
@property (nullable ,nonatomic, copy) NSArray <NSString *> *lcx_registerCellClassNames;

//注册复用分区头部和尾部类名
@property (nullable ,nonatomic, copy) NSArray <NSString *> *lcx_registerHeaderFooterClassNames;

@end

NS_ASSUME_NONNULL_END
