//
//  ViewModel.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewModel.h"
#import "Model.h"

@implementation ViewModel

- (instancetype)initWithModel:(Model *)model
{
    self = [super init];
    if (self) {
        _address = [[model.province stringByAppendingString:model.city] stringByAppendingString:model.district];
    }
    return self;
}

@end
