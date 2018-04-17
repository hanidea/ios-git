//
//  JHero.h
//  lolShow
//
//  Created by James on 2018/4/17.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JHero : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *intro;
@property(nonatomic,copy)NSString *icon;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)heroWithDict:(NSDictionary *)dict;
@end
