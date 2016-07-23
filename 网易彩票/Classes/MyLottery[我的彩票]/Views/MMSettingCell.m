//
//  MMSettingCell.m
//  网易彩票
//
//  Created by ios on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSettingCell.h"
@implementation MMSettingCell

+ (instancetype)cellWithTableVaiew:(UITableView *)tableView andItem:(NSDictionary *)items{
    static NSString *ID = @"cell";
    MMSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:[self cellStyleWithItem:items] reuseIdentifier:ID];    }
    return cell;
}
//确定cell的样式
+(UITableViewCellStyle)cellStyleWithItem:(NSDictionary *)items{
    UITableViewCellStyle style;
    if ([items[MMCellStyle] isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        style = UITableViewCellStyleSubtitle ;
    } else if ([items[MMCellStyle] isEqualToString:@"UITableViewCellStyleValue1"]){
        style = UITableViewCellStyleValue1;
    } else if ([items[MMCellStyle] isEqualToString:@"UITableViewCellStyleValue2"]){
        style = UITableViewCellStyleValue2;
    } else{
        style =  UITableViewCellStyleDefault;
    }
    return style;
}
- (void)setTimeStr:(NSString *)timeStr{
    _timeStr = timeStr;
    self.detailTextLabel.text = timeStr;
    //MARK: 1.存储时间
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:timeStr forKey:self.items[MMTimeKey]];
    [defaults synchronize];
}
//设置cell里面的内容
- (void)setItems:(NSDictionary *)items{
    _items = items;
    //设置内容
    //设置标题
    self.textLabel.text = items[MMTitle];
    if ([items[MMIcon] length] > 0) {
          self.imageView.image = [UIImage imageNamed:items[MMIcon]];
    }
    //设置子标题
      self.detailTextLabel.text = items[MMSubtitle];
    //MARK: 2.读取时间
    if ([items[MMTimeKey] length] > 0) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *timeStr = [defaults objectForKey:items[MMTimeKey]];
        if (timeStr.length > 0) {
            self.detailTextLabel.text = timeStr;
        }
    }
    //设置子标题的颜色
    if ([items[MMHighLight] boolValue]) {
        self.detailTextLabel.textColor = [UIColor redColor];
    }else{
        self.detailTextLabel.textColor = [UIColor blackColor];
    }
    //设置右侧的辅助视图
    //取出视图字符串
    NSString  *str = items[MMAccessoryType];
    if (str.length == 0) {
        return;
    }
    //转为类
    Class className = NSClassFromString(str);
    //创建对象
    id obj  =  [[className alloc]init];
    //判断类型
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *imageView =(UIImageView *)obj;
        imageView.image = [UIImage imageNamed:items[MMAccessoryName]];
        [imageView sizeToFit];
          self.accessoryView = imageView;
    }else if ([obj isKindOfClass:[UISwitch class]]){
        UISwitch *switchs = (UISwitch *)obj;
        //监听开关值改变的事件
        [switchs addTarget:self action:@selector(switchsValueChanged:) forControlEvents:UIControlEventValueChanged];
        //读取开关数据
        if ([items[MMKeyName] length] > 0) {
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            switchs.on = [defaults boolForKey:items[MMKeyName]];
        }
                 self.accessoryView = switchs;
    }

}
- (void)switchsValueChanged:(UISwitch *)sender{
//存储开关的状态
     // 1.获取偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     // 2.存储开关的状态
    [defaults setBool:sender.isOn forKey:self.items[MMKeyName]];
     // 3.同步
    [defaults synchronize];

}
@end
