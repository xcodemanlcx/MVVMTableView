//
//  LCXDataNullView+Style.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "LCXDataNullView+Style.h"

@implementation LCXDataNullView (Style)

#pragma mark - UI style

- (void)styleDefault{
    UIImageView *tipImgView = [[UIImageView alloc] initWithFrame:CGRectMake((self.frame.size.width -78)/2, 150, 78, 78)];
    [self addSubview:tipImgView];
    tipImgView.image = [UIImage imageNamed:@"noData"];
    self.tipImgView = tipImgView;
    
    UILabel *tipLab = [[UILabel alloc] initWithFrame:CGRectMake(0, self.tipImgView.frame.origin.y + self.tipImgView.frame.size.height + 20, UIScreen.mainScreen.bounds.size.width , 30)];
    [self addSubview:tipLab];
    tipLab.text = @"暂无数据";
    tipLab.textAlignment = NSTextAlignmentCenter;
    tipLab.textColor = [UIColor lightGrayColor];
    tipLab.font = [UIFont systemFontOfSize:20];
    self.tipLab = tipLab;
}
@end
