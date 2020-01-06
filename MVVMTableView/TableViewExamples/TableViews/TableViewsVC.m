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
#import "UIView+LCXDataArray.h"
#import "AreaCell.h"

#define kWeakSelf __weak typeof (self) weakSelf = self
#define kScreenWidth UIScreen.mainScreen.bounds.size.width

@interface TableViewsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *provinceTableView;
@property (nonatomic, strong) UITableView *cityTableView;
@property (nonatomic, strong) UITableView *districtTableView;

@end

@implementation TableViewsVC

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
    
    _provinceTableView = [self addTableViewWithIndex:0];
    _cityTableView = [self addTableViewWithIndex:1];
    _districtTableView = [self addTableViewWithIndex:2];
}

#pragma mark - UI

- (UITableView *)addTableViewWithIndex:(NSUInteger )index{
    //1 初始化
    UITableView *tableView = AddTableView(self.view,CGRectMake(index*kScreenWidth/3, 0, kScreenWidth/3, 300), [UIColor whiteColor],self);
    //2 注册cell类
    [tableView registerClass:AreaCell.class forCellReuseIdentifier:@"cellID"];
    //3 数据
    tableView.lcx_dataArr = [self dataArrWithIndex:index];
    //4 刷新
    [tableView reloadData];
    return tableView;
}

#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView.lcx_dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    AreaCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    cell.areaLab.text = tableView.lcx_dataArr[indexPath.row];
    return cell;
}

#pragma mark  UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
