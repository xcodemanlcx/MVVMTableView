//
//  NSObjectReloadMore+LCXReloadMoreData.m
//  MVVMTableView
//
//  Created by lcx on 2019/10/28.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXReloadMoreData.h"
#import <objc/runtime.h>

@implementation NSObject (LCXReloadMoreData)

#pragma mark - arr data

- (void)lcx_handleMoreData:(NSArray *)arr totalSize:(NSUInteger)totalSize nowPage:(NSUInteger)nowPage{
    if (!arr||![arr isKindOfClass:NSArray.class]||arr.count==0) return;
    //数据总量
    self.lcx_totalSize = totalSize;
    if (nowPage == 0) {
        //刷新
        self.lcx_dataArr = arr.mutableCopy;
    }else{
        //加载更多
        [self.lcx_dataArr addObjectsFromArray:arr];
    }
    //更新加载页码
    self.lcx_page = nowPage;
}

#pragma mark - setters,getters

- (NSMutableArray *)lcx_dataArr{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_dataArr:(NSMutableArray *)lcx_dataArr{
    objc_setAssociatedObject(self, @selector(lcx_dataArr),lcx_dataArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSUInteger)lcx_totalSize{
    NSNumber *value = objc_getAssociatedObject(self, _cmd);
    return value.unsignedIntegerValue;
}

- (void)setLcx_totalSize:(NSUInteger)lcx_totalSize{
    objc_setAssociatedObject(self, @selector(lcx_totalSize), [NSNumber numberWithUnsignedInteger:lcx_totalSize], OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger)lcx_page{
    NSNumber *value = objc_getAssociatedObject(self, _cmd);
    return value.unsignedIntegerValue;
}

- (void)setLcx_page:(NSUInteger)lcx_page{
    objc_setAssociatedObject(self, @selector(lcx_page), [NSNumber numberWithUnsignedInteger:lcx_page], OBJC_ASSOCIATION_ASSIGN);
}

@end
