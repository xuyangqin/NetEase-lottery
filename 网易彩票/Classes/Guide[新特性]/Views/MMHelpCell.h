//
//  MMHelpCell.h
//  网易彩票
//
//  Created by ios on 16/6/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHelpModel;
@interface MMHelpCell : UITableViewCell
@property (nonatomic, strong) MMHelpModel *model;
//创建cell的类
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
