//
//  UICollectionView+LCXReuseViewID.h
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionView (LCXReuseViewID)

//注册cell类名
@property (nullable ,nonatomic, copy) NSArray <NSString *> *lcx_registerCellClassNames;

//注册分区头部类名
@property (nullable ,nonatomic, copy) NSArray <NSString *> *lcx_registerHeaderClassNames;

//注册分区尾部类名
@property (nullable ,nonatomic, copy) NSArray <NSString *> *lcx_registerFooterClassNames;

@end

NS_ASSUME_NONNULL_END
