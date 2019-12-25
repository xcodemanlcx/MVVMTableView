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

- (void)setLcx_model:(id)lcx_model{
    if (!lcx_model||![lcx_model isKindOfClass:ViewModel.class]) return;
    ViewModel *model = (ViewModel *)lcx_model;
    
    _addressLab.text = model.address;
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
