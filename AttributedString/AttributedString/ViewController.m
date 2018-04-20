//
//  ViewController.m
//  AttributedString
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *string = @"AttributedString应用";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    //设置富文本样式前后顺序不影响覆盖
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor]
                             range:NSMakeRange(0, 1)];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:24.f]
                             range:NSMakeRange(0, 2)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    label.attributedText = attributedString;
    [self.view addSubview:label];
    
}

- (void)typeOne{
    NSString *string = @"AttributedString应用";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    label.text = string;
    [self.view addSubview:label];
}
- (void)typeTwo{
    NSString *string = @"AttributedString应用";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    //设置富文本样式
    [attributedString addAttribute:NSForegroundColorAttributeName
                             value:[UIColor redColor]
                             range:NSMakeRange(0, 1)];
    [attributedString addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:24.f]
                             range:NSMakeRange(0, 2)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 30)];
    label.attributedText = attributedString;
    [self.view addSubview:label];
}
- (void)typethree{
    NSString *string = @"AttributedString应用\nAttributedString段落应用";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:string];
    //设置富文本样式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 10.f;
    style.paragraphSpacing = 20.f;
    [attributedString addAttribute:NSParagraphStyleAttributeName
                             value:style
                             range:NSMakeRange(0, string.length)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 320, 100)];
    //设置段落样式numberoflines为0
    label.numberOfLines =0;
    label.attributedText = attributedString;
    [self.view addSubview:label];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
