//
//  NSObject+LCXNoNetworkViewHandle.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXNoNetworkViewHandle.h"
#import "NSObject+LCXNoNetWork.h"
#import "LCXNoNetworkView.h"

@implementation NSObject (LCXNoNetworkViewHandle)

- (void)lcx_handleNoNetworkViewWithStyleSel:(SEL)styleSel listView:(UIView *)listView reloadBlock:(dispatch_block_t)reloadBlock isNoNetWork:(BOOL)isNoNetWork {
    [self lcx_customNoNetWorkViewBlock:^UIView *_Nonnull{
        //自定义UI
        LCXNoNetworkView *noNetworkView = [[LCXNoNetworkView alloc] initWithListView:listView];
        noNetworkView.reloadBlock = reloadBlock;
        //执行自定义UI样式方法
        if ([noNetworkView respondsToSelector:styleSel]) {
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [noNetworkView performSelector:styleSel];
            #pragma clang diagnostic pop
        }
        return noNetworkView;
    } isNoNetWork:isNoNetWork];
}

@end
