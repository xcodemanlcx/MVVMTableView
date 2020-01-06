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

- (void)lcx_handleDataNullViewWithStyleSel:(SEL)styleSel listView:(UIView *)listView dataArr:(NSArray *)dataArr{
    [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
        //自定义UI
        LCXDataNullView *dataNullView = [[LCXDataNullView alloc] initWithListView:listView];
        //执行自定义UI样式方法
        if ([dataNullView respondsToSelector:styleSel]) {
            #pragma clang diagnostic push
            #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [dataNullView performSelector:styleSel];
            #pragma clang diagnostic pop
        }
        return dataNullView;

    } dataArr:dataArr];
}

@end
