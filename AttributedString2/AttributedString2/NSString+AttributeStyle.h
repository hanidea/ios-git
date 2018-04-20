//
//  NSString+AttributeStyle.h
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttributedStyle.h"
@interface NSString (AttributeStyle)

/**
 styles数组创建出富文本

 @param styles AttributedStyle构成的数组
 @return 富文本
 */
-(NSAttributedString *)createAttributedStringWithStyles:(NSArray*)styles;

@end
