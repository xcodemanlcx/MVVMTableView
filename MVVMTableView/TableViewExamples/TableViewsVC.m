//
//  TableViewsVC.m
//  MVVMTableView
//
//  Created by lcx on 2020/1/2.
//  Copyright © 2020 lcx. All rights reserved.
//

#import "TableViewsVC.h"

//LCXTableViewTool
#import "LCXInitTableView.h"
#import "UITableView+LCXRegisterCellClasses.h"

@interface TableViewsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TableViewsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    
}

#pragma mark - UI

- (UITableView *)tableView{
    if (!_tableView){
        _tableView = AddTableView(self.view,self.view.bounds, [UIColor whiteColor],self);
        [_tableView lcx_registerCellClasses:@[UITableViewCell.class]];
    }
    return _tableView;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_tableView.lcx_reuseCellIDs[0]];
    cell.textLabel.text = @"hello";
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor whiteColor];

    return cell;
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//- (UITableView *)addTableViewWithIndex:(NSUInteger )index{
//    //1 初始化
//    UITableView *tableView = AddTableView(self.view,CGRectMake(index*kScreenWidth/3, 0, kScreenWidth/3, 300), [UIColor whiteColor],self.tableBlockDelegate);
//    //2 注册cell类
//    [tableView registerClass:AreaCell.class forCellReuseIdentifier:@"cellID"];
//    //3 数据
//    tableView.lcx_dataArr = [self dataArrWithIndex:index];
//    //4 刷新
//    [tableView reloadData];
//    return tableView;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
