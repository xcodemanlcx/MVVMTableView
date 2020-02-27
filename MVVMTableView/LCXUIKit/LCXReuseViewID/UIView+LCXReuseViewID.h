//
//  UIView+LCXReuseViewID.h
//  LCXReuseViewID
//
//  Created by lcx on 2020/2/25.
//  Copyright © 2020 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LCXReuseViewID)

- (NSArray *)lcx_registerClassNames:(NSArray *)classNames registerSuperClass:(Class)registerSuperClass registerBlock:(void (^)(Class cls,NSString *reuseID))registerBlock;

@end

NS_ASSUME_NONNULL_END
