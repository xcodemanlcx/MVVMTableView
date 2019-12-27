//
//  ViewController.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/27.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}

- (IBAction)showTableViewAction:(id)sender {
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:TableViewController.new];
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
