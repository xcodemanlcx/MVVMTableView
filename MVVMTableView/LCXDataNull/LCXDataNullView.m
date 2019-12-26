//
//  LCXDataNullView.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXDataNullView.h"
#import "NSObject+LCXDataNull.h"

@implementation LCXDataNullView

- (instancetype)initWithListView:(UIView *)listView
{
    self = [super init];
    if (self) {
        
        self.backgroundColor = listView.superview.backgroundColor;
        self.frame = listView.frame;
        [listView.superview addSubview:self];
        
        _tipImgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width -78)/2, 150, 78, 78)];
        [self addSubview:_tipImgView];
        _tipImgView.image = [UIImage imageNamed:@"noData"];
        
        _tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _tipImgView.frame.origin.y + _tipImgView.frame.size.height + 20, UIScreen.mainScreen.bounds.size.width , 30)];
        [self addSubview:_tipLab];
        _tipLab.text = @"暂无数据";
        _tipLab.textAlignment = NSTextAlignmentCenter;
        _tipLab.textColor = [UIColor lightGrayColor];
        _tipLab.font = [UIFont systemFontOfSize:20];

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
