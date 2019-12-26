//
//  UIScrollView+LCXRefresh.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIScrollView+LCXRefresh.h"
#import "MJRefresh.h"
#import <objc/runtime.h>

@implementation UIScrollView (LCXRefresh)

- (void)setFootFreshView{
    //下拉加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.mj_footer = footer;

    // 闲置状态文字
    [footer setTitle:@"上拉或点击，加载更多数据"  forState:MJRefreshStateIdle];
    //刷新状态文字
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    //没有更多数据了
    [footer setTitle:@"已经到底了" forState:MJRefreshStateNoMoreData];
    // 设置字体
    footer.stateLabel.font = [UIFont systemFontOfSize:17];
    // 设置颜色
    footer.stateLabel.textColor = [UIColor blueColor];
}

- (void)lcx_endRefresh{
    [self.mj_footer endRefreshing];
}

- (void)lcx_hiddenRefresh:(BOOL)isHidden{
    self.mj_footer.hidden = isHidden;
}

- (void)lcx_noMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}


#pragma mark - Action

- (void)loadMoreData{
    if (self.lcx_footerFreshBlock) {
        self.lcx_footerFreshBlock();
    }
}

#pragma mark - setters,getters

- (dispatch_block_t)lcx_footerFreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_footerFreshBlock:(dispatch_block_t)lcx_footerFreshBlock{
    objc_setAssociatedObject(self, @selector(lcx_footerFreshBlock), lcx_footerFreshBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    if (self.lcx_footerFreshBlock) {
        [self setFootFreshView];
    }
}
@end
