//
//  ViewController.m
//  tomcat
//
//  Created by James on 2018/4/11.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomImageView;

@end

@implementation ViewController
- (IBAction)touchHeadOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"knockout" imageCount:81];
}
- (IBAction)eatOnClick:(UIButton *)sender {
    [self tomAnimateWith:@"eat" imageCount:40];
}

//- (void)clearImages
//{
//    self.tomImageView.animationImages =nil;
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 动画执行方法
- (void)tomAnimateWith:(NSString *)fileName imageCount:(NSInteger)imageCount
{
    if (self.tomImageView.isAnimating) {
        return;
    }
    //首先创建图片数组
    NSMutableArray *tomImages = [NSMutableArray array];
    for (int i=0;i<imageCount;i++){
        NSString *imageName = [NSString stringWithFormat:@"%@_%02d.jpg",fileName,i];
        //UIImage *image = [UIImage imageNamed:imageName];
        NSString *path = [[NSBundle mainBundle]pathForResource:imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [tomImages addObject:image];
    }
    //动画执行的图片数组
    [self.tomImageView setAnimationImages:tomImages];
    //设置动画执行的时间
    [self.tomImageView setAnimationDuration:self.tomImageView.animationImages.count*0.1];
    //设置动画执行的次数
    [self.tomImageView setAnimationRepeatCount:1];
    //设置动画开始执行
    [self.tomImageView startAnimating];
    //结束之后清空数组
    //    [self performSelector:@selector(clearImages)withObject:nil afterDelay:self.tomImageView.animationDuration];
    [self.tomImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomImageView.animationDuration];
}

@end
