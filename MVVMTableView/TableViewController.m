//
//  TableViewController.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TableViewController.h"

//LCXTableViewTool
#import "LCXInitTableView.h"
#import "UITableView+LCXRegisterCellClasses.h"
#import "LCXTableViewCell.h"
#import "UITableView+LCXScroll.h"

//MVVM
#import "DetailViewController.h"
#import "SecondDetailViewController.h"
#import "TitleSelectView.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "RequestViewModel.h"

//加载更多-1 列表数据逻辑处理
#import "NSMutableArray+LCXHandleMoreData.h"

//加载更多-2 刷新提示UI
#import "UIScrollView+LCXRefresh.h"

//数据为空
#import "NSObject+LCXHandleDataNullView.h"

//网络异常
#import "NSObject+LCXHandleNoNetworkView.h"

//使用Masonry适配
#import "UIView+LCXMasonry.h"


#define kWeakSelf __weak typeof (self) weakSelf = self

typedef NS_ENUM(NSUInteger, ReloadDataStatus) {
    ReloadDataStatusList,//数据列表
    ReloadDataStatusNull,//数据为空
};

typedef NS_ENUM(NSUInteger, NetworkStatus) {
    NetworkStatusConnected,//有网络
    NetworkStatusDisconnected,//无网络
};

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
// 列表数据
@property(nonatomic, strong) NSMutableArray *dataArr;
// 数据总量
@property(nonatomic, assign) NSUInteger totalSize;
// 数据获取成功后，最新页码
@property(nonatomic, assign) NSUInteger page;
@property (nonatomic, strong) TitleSelectView *networkStatusSelectView;
@property (nonatomic, strong) TitleSelectView *dataStatusSelectView;

@end

@implementation TableViewController

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
    [self networkStatusSelectView];
    [self dataStatusSelectView];
    [self tableView];
    
    //初始化数据源
    _dataArr = @[].mutableCopy;

    //请求列表数据
    [self titleSelectAction:ReloadDataStatusList];
}

#pragma mark - Data：request、handle

- (void)requestMoreData:(NSNumber *)pageNumber{
    [self requestDataWithPage:pageNumber.unsignedIntegerValue];
}

- (void)requestDataWithPage:(NSUInteger)page{
    //网络状态
    BOOL isNoNetWork = _networkStatusSelectView.selectIndex;
    //停止刷新
    [_tableView lcx_endRefresh];
    if (!isNoNetWork) {
        //数据状态
        BOOL isDataNull = (_dataStatusSelectView.selectIndex==1);
                if (!isDataNull) {
                    
        #pragma mark 一 获取处理过后的网络数据
                    RequestViewModel *requestViewModel = [RequestViewModel requestAndDealWithDataForPage:page ];
                    
                    // 1 加载更多：数据逻辑处理
                    _totalSize = requestViewModel.totalSize;
                    [_dataArr lcx_handleMoreData:requestViewModel.modelArr nowPage:page];
                    _page = page;
                        
                    //2 上拉加载提示UI
                     if (_dataArr.count < kPageSize) {
                         //不超过1页，隐藏提示UI
                         [_tableView lcx_hiddenFooter:YES];
                     }else{
                         //超过1页，无更多数据时，显示提示UI
                         if (_dataArr.count >= requestViewModel.totalSize) {
                             [_tableView lcx_noMoreData];
                         }
                     }
                    
                    //3 数据不为空时，刷新列表
                    if (_dataArr.count > 0) {
                        [_tableView reloadData];
                    }
                        
                    //4 切换列表数据时：加载首页，重置滚动到顶部
                    if(page ==0){
                    //滚动到顶部，在reloadData之后使用有效
                        [_tableView lcx_scrollToTop];
                    }
        }else{
            //数据为空
            [_dataArr removeAllObjects];
        }
        
        #pragma mark 二 数据为空处理
        [self lcx_handleDataNullViewWithlistView:_tableView dataArr:_dataArr];
    }
    
    #pragma mark 三 网络异常处理
    kWeakSelf;
    [self lcx_handleNoNetworkViewWithlistView:_tableView reloadBlock:^{
        [weakSelf requestDataWithPage:page];
    } isNoNetWork:isNoNetWork];
}

