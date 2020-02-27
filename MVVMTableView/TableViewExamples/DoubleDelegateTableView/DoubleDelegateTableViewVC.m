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
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "Model.h"
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
    
    _tableDoubleDelegate.dataArr = @[].mutableCopy;
    for (int i = 0; i < 10; i++) {
        Model *model = Model.new;
        model.province = @"广东省";
        model.city = @"深圳市";
        model.district = @"福田区";
        
        //数据逻辑处理
        ViewModel *viewModel = [[ViewModel alloc] initWithModel:model];
        viewModel.lcx_cellHeight = 80;
        viewModel.lcx_cellReuseIdIndex = i%2;
        [_tableDoubleDelegate.dataArr addObject:viewModel];
    }
    
    [_tableView reloadData];
}

#pragma mark - UI

- (UITableView *)tableView{
    if (!_tableView) {
        //1 初始化
        _tableView = AddTableView(self.view,self.view.bounds, [UIColor whiteColor],self.tableDoubleDelegate);
        //2 注册cell类
        _tableView.lcx_registerCellClassNames = @[@"FirstTableViewCell",@"SecondTableViewCell"];
    }
    return _tableView;
}

- (LCXTableDoubleDelegate *)tableDoubleDelegate{
    if (!_tableDoubleDelegate) {
        _tableDoubleDelegate = LCXTableDoubleDelegate.new;
        __weak typeof (self) weakSelf = self;
        _tableDoubleDelegate.cellForRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull selectedCellIndexPath, NSInteger cellActionIndex) {
            NSLog(@"selectedCellIndexPath:%@,cellActionIndex = %ld ",selectedCellIndexPath,cellActionIndex);
            if (cellActionIndex == 2) {
                [weakSelf dismissViewControllerAnimated:YES completion:nil];
            }
        };
        _tableDoubleDelegate.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
            NSLog(@"didSelectRowAtIndexPath: %@",indexPath);
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
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
