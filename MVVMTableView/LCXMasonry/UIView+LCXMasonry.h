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
 1 相对父视图，适配安全区域底部:
 2 可调整底部、顶部偏移；
 */
- (void)lcx_safeBottomWithBottom:(CGFloat)bottom top:(CGFloat)top;

@end

NS_ASSUME_NONNULL_END
