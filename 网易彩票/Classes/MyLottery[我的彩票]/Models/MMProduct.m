//
//  MMProduct.m
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProduct.h"
/**
 "title": "邮箱大师",
 "stitle":"网易推出的通用邮箱APP",
 "id": "com.netease.mailmaster",
 "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
 "icon": "mail",
 "customUrl": "mailmaster"
 */
@implementation MMProduct
- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        self.title = dict[@"title"];
        self.stitle = dict[@"stitle"];
        self.ID = dict[@"id"];
        self.url = dict[@"url"];
        self.icon = dict[@"icon"];
        self.customUrl = dict[@"customUrl"];
    }
    return self;
}
+ (instancetype)productWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
