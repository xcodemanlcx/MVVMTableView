//
//  NSObject+LCXNoNetWork.m
//  MVVMTableView
//
//  Created by lcx on 2019/11/4.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXNoNetWork.h"
#import <objc/runtime.h>

@implementation NSObject (LCXNoNetWork)

- (void)lcx_customNoNetWorkViewBlock:(LCXCustomNoNetworkViewBlock)customNoNetWorkViewBlock  isNoNetWork:(BOOL)isNoNetWork{
    if (isNoNetWork) {
        //网络异常
        if (!self.lcx_noNetworkView) {
            //自定义网络异常UI
            if (customNoNetWorkViewBlock) {
               self.lcx_noNetworkView = customNoNetWorkViewBlock();
            }

        }else{
            [self.lcx_noNetworkView.superview bringSubviewToFront:self.lcx_noNetworkView];
        }
    }else{
        // 网络正常
        if (self.lcx_noNetworkView) {
            [self.lcx_noNetworkView removeFromSuperview];
            self.lcx_noNetworkView = nil;
        }
    }
}
#pragma mark - setter、getter

- (UIView *)lcx_noNetworkView{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_noNetworkView:(UIView *)lcx_noNetworkView{
    objc_setAssociatedObject(self, @selector(lcx_noNetworkView), lcx_noNetworkView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
