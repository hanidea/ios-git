//
//  ForeGroundColorStyle.m
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "ForeGroundColorStyle.h"

@implementation ForeGroundColorStyle

+ (ForeGroundColorStyle *)withColor:(UIColor*)color range:(NSRange)range{
    ForeGroundColorStyle *style = [ForeGroundColorStyle attributeName:NSForegroundColorAttributeName
                                                           value:color
                                                           range:range];
    return style;
}

@end
