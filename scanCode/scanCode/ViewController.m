//
//  ViewController.m
//  scanCode
//
//  Created by James on 2018/4/23.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"
#import "CitiesController.h"
#import "GoodsController.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)cxOnClick {
    GoodsController *gVC = [[GoodsController alloc]init];
    [self.navigationController pushViewController:gVC animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"条码查询器";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上海" style:UIBarButtonItemStyleDone target:self action:@selector(openCitiesVC)];
}

- (void)openCitiesVC{
    CitiesController *cVC =[[CitiesController alloc] init];
    [self.navigationController pushViewController:cVC animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
