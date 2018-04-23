//
//  ViewController.m
//  picBrowser
//
//  Created by James on 2018/4/23.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
CGFloat kImgCount = 7;
CGFloat scrollY = 20;
CGFloat pageCtrlWidth = 200;
@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageCtrl;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initScrollView];
    [self initPageControl];
    [self addTimer];
}
-(void) initScrollView{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, scrollY, kScreenWidth, kScreenHeight-scrollY)];
    self.scrollView.delegate= self;
    for(int i = 0;i<kImgCount;i++){
        UIImageView *imgview = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i, scrollY, kScreenWidth, kScreenHeight-scrollY)];
        imgview.image = [UIImage imageNamed:[NSString stringWithFormat:@"hy%d",i+1]];
        [self.scrollView addSubview:imgview];
    }
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*kImgCount, kScreenHeight-20);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
}
-(void) initPageControl{
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((kScreenWidth-pageCtrlWidth)/2, kScreenHeight-scrollY, pageCtrlWidth, scrollY)];
    self.pageCtrl.numberOfPages = kImgCount;
    self.pageCtrl.pageIndicatorTintColor = [UIColor greenColor];
    self.pageCtrl.currentPageIndicatorTintColor=[UIColor yellowColor];
    [self.view insertSubview:self.pageCtrl aboveSubview:self.scrollView];
}
- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)nextPage{
    NSInteger page = self.pageCtrl.currentPage;
    page++;
    if (page == kImgCount){
        page=0;
    }
    CGPoint point = CGPointMake(kScreenWidth*page, 0);
    [self.scrollView setContentOffset:point animated:YES];
}
#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = scrollView.contentOffset.x/kScreenWidth+0.5;
    self.pageCtrl.currentPage = page;
}
//视图拖动关掉定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self removeTimer];
    NSLog(@"Begin");
}
//视图停止拖动重启定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
    NSLog(@"End");
}
- (void)removeTimer{
    [self.timer invalidate];
    self.timer =nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
