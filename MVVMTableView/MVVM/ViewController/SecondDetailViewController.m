//
//  SecondDetailViewController.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/23.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "SecondDetailViewController.h"

@interface SecondDetailViewController ()

@end

@implementation SecondDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
