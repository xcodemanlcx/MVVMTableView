//
//  LCXInitTableView.m
//  LCXUIInit
//
//  Created by leichunxiang on 2019/11/13.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXInitTableView.h"

@implementation LCXInitTableView

UITableView *AddTableView(UIView *superView, CGRect frame, UIColor *backgroundColor,id doubleDelegate){
    UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [superView addSubview:tableView];
    tableView.backgroundColor = backgroundColor;
    tableView.dataSource = doubleDelegate;
    tableView.delegate = doubleDelegate;
    
    //app base settting
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundView = nil;

    return tableView;
}

@end
