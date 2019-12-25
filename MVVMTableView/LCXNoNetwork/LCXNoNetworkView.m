//
//  LCXNoNetworkView.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXNoNetworkView.h"

#define kScreenWidth UIScreen.mainScreen.bounds.size.width

@implementation LCXNoNetworkView

- (instancetype)initWithSuperView:(UIView *)superView top:(CGFloat)top
{
    self = [super init];
    if (self) {
 
        CGFloat superViewW = superView.frame.size.width;
        self.backgroundColor = superView.backgroundColor;
        self.frame = (CGRect){{0, top}, superView.frame.size};
        [superView addSubview:self];
        
        _tipImgView = [[UIImageView alloc] initWithFrame:CGRectMake((superViewW -78)/2, 150, 78, 78)];
        [self addSubview:_tipImgView];
        _tipImgView.image = [UIImage imageNamed:@"noNetWork"];
        
        _tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, _tipImgView.frame.origin.y + _tipImgView.frame.size.height + 20, kScreenWidth , 30)];
        [self addSubview:_tipLab];
        _tipLab.text = @"网络异常";
        _tipLab.textAlignment = NSTextAlignmentCenter;
        _tipLab.textColor = [UIColor lightGrayColor];
        _tipLab.font = [UIFont systemFontOfSize:20];
        
        _reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_reloadBtn];
        [_reloadBtn addTarget:self action:@selector(reloadBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        _reloadBtn.frame = CGRectMake((superViewW-100)/2, _tipLab.frame.origin.y + _tipLab.frame.size.height + 20, 100, 40);
        _reloadBtn.backgroundColor = [UIColor lightGrayColor];
        _reloadBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
        [_reloadBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (void)reloadBtnAction:(UIButton *)sender{
    if (_reloadBlock) {
        _reloadBlock();
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
