//
//  MMHelpModel.h
//  网易彩票
//
//  Created by ios on 16/6/25.
//  Copyright © 2016年 itcast. All rights reserved.
//
//"title" : "如何领奖？",
//"html" : "help.html",
//"id" : "howtoprize"

#import <Foundation/Foundation.h>

@interface MMHelpModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *html;
@property (nonatomic, copy) NSString *ID;
- (instancetype)initWithHelpDict:(NSDictionary *)dict;
+ (instancetype)helpWithDict:(NSDictionary *)dict;
@end
