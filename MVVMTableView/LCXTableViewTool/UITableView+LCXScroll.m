//
//  UITableView+LCXScroll.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+LCXScroll.h"

@implementation UITableView (LCXScroll)

/**滚动到顶部：在reloadData之后使用有效*/
- (void)lcx_scrollToTopWithPage:(NSUInteger)page{
    if (page == 0) {
        if (self.contentOffset.y != 0) {
            [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
        }
    }
}

@end
