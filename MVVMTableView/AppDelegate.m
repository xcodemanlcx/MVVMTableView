//
//  AppDelegate.m
//  MVVMTableView
//
//  Created by lcx on 2019/12/20.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:ViewController.new];
    navigationVC.navigationBar.translucent = NO;
    self.window.rootViewController = navigationVC;
    
    return YES;
}

@end
