//
//  UITableView+LCXRegisterCellClasses.m
//  LCXTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+LCXRegisterCellClasses.h"
#import "UIView+LCXRegisterClasses.h"
#import <objc/runtime.h>

@implementation UITableView (LCXRegisterCellClasses)

@dynamic reuseCellIDs;

- (NSMutableArray<__kindof NSString *> *)reuseCellIDs{
    id mArr = objc_getAssociatedObject(self, _cmd);
    if (!mArr) {
        mArr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, mArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return mArr;
}

- (void)registerCellClasses:(NSArray <Class> *)classes{
    __weak typeof(self) weakSelf = self;
    [self registerClasses:classes registerBlock:^(Class  _Nonnull __unsafe_unretained cls, NSString * _Nonnull reuseCellID) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.reuseCellIDs addObject:reuseCellID];
        [strongSelf registerClass:cls forCellReuseIdentifier:reuseCellID];
    }];
}

@end
