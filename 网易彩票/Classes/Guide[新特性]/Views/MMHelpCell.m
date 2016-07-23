//
//  MMHelpCell.m
//  网易彩票
//
//  Created by ios on 16/6/26.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMHelpCell.h"
#import "MMHelpModel.h"
@implementation MMHelpCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"reuseIdentifier";
    MMHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[MMHelpCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    return cell;
}
- (void)setModel:(MMHelpModel *)model{
    _model = model;
    self.textLabel.text = model.title;
}
@end
