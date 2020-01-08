//
//  LCXNoNetworkView+Style.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "LCXNoNetworkView+Style.h"

@implementation LCXNoNetworkView (Style)

#pragma mark - UI style

- (void)styleDefault{
     
    //提示图
     UIImageView *tipImgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width -78)/2, 150, 78, 78)];
     [self addSubview:tipImgView];
     tipImgView.image = [UIImage imageNamed:@"noNetWork"];
     self.tipImgView = tipImgView;
    
    //提示文字
     UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, tipImgView.frame.origin.y + tipImgView.frame.size.height + 20, self.frame.size.width , 30)];
     [self addSubview:tipLab];
     tipLab.text = @"网络异常";
     tipLab.textAlignment = NSTextAlignmentCenter;
     tipLab.textColor = [UIColor lightGrayColor];
     tipLab.font = [UIFont systemFontOfSize:20];
     self.tipLab = tipLab;
     
    //重新加载
     UIButton *reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [self addSubview:reloadBtn];
     [reloadBtn addTarget:self action:LCXNoNetworkView_SEL_reloadBtnAction forControlEvents:UIControlEventTouchUpInside];
     reloadBtn.frame = CGRectMake((self.frame.size.width-100)/2, tipLab.frame.origin.y + self.tipLab.frame.size.height + 20, 100, 40);
     reloadBtn.backgroundColor = [UIColor lightGrayColor];
     reloadBtn.titleLabel.font = [UIFont systemFontOfSize:20];
     [reloadBtn setTitle:@"重新加载" forState:UIControlStateNormal];
     [reloadBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [reloadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    self.reloadBtn = reloadBtn;
}


@end
