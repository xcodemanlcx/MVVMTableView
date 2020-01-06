//
//  LCXNoNetworkView.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXNoNetworkView.h"

@implementation LCXNoNetworkView

- (instancetype)initWithListView:(UIView *)listView
{
    self = [super init];
    if (self) {
        self.backgroundColor = listView.superview.backgroundColor;
        self.frame = listView.frame;
        [listView.superview addSubview:self];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
