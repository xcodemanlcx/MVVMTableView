//
//  UIView+LCXMasonry.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCXMasonry)

/**
 masonry：
 1 布局相对父视图；
 2 适配安全区域底部:
 2 可调整顶部；
 */
- (void)lcx_safeBottomWithTop:(CGFloat)top;

@end

NS_ASSUME_NONNULL_END
