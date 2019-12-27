//
//  NSObject+LCXHandleDataNullView.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXHandleDataNullView.h"
#import "LCXDataNullView.h"

@implementation NSObject (LCXHandleDataNullView)

- (void)lcx_handleDataNullViewWithlistView:(UIView *)listView dataArr:(NSArray *)dataArr{
    [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
        //自定义UI
        return [[LCXDataNullView alloc] initWithListView:listView];
    } dataArr:dataArr];
}

@end
