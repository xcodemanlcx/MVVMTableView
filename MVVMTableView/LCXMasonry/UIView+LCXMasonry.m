//
//  UIView+LCXMasonry.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIView+LCXMasonry.h"

// Masonry
#define MAS_SHORTHAND
#import "Masonry.h"

@implementation UIView (LCXMasonry)

- (void)lcx_safeBottomWithBottom:(CGFloat)bottom top:(CGFloat)top{
    if (self.superview) {
        [self makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.superview);
            make.top.equalTo(self.superview).offset(top);
            [self lcx_mas_setSafeBottomWithOffset:bottom make:make];
        }];
    }
}

- (void)lcx_mas_setSafeBottomWithOffset:(CGFloat)bottomOffset make:(MASConstraintMaker *)make{
    if (@available(iOS 11.0, *)) {
        make.bottom.equalTo(self.superview.safeAreaLayoutGuideBottom).offset(-bottomOffset);
    } else {
        // Fallback on earlier versions
        make.bottom.equalTo(self.superview).offset(-bottomOffset);
    }
}
@end
