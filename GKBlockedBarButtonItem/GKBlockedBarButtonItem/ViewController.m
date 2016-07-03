//
//  ViewController.m
//  GKBlockedBarButtonItem
//
//  Created by 花菜ChrisCai on 2016/7/4.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "ViewController.h"
#import "GKBlockedButton.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGRect rect = CGRectMake(100, 100, 100, 100);
    __weak typeof(self) weakSelf = self;
    GKBlockedButton *blockedBtn = [GKBlockedButton blockedButtonWithTapHandler:^{
        NSLog(@"点击了按钮");
        [weakSelf.navigationController pushViewController:[TestViewController new] animated:YES];
    } frame:rect addToSuperview:self.view];
    
    blockedBtn.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
