//
//  DoubleDelegateTableViewVC.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/6.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "DoubleDelegateTableViewVC.h"
#import "LCXTableDoubleDelegate.h"
#import "LCXInitTableView.h"

#import "SecondTableViewCell.h"
#import "RequestViewModel.h"

@interface DoubleDelegateTableViewVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LCXTableDoubleDelegate *tableDoubleDelegate;

@end

@implementation DoubleDelegateTableViewVC

#pragma mark - Life cycle

- (void)dealloc
{
    NSLog(@"dealloc ,%@",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = NSStringFromClass(self.class);
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self tableView];
    
    RequestViewModel *requestViewModel = [RequestViewModel requestAndDealWithDataForPage:0];
    _tableDoubleDelegate.dataArr = [requestViewModel.modelArr mutableCopy];
    [_tableView reloadData];
}

#pragma mark - UI

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = AddTableView(self.view,self.view.bounds, [UIColor whiteColor],self.tableDoubleDelegate);
        //2 注册cell类
        [_tableView lcx_registerCellClasses:@[SecondTableViewCell.class]];

    }
    return _tableView;
}

- (LCXTableDoubleDelegate *)tableDoubleDelegate{
    if (!_tableDoubleDelegate) {
        _tableDoubleDelegate = LCXTableDoubleDelegate.new;
        _tableDoubleDelegate.cellForRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull selectedCellIndexPath, NSInteger cellActionIndex) {
            NSLog(@"action cell IndexPath: row = %@,cellActionIndex = %ld ",selectedCellIndexPath,cellActionIndex);
        };
        _tableDoubleDelegate.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"indexPath: row = %@",indexPath);
        };
    }
    return _tableDoubleDelegate;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
