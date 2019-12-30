//
//  NSObject+LCXNoNetworkViewHandle.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXNoNetworkViewHandle.h"
#import "LCXStatusTipView.h"
#import "NSObject+LCXNoNetWork.h"

@implementation NSObject (LCXNoNetworkViewHandle)

- (void)lcx_handleNoNetworkViewWithlistView:(UIView *)listView reloadBlock:(dispatch_block_t)reloadBlock isNoNetWork:(BOOL)isNoNetWork{
    [self lcx_customNoNetWorkViewBlock:^UIView *_Nonnull{
        //自定义UI
        LCXStatusTipView *noNetworkView = [self Lcx_noNetworkViewWithlistView:listView];
        noNetworkView.reloadBlock = reloadBlock;
    return noNetworkView;
    } isNoNetWork:isNoNetWork];
}

#pragma mark - custom tip view

- (LCXStatusTipView *)Lcx_noNetworkViewWithlistView:(UIView *)listView{
    LCXStatusTipView *noNetworkView = [[LCXStatusTipView alloc] initWithListView:listView tipType:LCXTipViewStyleWithAction];
    
    //提示图片
    noNetworkView.tipImgView.frame = CGRectMake((noNetworkView.frame.size.width -78)/2, 150, 78, 78);
    noNetworkView.tipImgView.image = [UIImage imageNamed:@"noNetWork"];
    
    //提示文字
    noNetworkView.tipLab.frame = CGRectMake(0, noNetworkView.tipImgView.frame.origin.y + noNetworkView.tipImgView.frame.size.height + 20, noNetworkView.frame.size.width , 30);
    noNetworkView.tipLab.text = @"网络异常";
    noNetworkView.tipLab.textAlignment = NSTextAlignmentCenter;
    noNetworkView.tipLab.textColor = [UIColor lightGrayColor];
    noNetworkView.tipLab.font = [UIFont systemFontOfSize:20];
    
    //按钮
    noNetworkView.reloadBtn.frame = CGRectMake((noNetworkView.frame.size.width-100)/2, noNetworkView.tipLab.frame.origin.y + noNetworkView.tipLab.frame.size.height + 20, 100, 40);
    noNetworkView.reloadBtn.backgroundColor = [UIColor lightGrayColor];
    noNetworkView.reloadBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [noNetworkView.reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
    [noNetworkView.reloadBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [noNetworkView.reloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    return noNetworkView;
}

@end
