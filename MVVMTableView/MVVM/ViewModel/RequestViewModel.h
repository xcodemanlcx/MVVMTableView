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

//列表数据分页大小
#define kPageSize 10

@interface RequestViewModel : NSObject

@property (nonatomic ) NSUInteger totalSize;
@property (nonatomic ,copy) NSArray <__kindof ViewModel *>*modelArr;

/**
  请求网路数据model，把并model处理成viewModel
*/
+ (RequestViewModel *)requestAndDealWithDataForPage:(NSUInteger)page;

@end

NS_ASSUME_NONNULL_END
