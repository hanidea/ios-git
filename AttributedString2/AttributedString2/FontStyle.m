//
//  FontStyle.m
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "FontStyle.h"

@implementation FontStyle
+ (FontStyle *)withFont:(UIFont *)font range:(NSRange)range{
    FontStyle *fontStyle = [FontStyle attributeName:NSFontAttributeName value:font range:range];
    return fontStyle;
}
@end
