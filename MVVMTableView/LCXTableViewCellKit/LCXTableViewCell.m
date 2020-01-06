//
//  LCXTableViewCell.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXTableViewCell.h"

@implementation LCXTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCell];
    }
    return self;
}

- (void)initCell{
    
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
