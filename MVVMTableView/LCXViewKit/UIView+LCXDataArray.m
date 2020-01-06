//
//  UIView+LCXDataArray.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/2.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "UIView+LCXDataArray.h"
#import <objc/runtime.h>

@implementation UIView (LCXDataArray)

- (NSArray *)lcx_dataArr{
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLcx_dataArr:(NSArray *)lcx_dataArr{
   objc_setAssociatedObject(self, @selector(lcx_dataArr), lcx_dataArr, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
