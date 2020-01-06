//
//  NSObject+LCXListModel.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "NSObject+LCXListModel.h"
#import <objc/runtime.h>

@implementation NSObject (LCXListModel)

- (float)lcx_cellHeight{
    id value = objc_getAssociatedObject(self, @selector(lcx_cellHeight));
    return ((NSNumber *)value).floatValue;
}

- (void)setLcx_cellHeight:(float)lcx_cellHeight{
    objc_setAssociatedObject(self, @selector(lcx_cellHeight), @(lcx_cellHeight), OBJC_ASSOCIATION_ASSIGN);
}

- (NSUInteger )lcx_cellReuseIdIndex{
    id value = objc_getAssociatedObject(self, @selector(lcx_cellReuseIdIndex));
    return ((NSNumber *)value).unsignedIntegerValue;
}

- (void)setLcx_cellReuseIdIndex:(NSUInteger)lcx_cellReuseIdIndex{
    objc_setAssociatedObject(self, @selector(lcx_cellReuseIdIndex), @(lcx_cellReuseIdIndex), OBJC_ASSOCIATION_ASSIGN);
}

@end
