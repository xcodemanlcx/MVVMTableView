//
//  ViewController.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewController.h"
#import "MoreDataTableViewVC.h"
#import "DelegateTableViewVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - Action

- (IBAction)showDelegateTableViewAction:(id)sender {
    [self presentVC:DelegateTableViewVC.new];
}

- (IBAction)showTableViewAction:(id)sender {
    [self presentVC:MoreDataTableViewVC.new];
}

- (void)presentVC:(UIViewController *)viewController{
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:viewController];
    navigationVC.navigationBar.translucent = NO;
    navigationVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navigationVC animated:YES completion:nil];
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
