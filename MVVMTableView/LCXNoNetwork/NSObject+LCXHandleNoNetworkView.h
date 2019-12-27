//
//  NSObject+LCXHandleNoNetworkView.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+LCXNoNetWork.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCXHandleNoNetworkView)

- (void)lcx_handleNoNetworkViewWithlistView:(UIView *)listView reloadBlock:(dispatch_block_t)reloadBlock isNoNetWork:(BOOL)isNoNetWork;

@end

NS_ASSUME_NONNULL_END
