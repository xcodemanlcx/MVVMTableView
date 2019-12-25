//
//  ViewModel.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Model;

@interface ViewModel : NSObject

@property (nonatomic ,copy ,readonly) NSString *address;

/**
   把网络数据model对象,转化为经过数据逻辑处理后、直接可用的ViewModel对象
*/
- (instancetype)initWithModel:(Model *)model;

@end

NS_ASSUME_NONNULL_END
