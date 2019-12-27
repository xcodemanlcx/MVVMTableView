//
//  FirstTableViewCell.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "FirstTableViewCell.h"
#import "ViewModel.h"

#define kBaseTag 100
#define kScreenWidth UIScreen.mainScreen.bounds.size.width

@implementation FirstTableViewCell

- (void)initCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *titles = @[@"button1",@"button2",@"dissmisVC"];
    for (int i = 0; i < titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:btn];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.frame = CGRectMake(i*kScreenWidth/titles.count, 0, kScreenWidth/titles.count, 80);
        btn.backgroundColor = [UIColor lightGrayColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.tag = kBaseTag + i;
    }
}

- (void)btnAction:(UIButton *)sender{
    if (self.lcx_actionBlock) {
        self.lcx_actionBlock(sender.tag - kBaseTag);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
