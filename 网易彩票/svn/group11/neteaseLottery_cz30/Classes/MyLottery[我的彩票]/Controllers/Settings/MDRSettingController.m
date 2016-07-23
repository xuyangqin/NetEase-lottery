//
//  MDRSettingController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRSettingController.h"
#import "MDRSettingCell.h"

@interface MDRSettingController ()

@property (nonatomic, strong) NSArray *groupsArr;

@end

@implementation MDRSettingController

#pragma mark - 重写init方法，设置列表控制器为分组样式
- (instancetype)init {

    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.groupsArr.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSDictionary *dict = self.groupsArr[section];
    
    NSArray *items = dict[@"MDRItems"];
    
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // 2.1 获取组数据
    NSDictionary *group = self.groupsArr[indexPath.section];
    // 2.2 获取行数据
    NSArray *items = group[@"MDRItems"];
    
    // 2.3 赋值
    NSDictionary *item = items[indexPath.row];
    
    // 1. 创建cell
    MDRSettingCell *cell = [MDRSettingCell cellWithTableView:tableView andDict:item];
    
    // 2.设置数据
    cell.item = item;
    
    // 3.返回cell
    return cell;
}


#pragma mark - 代理方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 0. 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.取出要跳转控制器的名称
    // 1.1 获取选中组的内容
    NSDictionary *group = self.groupsArr[indexPath.section];
    
    // 1.2 获取选中行的内容
    NSArray *items = group[@"MDRItems"];
    
    // 1.3 获取选中的行
    NSDictionary *selectItem = items[indexPath.row];
    
    // 1.3 获取目标控制器的字符串
    NSString *targetVcStr = selectItem[@"MDRTargetVc"];
    
    if (selectItem[MDRCallFunction] && [selectItem[MDRCallFunction] length] > 0) {
        
        // 获取方法名
        NSString *selectorStr = selectItem[MDRCallFunction];
        
        // 转换为SEL
        SEL selector = NSSelectorFromString(selectorStr);
        
        
        BOOL isResponse = [self respondsToSelector:selector];
        
        if (isResponse) {
            
            [self performSelector:selector];
            
        } else {
            
            MDRLog(@"没有响应");
        }
    }
    
    // 1.4 如果没有目标控制器，不要执行跳转操作
    if (targetVcStr.length <=0) {
        return;
    }
    
    // 2.创建控制器进行跳转
    // 2.1 转为控制器类型名称
    Class className = NSClassFromString(targetVcStr);
    
    // 2.2 创建对象
    UIViewController *obj = [[className alloc] init];
    
    // 2.3 设置标题
    obj.navigationItem.title = selectItem[@"MDRTitle"];
    
    // 2.4 如果是跳转到设置控制器
    if ([obj isKindOfClass:[MDRSettingController class]]) {
        
        // 2.4.1 前转为设置控制器类型的对象
        MDRSettingController *settingVc = (MDRSettingController *)obj;
        
        // 2.4.2 设置plist文件名称
        settingVc.plistName = selectItem[@"MDRPlistName"];
        
        // 2.4.3 跳转
        [self.navigationController pushViewController:settingVc animated:YES];

    } else {
        
        // 2.4.1 强转为其他控制器
        UIViewController *otherVc = (UIViewController *)obj;
        
        // 2.4.2 跳转
        [self.navigationController pushViewController:otherVc animated:YES];
    }
}


// 返回组标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSDictionary *group = self.groupsArr[section];
    return group[MDRHeader];
}

// 返回组结尾
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    NSDictionary *group = self.groupsArr[section];
    return group[MDRFooter];
    
}

#pragma mark - 检查新版本
- (void)update {
    
    // 提醒控制器
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action];
    
    
    // 显示提醒
    [self presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - 懒加载
- (NSArray *)groupsArr {

    if (!_groupsArr) {
        
        // 1.加载plist文件全路径
        NSString *filePath = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        MDRLog(@"%@", self.plistName);
        
        
        MDRLog(@"%@", filePath);
        // 2.转为数组
        _groupsArr = [NSArray arrayWithContentsOfFile:filePath];
        
        MDRLog(@"%@", _groupsArr);

    }
    return _groupsArr;
}


@end
