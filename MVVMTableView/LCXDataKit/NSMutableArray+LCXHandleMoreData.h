//
//  NSMutableArray+LCXHandleMoreData.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/26.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (LCXHandleMoreData)

- (void)lcx_handleMoreData:(NSArray *)arr nowPage:(NSInteger)nowPage;

@end

NS_ASSUME_NONNULL_END
