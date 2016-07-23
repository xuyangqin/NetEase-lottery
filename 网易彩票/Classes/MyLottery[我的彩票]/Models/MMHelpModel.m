//
//  MMHelpModel.m
//  网易彩票
//
//  Created by ios on 16/6/25.
//  Copyright © 2016年 itcast. All rights reserved.
//
//"title" : "如何领奖？",
//"html" : "help.html",
//"id" : "howtoprize"
#import "MMHelpModel.h"

@implementation MMHelpModel
- (instancetype)initWithHelpDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.html = dict[@"html"];
        self.ID = dict[@"id"];
    }
    return self;
}
+ (instancetype)helpWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithHelpDict:dict];

}
@end
