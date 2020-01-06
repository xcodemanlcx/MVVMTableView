//
//  NSObject+LCXDataNullViewHandle.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (LCXDataNullViewHandle)

- (void)lcx_handleDataNullViewWithStyleSel:(SEL)styleSel listView:(UIView *)listView dataArr:(NSArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
