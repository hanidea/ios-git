//
//  AttributedStyle.m
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "AttributedStyle.h"

@implementation AttributedStyle
+(AttributedStyle *)attributeName:(NSString *)attributeName value:(id)value range:(NSRange)range{
    AttributedStyle *style = [[self class] new];
    style.attributeName = attributeName;
    style.value = value;
    style.range = range;
    return style;
}
@end
