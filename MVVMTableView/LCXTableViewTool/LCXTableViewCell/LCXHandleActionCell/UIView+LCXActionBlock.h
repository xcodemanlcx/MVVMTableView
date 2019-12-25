//
//  UIView+LCXActionBlock.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/23.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^LCXActionBlock)(NSInteger actionIndex);

@interface UIView (LCXActionBlock)

@property (nonatomic ,copy) LCXActionBlock lcx_actionBlock;

@end

NS_ASSUME_NONNULL_END
