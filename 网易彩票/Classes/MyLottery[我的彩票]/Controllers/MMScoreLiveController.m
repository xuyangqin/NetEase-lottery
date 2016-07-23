//
//  MMScoreLiveController.m
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//
#import "MMScoreLiveController.h"
#import "MMSettingCell.h"
@interface MMScoreLiveController ()
//时间选择控件
@property (nonatomic, strong) UIDatePicker *datePicker;
//toolbar控件
@property (nonatomic, strong) UIToolbar *toolBar;
//文本框
@property (nonatomic, strong) UITextField *txtField;
//选中的cell
@property (nonatomic, weak) MMSettingCell *selectcell;
@end

@implementation MMScoreLiveController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   //继承父类选中某一行的效果
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    //除了选中第0组，其它都执行
    if (indexPath.section == 0) {
        return;
    }
     // 1.获取选中的cell
    MMSettingCell *selectcell = [tableView cellForRowAtIndexPath:indexPath];
        // 2.将文本框添加给选中的cell
    [selectcell.contentView addSubview:self.txtField];
     // 3.让文本框成为第一响应者,键盘出现!
    [self.txtField becomeFirstResponder];
    self.selectcell = selectcell;

}
#pragma mark -设置下面的弹出窗口
//懒加载
- (UIDatePicker *)datePicker{
    if (_datePicker == nil) {
        //创建
        _datePicker = [[UIDatePicker alloc]init];
         // 2.设置mode和locale
        _datePicker.datePickerMode = UIDatePickerModeTime;
        _datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    }
    return _datePicker;
}
- (UIToolbar *)toolBar{
    if (_toolBar == nil) {
        //创建
        _toolBar = [[UIToolbar alloc]init];
        //设置frame，至少设置一个高度，才能正常显示
        _toolBar.frame = CGRectMake(0, 0, 0, 44);
        //给toobar设置三个选项
        //取消
        UIBarButtonItem *scale = [[UIBarButtonItem alloc]initWithTitle:@"取消" style: UIBarButtonItemStylePlain target:self action:@selector(cancel)];
        //弹簧
        UIBarButtonItem *flexItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        //完成
        UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:  UIBarButtonItemStylePlain target:self action:@selector(done)];
        //添加
        _toolBar.items = @[scale,flexItem,done];
    }
    return _toolBar;
}
- (UITextField *)txtField{
    if (_txtField == nil) {
        _txtField = [[UITextField alloc]init];
        _txtField.inputView = self.datePicker;
        _txtField.inputAccessoryView = self.toolBar;
    }
    return _txtField;
}
//取消和完成的方法
- (void)cancel{
   
    //取消键盘
    [self.view endEditing:YES];
}
- (void)done{
    //当点击完成按钮的时候，获取当前选中的时间
    NSDate *date = self.datePicker.date;
    //日期格式化对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm";
    //将日期转换为字符串
    NSString *timeStr = [formatter stringFromDate:date];
    //显示,将时间显示交给cell自己完成
    self.selectcell.timeStr = timeStr;
    //取消键盘
    [self.view endEditing:YES];
}
@end
