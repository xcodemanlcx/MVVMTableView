//
//  UITableView+LCXReuseViewID.m
//  MVVMTableView
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UITableView+LCXReuseViewID.h"
#import "UIView+LCXReuseViewID.h"
#import <objc/runtime.h>

@implementation UITableView (LCXReuseViewID)

#pragma mark property:lcx_registerCellClassNames

- (NSArray<NSString *> *)lcx_registerCellClassNames{
    return objc_getAssociatedObject(self,_cmd);
}

- (void)setLcx_registerCellClassNames:(NSArray<NSString *> *)lcx_registerCellClassNames{
    //1 注册类和复用id
    lcx_registerCellClassNames = [self lcx_registerClassNames:lcx_registerCellClassNames registerSuperClass:UITableViewCell.class registerBlock:^(__kindof __unsafe_unretained Class cls, NSString *reuseID) {
        [self registerClass:cls forCellReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerCellClassNames), lcx_registerCellClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark property:lcx_registerHeaderFooterClassNames

- (NSArray<NSString *> *)lcx_registerHeaderFooterClassNames{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_registerHeaderFooterClassNames:(NSArray<NSString *> *)lcx_registerHeaderFooterClassNames{
    //1 注册类和复用id
    lcx_registerHeaderFooterClassNames = [self lcx_registerClassNames:lcx_registerHeaderFooterClassNames registerSuperClass:UITableViewHeaderFooterView.class registerBlock:^(__kindof __unsafe_unretained Class cls, NSString *reuseID) {
        [self registerClass:cls forHeaderFooterViewReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerHeaderFooterClassNames), lcx_registerHeaderFooterClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
