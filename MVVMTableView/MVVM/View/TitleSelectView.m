//
//  TitleSelectView.m
//  MVVMTableView
//
//  Created by lcx on 2019/11/6.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TitleSelectView.h"

#define kBaseTag 100

@implementation TitleSelectView
{
    NSInteger _selectIndex;
    UIView *_btnIndexView;
}
- (instancetype)initWithTitles:(NSArray *)titles
{
    self = [super init];
    if (self) {
        
        CGFloat btnH = 44;
        self.frame = CGRectMake(0, 0, kScreenWidth, btnH);
        
        CGFloat btnW = kScreenWidth/titles.count;
        for (int i = 0; i < titles.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
            btn.frame = CGRectMake(i*btnW, 0, btnW, btnH);
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
            btn.tag = kBaseTag + i;
        
            if (i==0) {
                btn.selected = YES;
                _selectIndex = 0;
            }
        }
    }
    return self;
}

- (void)btnAction:(UIButton *)sender{
    if (sender.selected) return;
    
    UIButton *oldSelectBtn = [self viewWithTag:(kBaseTag + _selectIndex)];
    oldSelectBtn.selected = NO;
    
    sender.selected = YES;
    _selectIndex = sender.tag - kBaseTag;
    
    if (self.lcx_actionBlock) {
        self.lcx_actionBlock(_selectIndex);
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
