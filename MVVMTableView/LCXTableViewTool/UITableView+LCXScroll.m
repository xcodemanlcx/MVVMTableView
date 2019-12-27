//
//  UITableView+LCXScroll.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+LCXScroll.h"

@implementation UITableView (LCXScroll)

- (void)lcx_scrollToTop{
    [self scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

@end
