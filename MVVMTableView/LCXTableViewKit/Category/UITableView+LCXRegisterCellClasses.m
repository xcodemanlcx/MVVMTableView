//
//  UITableView+LCXRegisterCellClasses.m
//  LCXTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+LCXRegisterCellClasses.h"
#import <objc/runtime.h>

@implementation UITableView (LCXRegisterCellClasses)

@dynamic lcx_reuseCellIDs;

- (NSMutableArray<__kindof NSString *> *)lcx_reuseCellIDs{
    id mArr = objc_getAssociatedObject(self, _cmd);
    if (!mArr) {
        mArr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, mArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return mArr;
}

- (void)lcx_registerCellClasses:(NSArray <__kindof Class> *)classes{
    if (!classes || ![classes isKindOfClass:NSArray.class]) return;
    for (NSUInteger i = 0; i<classes.count ; i++) {
        //注册类复用id
        NSString *reuseCellID = NSStringFromClass(classes[i]);
        [self.lcx_reuseCellIDs addObject:reuseCellID];
        //注册类
        [self registerClass:classes[i] forCellReuseIdentifier:reuseCellID];
    }
}

@end
