//
//  RequestViewModel.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "RequestViewModel.h"
#import "Model.h"

@implementation RequestViewModel

+ (NSArray *)requestAndDealWithDataForPage:(NSUInteger)page{
    
    //1 获取网络数据
    NSArray *modelArr = [self requestDataWithPage:page];
    
    //2 网络数据逻辑处理
    return [self dealWithRequestData:modelArr];
}

+ (NSArray *)requestDataWithPage:(NSUInteger)page{
    NSMutableArray *modelArr = @[].mutableCopy;
    for (int i = 0; i < 20; i++) {
        Model *model = [Model new];
        model.province = [NSString stringWithFormat:@"%ld-广东省",page];
        model.city = @"深圳市";
        model.district = @"福田区";
        [modelArr addObject:model];
    }
    return modelArr.copy;
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
