//
//  UIView+LCXRegisterClasses.h
//  LCXTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCXRegisterClasses)

/**
 注册复用的view类
*/
- (void)registerClasses:(NSArray <__kindof Class> *)classes registerBlock:(void(^)(Class cls,NSString *reuseCellID))registerBlock;

@end

NS_ASSUME_NONNULL_END
