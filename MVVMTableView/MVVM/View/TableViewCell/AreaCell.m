//
//  AreaCell.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/2.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "AreaCell.h"

@implementation AreaCell

- (void)initCell{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    CGFloat labWidth = UIScreen.mainScreen.bounds.size.width/3;
    _areaLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labWidth , 40)];
    [self.contentView addSubview:_areaLab];
    _areaLab.textColor = [UIColor blackColor];
    _areaLab.textAlignment = NSTextAlignmentCenter;

    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 39, labWidth, 1)];
    [self.contentView addSubview:lineView];
    lineView.backgroundColor = [UIColor blackColor];
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