#pragma mark - UI

- (TitleSelectView *)networkStatusSelectView{
    if (_networkStatusSelectView) return _networkStatusSelectView;
    _networkStatusSelectView = [[TitleSelectView alloc]initWithTitles:@[@"网络已连通",@"网络已断开"]];
    _networkStatusSelectView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_networkStatusSelectView];
    return _networkStatusSelectView;
}
    
- (TitleSelectView *)dataStatusSelectView{
    if (_dataStatusSelectView) return _dataStatusSelectView;
    _dataStatusSelectView = [[TitleSelectView alloc] initWithTitles:@[@"有数据",@"空数据"]];
    _dataStatusSelectView.frame = CGRectMake(0, 44, kScreenWidth, 44);
    _dataStatusSelectView.backgroundColor = [UIColor orangeColor];
    kWeakSelf;
    _dataStatusSelectView.lcx_actionBlock = ^(NSInteger actionIndex) {
        [weakSelf titleSelectAction:actionIndex];
    };
    [self.view addSubview:_dataStatusSelectView];
    return _dataStatusSelectView;
}

- (UITableView *)tableView{
    if (_tableView) return _tableView;
    //1 初始化
    _tableView = AddTableView(self.view,CGRectZero, [UIColor whiteColor],self);
    //2 注册cell类
     [_tableView registerCellClasses:@[FirstTableViewCell.class,SecondTableViewCell.class]];
    //3 masonry布局适配
    [_tableView lcx_safeBottomWithTop:88];
    //4 加载更多
    kWeakSelf;
    _tableView.lcx_footerFreshBlock = ^{
        if (weakSelf.dataArr.count < weakSelf.totalSize) {
            
            //延时加载-模拟加载网络数据
            [weakSelf performSelector:@selector(requestMoreData:) withObject:@(weakSelf.page+1) afterDelay:2];
        }else{
            [weakSelf.tableView lcx_noMoreData];
        }
    };
    //5 下拉刷新
    _tableView.lcx_headerFreshBlock = ^{
        [weakSelf requestDataWithPage:0];
    };
    return _tableView;
}

#pragma mark - Action

- (void)titleSelectAction:(ReloadDataStatus)reloadDataStatus{
    
    #pragma mark 四 数据或者网络状态切换
    // 1 停止刷新
    [_tableView lcx_endRefresh];
    // 2 取消之前的网络请求
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(requestMoreData:) object:@(_page+1)];
    // 3 网络正常时切换数据，需重置页码
    if (_networkStatusSelectView.selectIndex == NetworkStatusConnected) {
            _page = 0;
    }
    // 4 请求首页网络数据
    [self requestDataWithPage:_page];
}

- (void)cellAction:(NSIndexPath * _Nonnull)actionCellIndexPath actionIndex:(NSUInteger)cellActionIndex{
    
    if (cellActionIndex == 2) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        DetailViewController *detailViewController =  [DetailViewController new];
        detailViewController.title = [NSString stringWithFormat:@"{row=%ld,section=%ld},actionIndex=%ld",actionCellIndexPath.row,actionCellIndexPath.section,cellActionIndex];
        [self.navigationController pushViewController:detailViewController animated:YES];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1 复用cell的id
    NSString *cellID = _tableView.reuseCellIDs[indexPath.row%2];
   
    //2 复用cell内响应事件处理
    __weak typeof (self) weakSelf = self;
    UITableViewCell *cell = [tableView reuseCellID:cellID cellActionBlock:^(NSIndexPath * _Nonnull actionCellIndexPath, NSInteger cellActionIndex) {
        [weakSelf cellAction:actionCellIndexPath actionIndex:cellActionIndex];
    }];
    
    //3 传值
    ((LCXTableViewCell *)cell).lcx_model = _dataArr[indexPath.row];
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
