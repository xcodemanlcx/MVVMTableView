//
//  LCXStatusTipView.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/30.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXStatusTipView.h"

@implementation LCXStatusTipView

- (instancetype)initWithListView:(UIView *)listView tipType:(LCXTipView)tipType{
    self = [super init];
    if (self) {
        
        self.backgroundColor = listView.superview.backgroundColor;
        self.frame = listView.frame;
        [listView.superview addSubview:self];
        
        //UI item
        [self tipImgView];
        [self tipLab];
        if (tipType == LCXTipViewStyleWithAction) {
            [self reloadBtn];
        }

    }
    return self;
}

#pragma mark - UI item init

- (UIImageView *)tipImgView{
    if (!_tipImgView) {
        _tipImgView = UIImageView.new;
        [self addSubview:_tipImgView];
    }
    return _tipImgView;
}

- (UILabel *)tipLab{
    if (!_tipLab) {
        _tipLab = UILabel.new;
        [self addSubview:_tipLab];
    }
    return _tipLab;
}

- (UIButton *)reloadBtn{
    if (!_reloadBtn) {
        _reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_reloadBtn];
        [_reloadBtn addTarget:self action:@selector(reloadBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reloadBtn;
}

#pragma mark - Action

- (void)reloadBtnAction:(UIButton *)sender{
    if (_reloadBlock) {
        _reloadBlock();
    }
}
    
@end
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
