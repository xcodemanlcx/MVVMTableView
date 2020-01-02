//
//  SecondTableViewCell.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "SecondTableViewCell.h"
#import "ViewModel.h"

@implementation SecondTableViewCell
{
    UILabel *_addressLab;
}

- (void)initCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    _addressLab = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, UIScreen.mainScreen.bounds.size.width-50 , 80)];
    [self.contentView addSubview:_addressLab];
    _addressLab.textColor = [UIColor blackColor];
}

- (void)setModel:(id)model{
    if (!model||![model isKindOfClass:ViewModel.class]) return;
    ViewModel *viewModel = (ViewModel *)model;
    
    _addressLab.text = viewModel.address;
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
