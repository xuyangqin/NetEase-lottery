//
//  MDRSettingCell.h
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MDRIcon              @"MDRIcon"
#define MDRTitle             @"MDRTitle"
#define MDRAccessory         @"MDRAccessory"
#define MDRAccessoryName     @"MDRAccessoryName"
#define MDRTargetVc          @"MDRTargetVc"
#define MDRCallFunction      @"MDRCallFunction"
#define MDRPlistName         @"MDRPlistName"
#define MDRDetail            @"MDRDetail"
#define MDRCellStyle         @"MDRCellStyle"
#define MDRHighLight         @"MDRHighLight"
#define MDRKeyName           @"MDRKeyName"  // 开关的键值
#define MDRTime              @"MDRTime"     // 保存时间的键值


#define MDRHeader            @"MDRHeader"
#define MDRFooter            @"MDRFooter"
#define MDRItems             @"MDRItems"


@interface MDRSettingCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView andDict:(NSDictionary *)item;

/** 每一行cell的字典内容 */
@property (nonatomic, strong) NSDictionary *item;


- (void)setDate:(NSString *)dateString;
@end
