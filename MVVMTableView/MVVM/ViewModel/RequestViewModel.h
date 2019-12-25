//
//  RequestViewModel.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface RequestViewModel : NSObject

/**
  请求网路数据model，把并model处理成viewModel
*/
+ (NSArray *)requestAndDealWithDataForPage:(NSUInteger)page;

@end

NS_ASSUME_NONNULL_END
