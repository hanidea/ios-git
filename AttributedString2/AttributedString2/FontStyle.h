//
//  FontStyle.h
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "AttributedStyle.h"

@interface FontStyle : AttributedStyle
+ (FontStyle *)withFont:(UIFont *)font range:(NSRange)range;
@end
