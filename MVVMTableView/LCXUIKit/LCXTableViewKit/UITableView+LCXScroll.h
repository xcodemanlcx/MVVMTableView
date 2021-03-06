//
//  UITableView+LCXScroll.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (LCXScroll)

/**滚动到顶部:在reloadData之后使用有效*/
- (void)lcx_scrollToTopWithPage:(NSUInteger)page;

@end

NS_ASSUME_NONNULL_END
