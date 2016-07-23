//
//  MDRScoreLiveController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRScoreLiveController.h"
#import "MDRSettingCell.h"

@interface MDRScoreLiveController ()
// 日期选择器
@property (nonatomic, strong) UIDatePicker *datePicker;

// 工具条
@property (nonatomic, strong) UIToolbar *toolbar;

// 文本框
@property (nonatomic, strong) UITextField *textField;

// 选中的cell
@property (nonatomic, weak) MDRSettingCell *selectedCell;
@end

@implementation MDRScoreLiveController

#pragma mark - 懒加载
- (UIDatePicker *)datePicker {
    if (!_datePicker) {
        _datePicker = [[UIDatePicker alloc] init];
        _datePicker.datePickerMode = UIDatePickerModeTime;
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}

- (UIToolbar *)toolbar {
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] init];
        
        // 设置工具条的高度
        _toolbar.height = 44;
        _toolbar.backgroundColor = [UIColor blueColor];
        // 完成按钮、取消、弹簧
        UIBarButtonItem *confirmItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(confirmClick)];
        UIBarButtonItem *cacelItem= [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
        
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        
        _toolbar.items = @[cacelItem, flex, confirmItem];
        
    }
    return _toolbar;
}

// 完成
- (void)confirmClick {
    
    // 1.获取时间
    NSDate *date = self.datePicker.date;
    
    // 2.转为字符串
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *str = [formatter stringFromDate:date];
    
    // 3.设置时间
    //    self.selectedCell.detailTextLabel.text = str;
    [self.selectedCell setDate:str];
    
    // 4.关闭键盘
    [self.view endEditing:YES];
    
    
}

// 取消
- (void)cancelClick {
    
    // 关闭键盘
    [self.view endEditing:YES];
    
}


- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        
        // 设置键盘为日期选择器，工具条
        _textField.inputView = self.datePicker;
        _textField.inputAccessoryView = self.toolbar;
        
    }
    return _textField;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        return;
    }
    
    // 设置时间
    MDRSettingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.selectedCell = cell;
    
    // 添加文本框
    [cell.contentView addSubview:self.textField];
    
    // 设置为第一响应者
    [self.textField becomeFirstResponder];
    
}

@end
