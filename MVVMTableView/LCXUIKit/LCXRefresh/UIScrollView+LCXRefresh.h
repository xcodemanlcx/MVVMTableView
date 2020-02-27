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

/**下拉加载更多*/
@property (nonatomic ,copy) dispatch_block_t lcx_footerFreshBlock;
- (void)lcx_endFooterRefresh;
- (void)lcx_hiddenFooter:(BOOL)isHidden;
- (void)lcx_noMoreData;

/**上拉刷新*/
@property (nonatomic ,copy) dispatch_block_t lcx_headerFreshBlock;
- (void)lcx_endHeaderRefresh;

/**停止刷新*/
- (void)lcx_endRefresh;

#pragma mark - 上拉提示UI处理

- (void)lcx_handleRefreshFooterWithDataArr:(NSArray *)dataArr totalSize:(NSUInteger)totalSize;

@end

NS_ASSUME_NONNULL_END
