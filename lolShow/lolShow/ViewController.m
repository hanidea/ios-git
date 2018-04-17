//
//  ViewController.m
//  lolShow
//
//  Created by James on 2018/4/17.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ViewController.h"
#import "JHero.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray *hero;
@end

@implementation ViewController
//懒加载
-(NSArray *)heros{
    if(!_hero){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array){
            JHero *hero = [JHero heroWithDict:dict];
            [arrayM addObject:hero];
        }
        _hero = [arrayM copy];
    }
    return _hero;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heros.count;
}
//-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(nonnull NSString *)title atIndex:(NSInteger)index{
//    return 1
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *identifier = @"heroCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    JHero *hero = self.heros[indexPath.row];
    cell.textLabel.text= hero.name;
    cell.detailTextLabel.text = hero.intro;
    cell.detailTextLabel.textColor =[UIColor orangeColor];
    cell.imageView.image=[UIImage imageNamed:hero.icon];
    return cell;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 66;
}
- (BOOL) prefersStatusBarHidden{
    return YES;
}
@end
