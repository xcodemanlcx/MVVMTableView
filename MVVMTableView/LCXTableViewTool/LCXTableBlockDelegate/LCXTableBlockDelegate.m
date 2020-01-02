//
//  LCXTableBlockDelegate.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/2.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "LCXTableBlockDelegate.h"

@implementation LCXTableBlockDelegate

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _numberOfRowsInSectionBlock?_numberOfRowsInSectionBlock(tableView,section):0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _cellForRowAtIndexPathBlock?_cellForRowAtIndexPathBlock(tableView,indexPath):nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _heightForRowAtIndexPathBlock?_heightForRowAtIndexPathBlock(tableView,indexPath):0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_didSelectRowAtIndexPathBlock) _didSelectRowAtIndexPathBlock(tableView,indexPath);
}

@end
