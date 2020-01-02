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

//LCXTableBlockDelegate
#import "LCXTableBlockDelegate.h
#import "UIView+LCXDataArray.h"

#import "AreaCell.h"

#define kWeakSelf __weak typeof (self) weakSelf = self
#define kScreenWidth UIScreen.mainScreen.bounds.size.width

@interface DelegateTableViewVC ()

@property (nonatomic, strong) UITableView *provinceTableView;
@property (nonatomic, strong) UITableView *cityTableView;
@property (nonatomic, strong) UITableView *districtTableView;

@property (nonatomic, strong) LCXTableBlockDelegate *tableBlockDelegate;

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
    
    self.title = @"DelegateTableView";
    self.view.backgroundColor = [UIColor yellowColor];
    
    _provinceTableView = [self addTableViewWithIndex:0];
    _cityTableView = [self addTableViewWithIndex:1];
    _districtTableView = [self addTableViewWithIndex:2];
}

#pragma mark - UI

- (UITableView *)addTableViewWithIndex:(NSUInteger )index{
    //1 初始化
    UITableView *tableView = AddTableView(self.view,CGRectMake(index*kScreenWidth/3, 0, kScreenWidth/3, 300), [UIColor whiteColor],self.tableBlockDelegate);
    //2 注册cell类
    [tableView registerClass:AreaCell.class forCellReuseIdentifier:@"cellID"];
    //3 数据
    tableView.lcx_dataArr = [self dataArrWithIndex:index];
    //4 刷新
    [tableView reloadData];
    return tableView;
}

#pragma mark - LCXTableBlockDelegate

- (LCXTableBlockDelegate *)tableBlockDelegate{
    if (_tableBlockDelegate) return _tableBlockDelegate;
    _tableBlockDelegate = LCXTableBlockDelegate.new;
    kWeakSelf;
    _tableBlockDelegate.numberOfRowsInSectionBlock = ^NSInteger(UITableView * _Nonnull tableView, NSInteger section) {
        return tableView.lcx_dataArr.count;
    };
    _tableBlockDelegate.cellForRowAtIndexPathBlock = ^UITableViewCell * _Nonnull(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
        static NSString *cellID = @"cellID";
        AreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        cell.areaLab.text = tableView.lcx_dataArr[indexPath.row];
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

#pragma mark - Data

- (NSMutableArray *)dataArrWithIndex:(NSUInteger)index{
    NSString *area = nil;
    switch (index) {
            case 0:
                area = @"广东省";
                break;
            case 1:
                area = @"深圳市";
                break;
            case 2:
                area = @"福田区";
                break;
        default:
            break;
    }
    NSMutableArray *tempArr = @[].mutableCopy;
    for (int i = 0; i < 5*(3-index); i++) {
        [tempArr addObject:[NSString stringWithFormat:@"%@%d",area,i]];
    }
    return tempArr;
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
