//
//  AttributedStyle.h
//  AttributedString2
//
//  Created by James on 2018/4/20.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
@interface AttributedStyle : NSObject
@property (nonatomic,strong) NSString *attributeName;
@property (nonatomic,strong) id value;
@property (nonatomic)NSRange range;
/**
构造器
 @param attributeName 属性姓名
 @param value 设置的值
 @param range 取之范围
 @return 实例对象
 */
+(AttributedStyle *)attributeName:(NSString *)attributeName value:(id)value range:(NSRange)range;

@end
