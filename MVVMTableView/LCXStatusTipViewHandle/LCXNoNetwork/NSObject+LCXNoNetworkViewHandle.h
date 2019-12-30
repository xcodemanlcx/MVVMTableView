//
//  NSObject+LCXNoNetworkViewHandle.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCXNoNetworkViewHandle)

- (void)lcx_handleNoNetworkViewWithlistView:(UIView *)listView reloadBlock:(dispatch_block_t)reloadBlock isNoNetWork:(BOOL)isNoNetWork;

@end

NS_ASSUME_NONNULL_END
