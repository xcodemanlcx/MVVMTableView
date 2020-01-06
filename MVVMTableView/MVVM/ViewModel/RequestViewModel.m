//
//  RequestViewModel.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RequestViewModel.h"
#import "Model.h"

#define kTotalSize 8
@implementation RequestViewModel

+ (RequestViewModel *)requestAndDealWithDataForPage:(NSUInteger)page{
    //1 获取网络数据
    NSArray *modelArr = [self requestDataWithPage:page];
    //2 网络数据逻辑处理
    modelArr = [self dealWithRequestData:modelArr];
    
    //viewmodel数据
    RequestViewModel *requestViewModel = [RequestViewModel new];
    requestViewModel.modelArr = modelArr;
    requestViewModel.totalSize = kTotalSize;
    return requestViewModel;
}

+ (NSArray *)requestDataWithPage:(NSUInteger)page{
    NSMutableArray *modelArr = @[].mutableCopy;
    
    //服务端剩余数据量
    NSUInteger leftDataSize = kTotalSize-kPageSize*page;
    NSUInteger count = leftDataSize<kPageSize?leftDataSize:kPageSize;
    for (int i = 0; i < count; i++) {
        Model *model = [Model new];
        model.province = [NSString stringWithFormat:@"%ld-广东省",page];
        model.city = @"深圳市";
        model.district = @"福田区";
        [modelArr addObject:model];
    }
    return modelArr;
}

+ (NSArray *)dealWithRequestData:(NSArray *)modelArr{
    if (!modelArr || ![modelArr isKindOfClass:NSArray .class]) return nil;
    NSMutableArray *viewModelArr = @[].mutableCopy;
        for (int i = 0; i < modelArr.count; i++) {
            if([modelArr[i] isKindOfClass:Model.class]){
                
                //数据处理逻辑
                ViewModel *viewModel = [[ViewModel alloc] initWithModel:modelArr[i]];
                [viewModelArr addObject:viewModel];
            }
    }
    return viewModelArr.copy;
}

@end
