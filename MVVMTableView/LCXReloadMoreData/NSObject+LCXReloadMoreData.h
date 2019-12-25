//
//  NSObject+LCXReloadMoreData.h
//  MVVMTableView
//
//  Created by lcx on 2019/10/28.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCXReloadMoreData)

// 列表数据
@property(nonatomic, strong) NSMutableArray * _Nullable lcx_dataArr;
// 数据总量
@property(nonatomic, assign) NSUInteger lcx_totalSize;
// 数据请求成功后，最新页码
@property(nonatomic, assign) NSUInteger lcx_page;

/**
 列表加载更多：最新加载得到的列表数据处理
 */
- (void)lcx_handleMoreData:(NSArray *)arr totalSize:(NSUInteger)totalSize nowPage:(NSUInteger)nowPage;

@end

NS_ASSUME_NONNULL_END
