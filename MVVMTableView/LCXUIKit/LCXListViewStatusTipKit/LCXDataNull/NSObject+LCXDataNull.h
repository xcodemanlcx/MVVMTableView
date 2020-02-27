//
//  NSObject+LCXDataNull.h
//  LCXDataNull
//
//  Created by lcx on 2019/11/4.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIView *_Nonnull(^LCXCustomDataNullViewBlock)(void);

@interface NSObject (LCXDataNull)

@property (nonatomic ,strong) UIView *_Nullable lcx_customDataNullView;

/**
 数据为空逻辑处理
 */
- (void)lcx_customDataNullViewBlock:(LCXCustomDataNullViewBlock)customDataNullViewBlock dataArr:(NSArray *)dataArr;
@end

NS_ASSUME_NONNULL_END
