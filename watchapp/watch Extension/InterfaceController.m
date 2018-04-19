//
//  InterfaceController.m
//  watch Extension
//
//  Created by James on 2018/4/19.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *showLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceButton *btn;

@end


@implementation InterfaceController
- (IBAction)chooseNum:(float)value {
    NSInteger num = value;
    self.showLabel.text = [NSString stringWithFormat:@"当前值:%ld",(long)num];
}
- (IBAction)btnAction {
}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



