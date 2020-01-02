//
//  DelegateTableViewVC.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/31.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "DelegateTableViewVC.h"

//LCXTableViewTool
#import "LCXInitTableView.h"
#import "UITableView+LCXRegisterCellClasses.h"
#import "LCXTableViewCell.h"
#import "LCXTableDoubleDelegate.h"
#import "UIView+LCXDataArray.h"

//cell、model
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "RequestViewModel.h"

#define kWeakSelf __weak typeof (self) weakSelf = self

@interface DelegateTableViewVC ()

@property (nonatomic, strong) UITableView *provinceTableView;
@property (nonatomic, strong) UITableView *cityTableView;
@property (nonatomic, strong) UITableView *districtTableView;

@property (nonatomic, strong) LCXTableDoubleDelegate *tableDoubleDelegate;

@end

@implementation DelegateTableViewVC

#pragma mark - Life cycle

- (void)dealloc
{
    NSLog(@"dealloc ,%@",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVMTableView";
    self.view.backgroundColor = [UIColor yellowColor];
    
    //UI
    _provinceTableView = [self addTableViewWithIndex:0];
    _cityTableView = [self addTableViewWithIndex:1];
    _districtTableView = [self addTableViewWithIndex:2];
;
    
    //Data
//    RequestViewModel *requestViewModel = [RequestViewModel requestAndDealWithDataForPage:0];
//    self.dataArr = requestViewModel.modelArr.mutableCopy;
    //刷新
//    [_tableView reloadData];
}

#pragma mark - UI

- (UITableView *)addTableViewWithIndex:(NSUInteger )index{
    //1 初始化
    UITableView *tableView = AddTableView(self.view,CGRectMake(index*kScreenWidth/3, 0, kScreenWidth/3, 300), [UIColor whiteColor],self.tableDoubleDelegate);
    //2 注册cell类
     [tableView registerCellClasses:@[FirstTableViewCell.class]];
    tableView.rowHeight = 60;
    
    return tableView;
}

#pragma mark - LCXTableDoubleDelegate

- (LCXTableDoubleDelegate *)tableDoubleDelegate{
    if (_tableDoubleDelegate) return _tableDoubleDelegate;
    _tableDoubleDelegate = LCXTableDoubleDelegate.new;
    kWeakSelf;
    _tableDoubleDelegate.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return tableView.lcx_dataArr.count;
    };
    _tableDoubleDelegate.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        //复用cell的id
        NSString *reuseCellID = tableView.reuseCellIDs[0];
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseCellID];
        ((LCXTableViewCell *)cell).model = tableView.lcx_dataArr[indexPath.row];
        return cell;
    };
    _tableDoubleDelegate.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        [weakSelf actionForTableView:tableView didSelectRowAtIndexPath:indexPath];
    };
    return _tableDoubleDelegate;
}

#pragma mark - Action: tableDoubleDelegate

- (void)actionForTableView:(UITableView * _Nonnull )tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath{

}

#pragma mark - Data


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
