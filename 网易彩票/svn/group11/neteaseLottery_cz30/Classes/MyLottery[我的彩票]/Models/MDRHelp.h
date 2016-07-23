//
//  MDRHelp.h
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDRHelp : NSObject

/**
 "title" : "如何快速支付？",
 "html" : "help.html",
 "id" : "howtoquickpay"
 */

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *html;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)helpWithDict:(NSDictionary *)dict;

@end
