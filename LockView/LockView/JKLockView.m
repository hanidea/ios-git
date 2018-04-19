//
//  JKLockView.m
//  LockView
//
//  Created by James on 2018/4/19.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "JKLockView.h"
CGFloat const btnCount = 9;
CGFloat const btnW = 74;
CGFloat const btnH = 74;
CGFloat const viewY = 100;
int const columnCount = 3;
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//匿名扩展：可以声明属性，私有
@interface JKLockView()
@property(nonatomic,strong)NSMutableArray *selectedBtns;
@property(nonatomic,assign)CGPoint currentPoint;
@end
@implementation JKLockView
//创建数组
- (NSMutableArray*)selectedBtns{
    if(_selectedBtns==nil){
        _selectedBtns = [NSMutableArray array];
    }
    return _selectedBtns;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self AddButton];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self AddButton];
    }
     return self;
}
- (void) AddButton{
    CGFloat height = 0;
    for (int i= 0;i<btnCount;i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:[UIImage imageNamed:@"lock_icon_normal"] forState:UIControlStateNormal];
        btn.userInteractionEnabled= NO;
        [btn setBackgroundImage:[UIImage imageNamed:@"lock_icon_on"] forState:UIControlStateSelected];
        btn.tag = i;
        int row = i/columnCount;//行
        int column = i % columnCount;//列
        //边距
        CGFloat margin = (self.frame.size.width - columnCount*btnW)/(columnCount+1);
        //x轴
        CGFloat btnX = margin + column*(btnW +margin);
        //y轴
        CGFloat btnY = row *(btnW+margin);
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        height = btnH +btnY;
        [self addSubview:btn];
    }
    self.frame = CGRectMake(0, viewY, kScreenWidth, height);
}
#pragma mark - 私有方法
- (CGPoint)pointWithTouch:(NSSet *)touches{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    return point;
}
- (UIButton *)buttonWithPoint:(CGPoint)point{
    for(UIButton *btn in self.subviews){
        if(CGRectContainsPoint(btn.frame, point)){
            return btn;
        }
    }
    return nil;
}
#pragma mark - 触摸方法
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event{
    //拿到触摸的点
    CGPoint point = [self pointWithTouch:touches];
    //触摸点拿到响应按钮
    UIButton *btn = [self buttonWithPoint:point];
    //按钮状态
    if(btn && btn.selected == NO){
        btn.selected = YES;
        [self.selectedBtns addObject:btn];//确认对象是否存在
    }
}
-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event{
    //拿到触摸的点
    CGPoint point = [self pointWithTouch:touches];
    //触摸点拿到响应按钮
    UIButton *btn = [self buttonWithPoint:point];
    //按钮状态
    if(btn && btn.selected == NO){
        btn.selected = YES;
        [self.selectedBtns addObject:btn];//确认对象是否存在
    }else{
        self.currentPoint = point;
    }
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet*)touches withEvent:(UIEvent *)event{
    if([self.delegate respondsToSelector:@selector(lockView:didFinishPath:)]){
        NSMutableString *path =[NSMutableString string];
        for(UIButton *btn in self.selectedBtns){
            [path appendFormat:@"%ld",(long)btn.tag];
        }
        [self.delegate lockView:self didFinishPath:path];
    }
    //清空状态
    [self.selectedBtns makeObjectsPerformSelector:@selector(setSelected:) withObject:nil];//NO无效
    [self.selectedBtns removeAllObjects];
    [self setNeedsDisplay];
}
-(void)touchesCancelled:(NSSet*)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}
#pragma mark - 绘图
-(void)drawRect:(CGRect)rect{
    if(self.selectedBtns.count == 0){
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 8;
    path.lineJoinStyle = kCGLineJoinRound;
    [[UIColor colorWithRed:32/255.0 green:210/255.0 blue:254/255.0 alpha:0.5] set];
    //遍历按钮
    for(int i = 0;i<self.selectedBtns.count;i++){
        UIButton *button = self.selectedBtns[i];
        if(i==0){//起点
            [path moveToPoint:button.center];
        }else{//连线
            [path addLineToPoint:button.center];
        }
    }
    [path addLineToPoint:self.currentPoint];
    [path stroke];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
