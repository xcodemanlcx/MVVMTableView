//
//  UIView+LCXActionBlock.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/23.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIView+LCXActionBlock.h"
#import <objc/runtime.h>

@implementation UIView (LCXActionBlock)

- (LCXActionBlock)lcx_actionBlock{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_actionBlock:(LCXActionBlock)lcx_actionBlock{
    objc_setAssociatedObject(self, @selector(lcx_actionBlock), lcx_actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
