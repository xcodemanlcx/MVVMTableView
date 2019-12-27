//
//  NSMutableArray+LCXHandleMoreData.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSMutableArray+LCXHandleMoreData.h"

@implementation NSMutableArray (LCXHandleMoreData)

- (void)lcx_handleMoreData:(NSArray *)arr nowPage:(NSInteger)nowPage{
    if (!arr||![arr isKindOfClass:NSArray.class]||arr.count==0) return;
    if (nowPage == 0) {
        //刷新
        [self removeAllObjects];
    }
    [self addObjectsFromArray:arr];
}

@end
