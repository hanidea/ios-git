//
//  ProfielViewController.m
//  TabBar
//
//  Created by James on 2018/4/18.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ProfielViewController.h"
#import "ModelViewController.h"
#import "PushViewController.h"
#import "RootViewController.h"
CGFloat const writeButtonWidth = 33;
CGFloat const writeButtonHeight = 32;
@interface ProfielViewController ()

@end

@implementation ProfielViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"首页";
    self.view.backgroundColor = [UIColor yellowColor];
    [self initNavButton];
    [self initPushButton];
}
//自定义导航栏按钮
- (void)initNavButton{
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    writeBtn.frame = CGRectMake(0, 0, writeButtonWidth, writeButtonHeight);
    [writeBtn setBackgroundImage:[UIImage imageNamed:@"write"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(presentAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:writeBtn];
    self.navigationItem.rightBarButtonItem= item;
}
- (void)initPushButton{
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pushButton.frame = CGRectMake(100, 100, 200, 40);
//    [pushButton setImage:(UIImage *) forState:(UIControlState)]
    [pushButton setTitle:@"Push" forState:UIControlStateNormal];
    [pushButton addTarget:self action:@selector(pushAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
}
- (void)pushAction{
    PushViewController *pushVC = [[PushViewController alloc]init];
    [self.navigationController pushViewController:pushVC animated:YES];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:NO];
    //[self.navigationController showViewController:(UIViewController *) sender:(id)];
}
- (void)presentAction{
    ModelViewController *modalVC =[[ModelViewController alloc] init];
    //模态视图
    [self presentViewController:modalVC animated:YES completion:nil];
}
//视图出现的时候调用方法
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    RootViewController *rootVC = (RootViewController *)self.tabBarController;
    [rootVC showTabBar:YES];
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
