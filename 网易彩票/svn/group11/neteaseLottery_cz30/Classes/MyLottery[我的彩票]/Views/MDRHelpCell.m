//
//  MDRHelpCell.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRHelpCell.h"
#import "MDRHelp.h"

@implementation MDRHelpCell
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ID = @"help";
    MDRHelpCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[MDRHelpCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow_right"]];
    
    return cell;
}

- (void)setHelp:(MDRHelp *)help {
    
    _help = help;
    
    self.textLabel.text = help.title;
}

@end
