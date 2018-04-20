//
//  NSString+AttributeStyle.m
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "NSString+AttributeStyle.h"

@implementation NSString (AttributeStyle)
-(NSAttributedString *)createAttributedStringWithStyles:(NSArray*)styles{
    if(self.length <= 0){
        return nil;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    for(int count = 0;count<styles.count;count++){
        AttributedStyle *style = styles[count];
        [attributedString addAttribute:style.attributeName value:style.value range:style.range];
        
    }
    return attributedString;
}
@end
