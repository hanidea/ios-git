//
//  JHero.m
//  lolShow
//
//  Created by James on 2018/4/17.
//  Copyright © 2018年 51hanhan. All rights reserved.
//

#import "JHero.h"

@implementation JHero

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)heroWithDict:(NSDictionary *)dict{
    return [[self alloc] initWithDict:dict];
}
@end
