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

- (void)lcx_safeBottomWithTop:(CGFloat)top{
    if (self.superview) {
        [self makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.superview);
            make.top.equalTo(self.superview).offset(top);
            [self lcx_make:make safeBottomWithOffset:0 ];
        }];
    }
}

- (void)lcx_make:(MASConstraintMaker *)make safeBottomWithOffset:(CGFloat)bottomOffset{
    if (@available(iOS 11.0, *)) {
        make.bottom.equalTo(self.superview.safeAreaLayoutGuideBottom).offset(-bottomOffset);
    } else {
        // Fallback on earlier versions
        make.bottom.equalTo(self.superview).offset(-bottomOffset);
    }
}
@end
