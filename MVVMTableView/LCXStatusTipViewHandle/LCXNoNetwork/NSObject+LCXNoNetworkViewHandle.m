//
//  NSObject+LCXNoNetworkViewHandle.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXNoNetworkViewHandle.h"
#import "LCXNoNetworkView.h"
#import "NSObject+LCXNoNetWork.h"

@implementation NSObject (LCXNoNetworkViewHandle)

- (void)lcx_handleNoNetworkViewWithlistView:(UIView *)listView reloadBlock:(dispatch_block_t)reloadBlock isNoNetWork:(BOOL)isNoNetWork{
    [self lcx_customNoNetWorkViewBlock:^UIView *_Nonnull{
        //自定义UI
        LCXNoNetworkView *noNetworkView = [[LCXNoNetworkView alloc] initWithListView:listView];
        noNetworkView.reloadBlock = reloadBlock;
    return noNetworkView;
    } isNoNetWork:isNoNetWork];
}

@end
