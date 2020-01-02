//
//  UITableView+LCXRegisterCellClasses.h
//  LCXTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LCXRegisterCellClasses)

/**
 复用UITableViewCell的所有id
 */
@property (nonatomic, strong, readonly) NSMutableArray <__kindof NSString *> *lcx_reuseCellIDs;

/**
 注册UITableViewCell的需要复用cell类型
 */
- (void)lcx_registerCellClasses:(NSArray <Class> *)classes;

@end

NS_ASSUME_NONNULL_END
