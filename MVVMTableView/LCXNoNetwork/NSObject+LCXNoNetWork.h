//
//  NSObject+LCXNoNetWork.h
//  MVVMTableView
//
//  Created by lcx on 2019/11/4.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCXNoNetworkView.h"

NS_ASSUME_NONNULL_BEGIN

typedef UIView *_Nonnull(^LCXCustomNoNetworkViewBlock)(void);

@interface NSObject (LCXNoNetWork)

@property (nonatomic ,strong) UIView *_Nullable lcx_noNetworkView;

/**
网络异常（无网络）逻辑处理
*/
- (void)lcx_customNoNetWorkViewBlock:(LCXCustomNoNetworkViewBlock)customNoNetWorkViewBlock  isNoNetWork:(BOOL)isNoNetWork;

@end

NS_ASSUME_NONNULL_END
