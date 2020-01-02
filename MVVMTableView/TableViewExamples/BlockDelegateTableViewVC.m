//
//  BlockDelegateTableViewVC.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/31.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "BlockDelegateTableViewVC.h"

//LCXTableViewTool
#import "LCXInitTableView.h"

#import "UITableView+LCXRegisterCellClasses.h"

//LCXTableBlockDelegate
#import "LCXTableBlockDelegate.h"

#import "AreaCell.h"

#define kWeakSelf __weak typeof (self) weakSelf = self
#define kScreenWidth UIScreen.mainScreen.bounds.size.width

@interface BlockDelegateTableViewVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) LCXTableBlockDelegate *tableBlockDelegate;

@end

@implementation BlockDelegateTableViewVC

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
    _dataArr = @[@"hello"].mutableCopy;
    for (NSInteger i = 0; i < 10; i++) {
        [_dataArr addObject:[NSString stringWithFormat:@"hello world %ld",i]];
    }
    [_tableView reloadData];
}

#pragma mark - UI

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = AddTableView(self.view,self.view.bounds, [UIColor whiteColor],self.tableBlockDelegate);
    }
    //2 注册cell类
    [_tableView lcx_registerCellClasses:@[UITableViewCell.class]];
    return _tableView;
}

#pragma mark - LCXTableBlockDelegate

- (LCXTableBlockDelegate *)tableBlockDelegate{
    if (_tableBlockDelegate) return _tableBlockDelegate;
    _tableBlockDelegate = LCXTableBlockDelegate.new;
    kWeakSelf;
    _tableBlockDelegate.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return weakSelf.dataArr.count;
    };
    _tableBlockDelegate.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableView.lcx_reuseCellIDs[0]];
        cell.textLabel.text = @"hello";
        cell.textLabel.textColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    };
    _tableBlockDelegate.heightForRowAtIndexPathBlock = ^CGFloat(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        return 40;
    };
    _tableBlockDelegate.didSelectRowAtIndexPathBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        [weakSelf actionForTableView:tableView didSelectRowAtIndexPath:indexPath];
    };
    return _tableBlockDelegate;
}

#pragma mark - Action: tableBlockDelegate

- (void)actionForTableView:(UITableView * _Nonnull )tableView didSelectRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath{
    [self dismissViewControllerAnimated:YES completion:nil];
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
