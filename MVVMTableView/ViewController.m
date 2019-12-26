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

//加载更多-1 列表数据逻辑处理
#import "NSMutableArray+LCXHandleMoreData.h"

//加载更多-2 刷新提示UI
#import "UIScrollView+LCXRefresh.h"

//数据为空
#import "NSObject+LCXDataNull.h"
#import "LCXDataNullView.h"

//网络异常
#import "NSObject+LCXNoNetWork.h"

//使用Masonry适配
#import "UIView+LCXMasonry.h"


#define kWeakSelf __weak typeof (self) weakSelf = self

typedef NS_ENUM(NSUInteger, ReloadDataStatus) {
    ReloadDataStatusList,//数据列表
    ReloadDataStatusNull,//数据为空
    ReloadDataStatusNoNetwork,//网络异常
};

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
// 列表数据
@property(nonatomic, strong) NSMutableArray *dataArr;
// 数据总量
@property(nonatomic, assign) NSUInteger totalSize;
// 数据获取成功后，最新页码
@property(nonatomic, assign) NSUInteger page;
@property (nonatomic, strong) TitleSelectView *titleSelectView;

@end

@implementation ViewController

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
    [self titleSelectView];
    [self tableView];
    
    //初始化数据源
    _dataArr = @[].mutableCopy;

    //请求列表数据
    [self titleSelectAction:ReloadDataStatusList];
}

#pragma mark - Data：request、handle

- (void)requestDataWithPage:(NSUInteger)page type:(ReloadDataStatus)reloadDataStatus{
    //网路状态
    BOOL isNoNetWork = (reloadDataStatus==ReloadDataStatusNoNetwork);
    //停止刷新
    [self.tableView lcx_endRefresh];
    if (!isNoNetWork) {
                if (reloadDataStatus == ReloadDataStatusList) {
                    
        #pragma mark 一 获取处理过后的网络数据
                    RequestViewModel *requestViewModel = [RequestViewModel requestAndDealWithDataForPage:page ];
                    
                    // 1 加载更多：数据逻辑处理
                        _totalSize = requestViewModel.totalSize;
                        [_dataArr lcx_handleMoreData:requestViewModel.modelArr nowPage:page];
                        _page = page;
                        
                    //2 无更多数据，隐藏底部上拉提示UI
                        if (_dataArr.count < kPageSize) {
                            [_tableView lcx_hiddenRefresh:YES];
                        }
                    
                    //3 数据不为空时，刷新列表
                    if (_dataArr.count > 0) {
                        [_tableView reloadData];
                    }
                        
                    //4 切换列表数据时：加载首页，重置滚动到顶部
                        if(page ==0){
                        //滚动到顶部，在reloadData之后使用有效
                            [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
                        }
        }else if(reloadDataStatus == ReloadDataStatusNull){
            //数据为空
            [_dataArr removeAllObjects];
        }
        
        #pragma mark 二 数据为空处理
        [self lcx_customDataNullViewBlock:^UIView * _Nonnull{
            //自定义UI
            return [[LCXDataNullView alloc] initWithListView:self.tableView];
        } dataArr:_dataArr];
    }
    
    #pragma mark 三 网络异常处理
    [self lcx_customNoNetWorkViewBlock:^UIView *_Nonnull{
        //自定义UI
        LCXNoNetworkView *noNetworkView = [[LCXNoNetworkView alloc] initWithListView:self.tableView];
        kWeakSelf;
        noNetworkView.reloadBlock = ^{
            //重新加载后，获取数据列表，模拟网络正常
            [weakSelf titleSelectAction:ReloadDataStatusList];
        };
        return noNetworkView;
    } isNoNetWork:isNoNetWork];
}

#pragma mark - UI

- (TitleSelectView *)titleSelectView{
    if (_titleSelectView) return _titleSelectView;
    _titleSelectView = [[TitleSelectView alloc]initWithTitles:@[@"列表1",@"列表2",@"空数据",@"无网络"]];
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
    _tableView = AddTableView(self.view,CGRectZero, [UIColor whiteColor],self);
    //注册cell类
     [_tableView registerCellClasses:@[FirstTableViewCell.class,SecondTableViewCell.class]];
    //masonry布局适配
    [_tableView lcx_safeBottomWithBottom:40 top:44];
    //加载更多
    kWeakSelf;
    _tableView.lcx_footerFreshBlock = ^{
        if (weakSelf.dataArr.count < weakSelf.totalSize) {
            //延时加载-模拟加载网络数据
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf requestDataWithPage:weakSelf.page+1 type:ReloadDataStatusList];
            });

        }else{
            [weakSelf.tableView lcx_noMoreData];
        }
    };
    return _tableView;
}

#pragma mark - Action

- (void)titleSelectAction:(NSInteger)actionIndex{
    ReloadDataStatus  reloadDataStatus =  ReloadDataStatusList;
    switch (actionIndex) {
            case 2:
            reloadDataStatus =  ReloadDataStatusNull;
            break;
            case 3:
            reloadDataStatus =  ReloadDataStatusNoNetwork;
            break;
            
        default:
            break;
    }
    //有bug，正在刷新时，切换到空数据状态，刷新完成后，显示数据
    [_tableView lcx_endRefresh];
    //请求首页网络数据
    [self requestDataWithPage:0 type:reloadDataStatus];
}

- (void)cellAction:(NSIndexPath * _Nonnull)actionCellIndexPath actionIndex:(NSUInteger)cellActionIndex{
   
    DetailViewController *detailViewController =  [DetailViewController new];
    detailViewController.title = [NSString stringWithFormat:@"{row=%ld,section=%ld},actionIndex=%ld",actionCellIndexPath.row,actionCellIndexPath.section,cellActionIndex];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //1 复用cell的id
    NSInteger cellIDIndex = (_titleSelectView.selectIndex==0)?(indexPath.row%2):1;
    NSString *cellID = _tableView.reuseCellIDs[cellIDIndex];
    
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"scrollView.frame == %lf,%lf", scrollView.frame.origin.y,scrollView.frame.size.height);
}

@end
