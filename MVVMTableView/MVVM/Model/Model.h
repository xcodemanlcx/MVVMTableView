//
//  Model.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Model : NSObject

@property (nonatomic ,copy) NSString *province;
@property (nonatomic ,copy) NSString *city;
@property (nonatomic ,copy) NSString *district;

@end

NS_ASSUME_NONNULL_END
