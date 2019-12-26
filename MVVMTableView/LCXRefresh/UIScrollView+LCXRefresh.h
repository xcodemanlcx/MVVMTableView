//
//  UIScrollView+LCXRefresh.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIScrollView (LCXRefresh)

@property (nonatomic ,copy) dispatch_block_t lcx_footerFreshBlock;

- (void)lcx_endRefresh;
- (void)lcx_hiddenRefresh:(BOOL)isHidden;
- (void)lcx_noMoreData;

@end

NS_ASSUME_NONNULL_END
