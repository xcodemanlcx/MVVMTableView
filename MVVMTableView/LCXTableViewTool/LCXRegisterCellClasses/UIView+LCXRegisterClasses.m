//
//  UIView+LCXRegisterClasses.m
//  LCXTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIView+LCXRegisterClasses.h"

@implementation UIView (LCXRegisterClasses)

- (void)registerClasses:(NSArray <__kindof Class> *)classes registerBlock:(void(^)(Class cls,NSString *reuseCellID))registerBlock{
    if (classes && [classes isKindOfClass:NSArray.class] && registerBlock){
        for (NSUInteger i = 0; i<classes.count ; i++) {
            //注册类
            registerBlock(classes[i],NSStringFromClass(classes[i]));
        }
    }
}
@end
