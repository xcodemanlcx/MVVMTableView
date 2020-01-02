//
//  NSObject+LCXDataNullViewHandle.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXDataNullViewHandle.h"
#import "NSObject+LCXDataNull.h"
#import "LCXDataNullView.h"

@implementation NSObject (LCXDataNullViewHandle)

- (void)lcx_handleDataNullViewWithlistView:(UIView *)listView dataArr:(NSArray *)dataArr{
    [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
        //自定义UI
        return [[LCXDataNullView alloc] initWithListView:listView];
    } dataArr:dataArr];
}

@end
