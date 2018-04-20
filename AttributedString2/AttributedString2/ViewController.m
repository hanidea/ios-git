//
//  ViewController.m
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"
#import "NSString+AttributeStyle.h"
#import "ForeGroundColorStyle.h"
#import "FontStyle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = @"富文本";
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 320, 30)];
    label.attributedText = [string createAttributedStringWithStyles:\
                              @[[ForeGroundColorStyle withColor:[UIColor purpleColor] range:NSMakeRange(1, 1)],
                                [FontStyle withFont:[UIFont systemFontOfSize:28.f] range:NSMakeRange(0, 2)],
                               ]];
    
    [self.view addSubview:label];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
