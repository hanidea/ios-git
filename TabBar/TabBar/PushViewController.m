//
//  PushViewController.m
//  TabBar
//
//  Created by James on 2018/4/18.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor greenColor];
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 100, 200, 40);
    [pushButton setTitle:@"Pop" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(popAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}
- (void)popAction{
    [self.navigationController popViewControllerAnimated:YES];
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
