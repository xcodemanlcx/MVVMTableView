//
//  ViewController.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewController.h"

//LCXTableViewTool

#import "LCXInitTableView.h"
#import "UITableView+LCXRegisterCellClasses.h"
#import "LCXTableViewCell.h"

//MVVM
#import "DetailViewController.h"
#import "SecondDetailViewController.h"
#import "TitleSelectView.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "RequestViewModel.h"

//加载更多-列表数据逻辑处理
#import "NSObject+LCXReloadMoreData.h"

//数据为空
#import "NSObject+LCXDataNull.h"
#import "LCXDataNullView.h"

//网络异常
#import "NSObject+LCXNoNetWork.h"


#define kWeakSelf __weak typeof (self) weakSelf = self

typedef NS_ENUM(NSUInteger, ReloadDataStatus) {
    ReloadDataStatusList,//数据列表
    ReloadDataStatusNull,//数据为空
    ReloadDataStatusNoNetwork,//网络异常
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) TitleSelectView *titleSelectView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"MVVMTableView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //UI
    [self titleSelectView];
    [self tableView];
    
    //请求数据
    [self requestDataWithPage:0 type:_titleSelectView.selectIndex];
    
    //刷新
    if (self.lcx_dataArr.count > 0) {
        [_tableView reloadData];
    }
}

#pragma mark - Data

- (void)requestDataWithPage:(NSUInteger)page type:(NSInteger)type{
    if (type == 0) {
        //获取网路数据
        NSArray *modelArr = [RequestViewModel requestAndDealWithDataForPage:page];
        //加载更多：数据逻辑处理
        [self lcx_handleMoreData:modelArr totalSize:100 nowPage:self.lcx_page];
    }else if(type == 1){
        //数据为空
        [self.lcx_dataArr removeAllObjects];
        self.lcx_dataArr = nil;
    }
}

#pragma mark - UI

- (TitleSelectView *)titleSelectView{
    if (_titleSelectView) return _titleSelectView;
    _titleSelectView = [[TitleSelectView alloc]initWithTitles:@[@"数据列表",@"数据为空",@"网络异常"]];
    kWeakSelf;
    _titleSelectView.lcx_actionBlock = ^(NSInteger actionIndex) {
        [weakSelf titleSelectAction:actionIndex];
    };
    [self.view addSubview:_titleSelectView];
    return _titleSelectView;
}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    //初始化
    _tableView = AddTableView(self.view,CGRectMake(0, 44, self.view.bounds.size.width, self.view.bounds.size.height), [UIColor whiteColor],self);
    //注册cell类
    [_tableView registerCellClasses:@[FirstTableViewCell.class,SecondTableViewCell.class]];
    return _tableView;
}

#pragma mark - Action

- (void)titleSelectAction:(ReloadDataStatus)reloadDataStatus{
    
    BOOL isNoNetWork = (reloadDataStatus==ReloadDataStatusNoNetwork);
    
    //1 网络正常处理
    if (!isNoNetWork) {
        //获取到网络数据
        [self requestDataWithPage:0 type:reloadDataStatus];
        
        //2 数据为空处理
        [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
            //自定义UI
            return [[LCXDataNullView alloc] initWithSuperView:self.view top:44];
        } dataArr:self.lcx_dataArr];
        //刷新列表
        if (self.lcx_dataArr.count > 0) {
            [_tableView reloadData];
        }
    }

    //3 网络异常处理
    [self lcx_customNoNetWorkViewBlock:^UIView *_Nonnull{
        //自定义UI
        LCXNoNetworkView *noNetworkView = [[LCXNoNetworkView alloc] initWithSuperView:self.view top:44];
        kWeakSelf;
        noNetworkView.reloadBlock = ^{
            //重新加载后，获取数据列表，模拟网络正常
            [weakSelf titleSelectAction:ReloadDataStatusList];
        };
        return noNetworkView;
    } isNoNetWork:isNoNetWork];
}

- (void)cellAction:(NSIndexPath * _Nonnull)actionCellIndexPath cellActionIndex:(NSUInteger)cellActionIndex{
   
    DetailViewController *detailViewController =  [DetailViewController new];
    detailViewController.title = [NSString stringWithFormat:@"{row=%ld,section=%ld},actionIndex=%ld",actionCellIndexPath.row,actionCellIndexPath.section,cellActionIndex];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.lcx_dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1 复用cell的id
    NSString *cellID = nil;
    if (_titleSelectView.selectIndex == 2) {
        //网络异常-重新加载UI
        cellID = _tableView.reuseCellIDs[1];
    }else{
        cellID = _tableView.reuseCellIDs[indexPath.row%2];
    }
    
    //2 复用cell内响应事件处理
    __weak typeof (self) weakSelf = self;
    UITableViewCell *cell = [tableView reuseCellID:cellID cellActionBlock:^(NSIndexPath * _Nonnull actionCellIndexPath, NSInteger cellActionIndex) {
        [weakSelf cellAction:actionCellIndexPath cellActionIndex:cellActionIndex];
    }];
    
    //3 传值
    ((LCXTableViewCell *)cell).lcx_model = self.lcx_dataArr[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
