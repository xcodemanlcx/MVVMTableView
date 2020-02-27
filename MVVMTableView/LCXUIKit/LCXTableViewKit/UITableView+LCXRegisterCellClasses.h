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

//注册类名
@property (nonatomic, copy) NSArray <NSString *> *lcx_registerCellClassNames;

@end

NS_ASSUME_NONNULL_END
