//
//  MMProduct.h
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMProduct : NSObject
/**
 "title": "邮箱大师",
 "stitle":"网易推出的通用邮箱APP",
 "id": "com.netease.mailmaster",
 "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
 "icon": "mail",
 "customUrl": "mailmaster"
 */
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *stitle;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *customUrl;
- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;
@end
