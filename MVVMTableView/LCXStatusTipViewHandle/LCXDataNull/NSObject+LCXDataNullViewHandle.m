//
//  NSObject+LCXDataNullViewHandle.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "NSObject+LCXDataNullViewHandle.h"
#import "NSObject+LCXDataNull.h"
#import "LCXStatusTipView.h"

@implementation NSObject (LCXDataNullViewHandle)

- (void)lcx_handleDataNullViewWithlistView:(UIView *)listView dataArr:(NSArray *)dataArr{
    [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
        //自定义UI
        return [self lcx_dataNullViewWithListView:listView];
    } dataArr:dataArr];
}

#pragma mark - custom tip view

- (UIView *)lcx_dataNullViewWithListView:(UIView *)listView{
    LCXStatusTipView *dataNullView = [[LCXStatusTipView alloc] initWithListView:listView tipType:LCXTipViewStyleDefault];
    
    //提示图片
    dataNullView.tipImgView.frame = CGRectMake((dataNullView.frame.size.width -78)/2, 150, 78, 78);
    dataNullView.tipImgView.image = [UIImage imageNamed:@"noData"];
     
    //提示文字
     dataNullView.tipLab.frame = CGRectMake(0, dataNullView.tipImgView.frame.origin.y + dataNullView.tipImgView.frame.size.height + 20, dataNullView.bounds.size.width , 30);
     dataNullView.tipLab.text = @"暂无数据";
     dataNullView.tipLab.textAlignment = NSTextAlignmentCenter;
     dataNullView.tipLab.textColor = [UIColor lightGrayColor];
     dataNullView.tipLab.font = [UIFont systemFontOfSize:20];
    return dataNullView;
}

@end
