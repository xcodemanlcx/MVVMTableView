//
//  NSObject+LCXHandleDataNullView.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+LCXDataNull.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCXHandleDataNullView)

- (void)lcx_handleDataNullViewWithlistView:(UIView *)listView dataArr:(NSArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
