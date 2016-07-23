//
//  MDRProduct.h
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDRProduct : NSObject

/**
 "title": "邮箱大师",
 
 "customUrl": "mailmaster"
 "id": "com.netease.mailmaster",
 "url": "https://itunes.apple.com/cn/app/you-xiang-da-shi/id897003024?mt=8",
 "icon": "mail",
 */

/** 名称 */
@property (nonatomic, copy) NSString *title;
/** 头像图片 */
@property (nonatomic, copy) NSString *icon;
/** 跳转连接 */
@property (nonatomic, copy) NSString *ID;
/** 跳转连接 */
@property (nonatomic, copy) NSString *customUrl;
/** 下载地址 */
@property (nonatomic, copy) NSString *url;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)productWithDict:(NSDictionary *)dict;

@end
