//
//  TestViewController.m
//  GKBlockedBarButtonItem
//
//  Created by 花菜ChrisCai on 2016/7/4.
//  Copyright © 2016年 花菜ChrisCai. All rights reserved.
//

#import "TestViewController.h"
#import "GKBlockedBarButtonItem.h"
@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"test";
    self.view.backgroundColor = [UIColor yellowColor];
    __weak typeof(self) weakSelf = self;
    self.navigationItem.leftBarButtonItem = [GKBlockedBarButtonItem blockedBarButtonItemWithTitle:@"返回" eventHandler:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
