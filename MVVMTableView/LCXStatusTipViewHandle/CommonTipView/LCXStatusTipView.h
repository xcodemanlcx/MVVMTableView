//
//  LCXStatusTipView.h
//  MVVMTableView
//
//  Created by lcx on 2019/12/30.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LCXTipView) {
    LCXTipViewStyleDefault,//无数据、定位失败时，默认带文本和图片提示；
    LCXTipViewStyleWithAction,//网络异常时，带按钮的的提示（且默认带文本和图片提示）；
};

NS_ASSUME_NONNULL_BEGIN

@interface LCXStatusTipView : UIView

@property (nonatomic ,strong) UIImageView *tipImgView;
@property (nonatomic, strong) UILabel *tipLab;
@property (nonatomic, strong) UIButton *reloadBtn;
@property (nonatomic ,copy) dispatch_block_t reloadBlock;

- (instancetype)initWithListView:(UIView *)listView tipType:(LCXTipView)tipType;

@end

NS_ASSUME_NONNULL_END
