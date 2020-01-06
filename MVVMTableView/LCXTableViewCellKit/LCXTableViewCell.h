//
//  LCXTableViewCell.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LCXActionBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXTableViewCell : UITableViewCell

@property (nonatomic ,strong) id cellModel;

- (void)initCell;

@end

NS_ASSUME_NONNULL_END
