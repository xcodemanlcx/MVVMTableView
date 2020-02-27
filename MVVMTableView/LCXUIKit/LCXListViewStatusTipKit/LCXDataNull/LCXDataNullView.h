//
//  LCXDataNullView.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+LCXDataNullViewHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXDataNullView : UIView

@property (nonatomic ,strong) UIImageView *tipImgView;
@property (nonatomic, strong) UILabel *tipLab;

- (instancetype)initWithListView:(UIView *)listView;

@end

NS_ASSUME_NONNULL_END
