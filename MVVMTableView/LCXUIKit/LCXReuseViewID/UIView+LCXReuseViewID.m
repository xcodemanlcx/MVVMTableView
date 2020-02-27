//
//  UIView+LCXReuseViewID.m
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UIView+LCXReuseViewID.h"

@implementation UIView (LCXReuseViewID)

#pragma mark - private

- (NSArray *)lcx_registerClassNames:(NSArray *)classNames registerSuperClass:(Class)registerSuperClass registerBlock:(void (^)(Class cls,NSString *reuseID))registerBlock{
    //异常处理
    if (!classNames || ![classNames isKindOfClass:NSArray.class]) return nil;
    NSMutableArray *mArr = @[].mutableCopy;
    for (NSUInteger i = 0; i < classNames.count; i++) {
        NSString *className = classNames[i];
        if (className) {
            Class cls = NSClassFromString(className);
            //类的类型
            if([cls isSubclassOfClass:registerSuperClass]){
                if (registerBlock) {
                    //注册类:以类名为key
                    registerBlock(cls,className);
                }
                //注册类复用id
                [mArr addObject:className];
            }else{
                //注册失败
                NSLog(@"error: registerClass index %@,  %lu",className,(unsigned long)i);
            }
        }
    }
    return mArr.copy;
}

@end
