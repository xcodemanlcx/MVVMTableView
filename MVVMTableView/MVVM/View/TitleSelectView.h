//
//  TitleSelectView.h
//  MVVMTableView
//
//  Created by lcx on 2019/11/6.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+LCXActionBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface TitleSelectView : UIView

@property (nonatomic ,assign,readonly) NSInteger selectIndex;

- (instancetype)initWithTitles:(NSArray *)titles;

@end

NS_ASSUME_NONNULL_END
