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

#pragma mark property:registerCellClassNames

- (NSArray<NSString *> *)lcx_registerCellClassNames{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_registerCellClassNames:(NSArray<NSString *> *)lcx_registerCellClassNames{
    //1 注册类和复用id
    lcx_registerCellClassNames = [self _lcx_registerClassNames:lcx_registerCellClassNames registerClass:UITableViewCell.class registerBlock:^(__kindof __unsafe_unretained Class cls, NSString *reuseID) {
        [self registerClass:cls forCellReuseIdentifier:reuseID];
    }];
    
    //2 关联
    objc_setAssociatedObject(self, @selector(lcx_registerCellClassNames), lcx_registerCellClassNames, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

#pragma mark - private

- (NSArray *)_lcx_registerClassNames:(NSArray *)classNames registerClass:(Class)registerClass registerBlock:(void (^)(__kindof Class cls,NSString *reuseID))registerBlock{
    //异常处理
    if (!classNames || ![classNames isKindOfClass:NSArray.class]) return nil;
    NSMutableArray *mArr = @[].mutableCopy;
    for (NSUInteger i = 0; i < classNames.count; i++) {
        NSString *className = classNames[i];
        if (className) {
            Class cls = NSClassFromString(className);
            //类的类型
            if([cls isSubclassOfClass:registerClass]){
                if (registerBlock) {
                    //注册类
                    registerBlock(cls,className);
                }
                //注册类复用id
                [mArr addObject:className];
            }else{
                //注册失败提示：非UITableViewCell子类
                [mArr addObject:[@"error_" stringByAppendingString: className]];
            }
        }
    }
    return mArr.copy;
}

@end
