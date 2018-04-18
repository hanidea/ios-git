//
//  RootViewController.m
//  TabBar
//
//  Created by James on 2018/4/18.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "RootViewController.h"
#import "ProfielViewController.h"
#import "MessageViewController.h"
#import "ColaViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
CGFloat const tabViewHeight=49;
CGFloat const btnWidth = 64;
CGFloat const btnHeight = 45;
@interface RootViewController()
@property(nonatomic,strong) UIImageView *selectView;
@end
@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tabBar.hidden = YES;
    [self initViewController];
    [self initTabBarView];
}
//初始化视图控制器
- (void)initViewController{
    ProfielViewController *profielVC = [[ProfielViewController alloc] init];
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    ColaViewController *colaVC = [[ColaViewController alloc] init];
    UserViewController *userVC = [[UserViewController alloc] init];
    MoreViewController *moreVC = [[MoreViewController alloc] init];
    NSArray *vcArray = @[profielVC,messageVC,colaVC,userVC,moreVC];
    NSMutableArray *tabArray = [NSMutableArray arrayWithCapacity:vcArray.count];
    //初始化导航
    for(int i=0; i<vcArray.count;i++){
        UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:vcArray[i]];
        [tabArray addObject:navCtrl];
    }
    //将导航给标签控制器
    self.viewControllers = tabArray;
}
//自定义标签工具栏
- (void)initTabBarView{
    //初始化标签工具栏视图
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight-tabViewHeight,kScreenWidth, tabViewHeight)];
    _tabBarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mask_navbar"]];
    [self.view addSubview:_tabBarView];
    //创建数组，图片
    NSArray *imgArray = @[@"home_tab_icon_1",@"home_tab_icon_2",@"home_tab_icon_3",@"home_tab_icon_4",@"home_tab_icon_5"];
    for (int i = 0;i<imgArray.count;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:imgArray[i]] forState:UIControlStateNormal];
        btn.frame = CGRectMake(btnWidth*i, (tabViewHeight-btnHeight)/2, btnWidth, btnHeight);
        btn.tag=100+i;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:btn];
    }
    _selectView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, btnWidth,btnHeight)];
    _selectView.image = [UIImage imageNamed:@"home_botton_tab_arrow"];
    [_tabBarView addSubview:_selectView];
}
- (void)btnAction:(UIButton*)button{
    self.selectedIndex = button.tag - 100;
    [UIView animateWithDuration:0.2 animations:^{
        _selectView.center = button.center;
    } completion:nil];}
//是否显示工具栏
- (void)showTabBar:(BOOL)show{
    CGRect frame = self.tabBarView.frame;
    if(show)
    {
        frame.origin.x = 0;
    }else{
        frame.origin.x = - kScreenWidth;
    }
    //重新赋值frame
    [UIView animateWithDuration:0.2 animations:^{
        self.tabBarView.frame = frame;
    } completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
