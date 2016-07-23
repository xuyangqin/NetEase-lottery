//
//  MDRSettingCell.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRSettingCell.h"

@implementation MDRSettingCell


- (void)setDate:(NSString *)dateString {
    self.detailTextLabel.text = dateString;
    
    // 保存时间
    // 获取偏好设置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 保存时间数据
    [userDefaults setObject:dateString forKey:self.item[MDRTime]];
    
    // 同步
    [userDefaults synchronize];
}

- (void)setItem:(NSDictionary *)item {
    
    _item = item;
    
    // 设置图片，标题，如果有图片再进行设置
    if (item[MDRIcon] && [item[MDRIcon] length] > 0) {
        self.imageView.image = [UIImage imageNamed:item[MDRIcon]];
    }
    self.textLabel.text = item[MDRTitle];
    
    
    self.detailTextLabel.backgroundColor = [UIColor grayColor];
    // 设置子标题
    if (item[MDRDetail] && [item[MDRDetail] length] > 0) {
        self.detailTextLabel.text = item[MDRDetail];
        
        if (item[MDRTime] && [item[MDRTime] length]> 0) {
            
            // 获取偏好设置
            NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
            NSString *time = [userDefaults objectForKey:item[MDRTime]];
            
            if (time.length > 0) {
                self.detailTextLabel.text = time;
                
            }
            
            
        }
        
    }
    
    if (item[MDRHighLight]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    } else {
        self.detailTextLabel.textColor = [UIColor blackColor];
    }
    
    
    //    self.detailTextLabel.text = item[MDRDetail];
    
    // 设置aceessory
    if (item[MDRAccessory] && [item[MDRAccessory] length] > 0) {
        
        // 将字符串转为类型
        Class className = NSClassFromString(item[MDRAccessory]);
        // 创建一个对象
        id obj = [[className alloc] init];
        
        if ([obj isKindOfClass:[UIImageView class]]) {
            UIImageView *imgView = (UIImageView *)obj;
            //            self.groupArr = nil;
            imgView.image = [UIImage imageNamed:item[MDRAccessoryName]];
            
            // 根据图片大小自动调整尺寸
            [imgView sizeToFit];
        }
        
        // 1.判断是否为开关类型
        if ([obj isKindOfClass:[UISwitch class]]) {
            
            // 强转为开关类型
            UISwitch *switcher = (UISwitch *)obj;
            
            // 从偏好设置读取开关状态
            if (item[MDRKeyName] && [item[MDRKeyName] length] > 0) {
                
                // 获取开关状态，并设置
                BOOL status = [self switcherStatusOfItem:item];
                switcher.on = status;
            }
            
            // 监听开关状态改变
            [switcher addTarget:self action:@selector(switcherDidChangeStatus:) forControlEvents:UIControlEventValueChanged];
        }
        
        self.accessoryView = obj;
        
    }
    
    
}

// 根据字典中keyName返回开关状态
- (BOOL)switcherStatusOfItem:(NSDictionary *)item {
    
    // 获取用户偏好设置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 获取状态
    return [userDefaults boolForKey:item[MDRKeyName]];
}

// 监听开关的值改变
- (void)switcherDidChangeStatus:(UISwitch *)switcher {
    
    // 获取用户偏好设置
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // 保存开关状态
    [userDefaults setBool:switcher.isOn forKey:self.item[MDRKeyName]];
    
    // 同步
    [userDefaults synchronize];
}


+ (instancetype)cellWithTableView:(UITableView *)tableView andDict:(NSDictionary *)item {
    
    static NSString *ID = @"item_cell";
    MDRSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[MDRSettingCell alloc] initWithStyle:[self cellStyleOfItem:item] reuseIdentifier:ID];
    }
    
    // 返回cell
    return cell;
    
}

+ (UITableViewCellStyle)cellStyleOfItem:(NSDictionary *)item {
    
    NSString *cellStyle = item[MDRCellStyle];
    
    if ([cellStyle isEqualToString:@"UITableViewCellStyleValue1"]) {
        return UITableViewCellStyleValue1;
    } else if ([cellStyle isEqualToString:@"UITableViewCellStyleValue2"]) {
        return UITableViewCellStyleValue2;
    } else if ([cellStyle isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        return UITableViewCellStyleSubtitle;
    } else {
        return UITableViewCellStyleDefault;
    }
    
}
@end
