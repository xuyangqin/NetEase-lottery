//
//  MMSettingCell.h
//  网易彩票
//
//  Created by ios on 16/6/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#pragma mark -抽宏
//组
#define MMHeader             @"MMHeader"           // 头部文字
#define MMFooter             @"MMFooter"           // 底部文字
#define MMItems              @"MMItems"            // 组内容
//行
#define MMIcon               @"MMIcon"             // 图片
#define MMTitle              @"MMTitle"            //标题
#define MMAccessoryType      @"MMAccessoryType"    //辅助视图类型
#define MMAccessoryName      @"MMAccessoryName"    //辅助视图名字
#define MMTargetVc           @"MMTargetVc"         //目标控制器
#define MDRCallFunction      @"MDRCallFunction"    //点击检查新版本被调用
#define MMPlistName          @"MMPlistName"        //加载plist文件
#define MMSubtitle           @"MMSubtitle"         //cell子标题
#define MMCellStyle          @"MMCellStyle"        //cell的样式
#define MMHighLight          @"MMHighLight"        //cell子标题的颜色
#define MMKeyName            @"MMKeyName"          //用来记录存储开关
#define MMTimeKey            @"MMTimeKey"          //用来记录存储时间
@interface MMSettingCell : UITableViewCell
//创建cell的类方法
+ (instancetype)cellWithTableVaiew:(UITableView *)tableView andItem:(NSDictionary *)items;
#pragma mark -定义一个字典属性
@property (nonatomic, strong) NSDictionary *items;
//设置一个属形用来显示时间
@property (nonatomic, copy) NSString *timeStr;
@end
