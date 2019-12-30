//
//  NSObject+LCXDataNull.m
//  LCXDataNull
//
//  Created by lcx on 2019/11/4.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXDataNull.h"
#import <objc/runtime.h>

@implementation NSObject (LCXDataNull)

- (void)lcx_customDataNullViewBlock:(LCXCustomDataNullViewBlock)customDataNullViewBlock dataArr:(NSArray *)dataArr{
    
    if (dataArr.count > 0) {
        //数据不为空
        if (self.lcx_customDataNullView) {
            [self.lcx_customDataNullView removeFromSuperview];
            self.lcx_customDataNullView = nil;
        }
    }else{
        //数据为空
        if (!self.lcx_customDataNullView) {
            //自定义UI
            if (customDataNullViewBlock) {                  self.lcx_customDataNullView = customDataNullViewBlock();
            }
        }else{
            [self.lcx_customDataNullView.superview bringSubviewToFront:self.lcx_customDataNullView];
        }
    }
}

- (UIView *)lcx_customDataNullView{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_customDataNullView:(UIView *)lcx_customDataNullView{
    objc_setAssociatedObject(self, @selector(lcx_customDataNullView), lcx_customDataNullView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
