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

#pragma mark - 加载更多

- (void)lcx_setFooterFreshView{
    if (!self.lcx_footerFreshBlock) return;
    //下拉加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.mj_footer = footer;
    footer.hidden = YES;

    // 闲置状态文字
    [footer setTitle:@"上拉或点击，加载更多数据"  forState:MJRefreshStateIdle];
    //刷新状态文字
    [footer setTitle:@"正在加载" forState:MJRefreshStateRefreshing];
    //没有更多数据了
    [footer setTitle:@"已经到底了" forState:MJRefreshStateNoMoreData];
}

- (void)lcx_endFooterRefresh{
    [self.mj_footer endRefreshing];
}

- (void)lcx_hiddenFooter:(BOOL)isHidden{
    if(self.mj_footer.hidden!=isHidden)
    self.mj_footer.hidden = isHidden;
}

- (void)lcx_noMoreData{
    [self.mj_footer endRefreshingWithNoMoreData];
}


#pragma mark  Action

- (void)loadMoreData{
    if (self.lcx_footerFreshBlock) {
        self.lcx_footerFreshBlock();
    }
}

#pragma mark  setter,getter

- (dispatch_block_t)lcx_footerFreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_footerFreshBlock:(dispatch_block_t)lcx_footerFreshBlock{
    objc_setAssociatedObject(self, @selector(lcx_footerFreshBlock), lcx_footerFreshBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self lcx_setFooterFreshView];
}

#pragma mark - 下拉刷新

- (void)lcx_setHeaderFreshView{
    if (!self.lcx_headerFreshBlock) return;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:self.lcx_headerFreshBlock];
    self.mj_header = header;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"松开刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeText = ^NSString * _Nonnull(NSDate * _Nonnull lastUpdatedTime) {
        NSDateFormatter *dateFormatter = NSDateFormatter.new;
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSString *currentDateString = [dateFormatter stringFromDate:lastUpdatedTime];
        return [@"上次更新时间 " stringByAppendingString:currentDateString];
    };
}

- (void)lcx_endHeaderRefresh{
    [self.mj_header endRefreshing];
}

#pragma mark  setter,getter

- (dispatch_block_t)lcx_headerFreshBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_headerFreshBlock:(dispatch_block_t)lcx_headerFreshBlock{
    objc_setAssociatedObject(self, @selector(lcx_headerFreshBlock), lcx_headerFreshBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self lcx_setHeaderFreshView];
}

#pragma mark - 停止刷新

- (void)lcx_endRefresh{
    [self.mj_header endRefreshing];
    [self.mj_footer endRefreshing];
}

@end
