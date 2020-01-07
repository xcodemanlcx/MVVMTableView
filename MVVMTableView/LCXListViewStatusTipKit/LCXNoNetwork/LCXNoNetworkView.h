//
//  LCXNoNetworkView.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/24.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+LCXNoNetworkViewHandle.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXNoNetworkView : UIView

@property (nonatomic ,strong) UIImageView *tipImgView;
@property (nonatomic, strong) UILabel *tipLab;
@property (nonatomic, strong) UIButton *reloadBtn;
@property (nonatomic ,copy) dispatch_block_t reloadBlock;

- (instancetype)initWithListView:(UIView *)listView;

@end

NS_ASSUME_NONNULL_END
