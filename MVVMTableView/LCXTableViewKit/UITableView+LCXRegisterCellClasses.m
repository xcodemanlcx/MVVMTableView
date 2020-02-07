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

#pragma mark - property

#pragma mark property:registerCellClassNames

- (NSArray<NSString *> *)lcx_registerCellClassNames{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_registerCellClassNames:(NSArray<NSString *> *)lcx_registerCellClassNames{
    //1 注册类和复用id
    lcx_registerCellClassNames = [self _lcx_registerClassNames:lcx_registerCellClassNames registerBlock:^(__kindof __unsafe_unretained Class cls, NSString *reuseID) {
        [self registerClass:cls forCellReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerCellClassNames), lcx_registerCellClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - private

- (NSArray *)_lcx_registerClassNames:(NSArray *)classNames registerBlock:(void (^)(__kindof Class cls,NSString *reuseID))registerBlock{
    //异常处理
    if (!classNames || ![classNames isKindOfClass:NSArray.class]) return nil;
    NSMutableArray *mArr = @[].mutableCopy;
    for (NSUInteger i = 0; i < classNames.count; i++) {
        NSString *className = classNames[i];
        if (className) {
            Class cls = NSClassFromString(className);
            if (registerBlock) {
                //注册类
                registerBlock(cls,className);
                //注册类复用id
                [mArr addObject:className];
            }
        }
    }
    return mArr.copy;
}

@end
