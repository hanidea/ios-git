//
//  ViewController.m
//  Gesture
//
//  Created by James on 2018/4/18.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *gestureLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self tapGesture];
    [self SwipeGesture];
    [self PinchGesture];
    [self PanGesture];
    [self RotationGesture];
    [self LongPressGesture];
}
#pragma mark -Tap
- (void)tapGesture{
    //初始化
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SingleTap:)];
    tap.numberOfTapsRequired= 1;
    tap.numberOfTouchesRequired=1;
    //添加手势
    [self.view addGestureRecognizer:tap];
    //双击
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(DoubleTap:)];
    tap2.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap2];
    //同时存在
    [tap requireGestureRecognizerToFail:tap2];
    //两个手指单击
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(SigleTwoFingerTap:)];
    tap3.numberOfTouchesRequired =2;
    [self.view addGestureRecognizer:tap3];
    [tap2 requireGestureRecognizerToFail:tap3];
}
#pragma mark - Swipe
- (void)SwipeGesture{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(SwipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipe];
}
#pragma mark - Pinch
- (void)PinchGesture{
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(PinchAction:)];
    [self.view addGestureRecognizer:pinch];
}
#pragma mark - Pan
- (void)PanGesture{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(PanAction:)];
    _gestureLabel.userInteractionEnabled = YES;
    [_gestureLabel addGestureRecognizer:pan];
}
#pragma mark - Rotation
- (void)RotationGesture{
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(RotationAction:)];
    _gestureLabel.userInteractionEnabled = YES;
    [_gestureLabel addGestureRecognizer:rotation];
    
}
#pragma mark - LongPress
- (void)LongPressGesture{
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(LongPressAction:)];
    longPress.minimumPressDuration = 2;
    [self.view addGestureRecognizer:longPress];
}
#pragma mark - 响应方法
- (void)LongPressAction:(UILongPressGestureRecognizer*)longPress{
    _gestureLabel.text = @"长按2秒";
}
- (void)RotationAction:(UIRotationGestureRecognizer*)rotationGes{
    rotationGes.view.transform = CGAffineTransformRotate(rotationGes.view.transform, rotationGes.rotation);
    rotationGes.rotation = M_PI;
    _gestureLabel.text = @"旋转";
}
- (void)PanAction:(UIPanGestureRecognizer*)pan{
    //移动前
    CGPoint translation = [pan translationInView:self.view];
    //移动后
    pan.view.center=CGPointMake(pan.view.center.x + translation.x,pan.view.center.y + translation.y);
    [pan setTranslation:CGPointZero inView:self.view];
    _gestureLabel.text = @"把我放哪里";
}
- (void)SingleTap:(UITapGestureRecognizer*)tap{
    _gestureLabel.text= @"一个手指单击";
}
- (void)DoubleTap:(UITapGestureRecognizer*)tap{
     _gestureLabel.text= @"一个手指双击";
}
- (void)SigleTwoFingerTap:(UITapGestureRecognizer*)tap{
    _gestureLabel.text= @"两个手指单击";
}
- (void)SwipeAction:(UISwipeGestureRecognizer *)swipe{
    _gestureLabel.text= @"向左轻扫";
}
- (void)PinchAction:(UIPinchGestureRecognizer *)pinch{
    float scale = pinch.scale;
    pinch.view.transform = CGAffineTransformScale(pinch.view.transform, scale, scale);
    if(scale>1){
        _gestureLabel.text = @"捏合放大";
    }else if (scale<1){
        _gestureLabel.text = @"捏合缩小";
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
