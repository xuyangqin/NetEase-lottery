//
//  MMSettingController.m
//  网易彩票
//
//  Created by ios on 16/6/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMSettingController.h"
#import "MMSettingCell.h"

@interface MMSettingController ()
@property (nonatomic, strong) NSArray *groupList;
@end

@implementation MMSettingController
#pragma mark - 重写init方法,返回分组样式的tableView
- (instancetype)init{

    return [super initWithStyle:UITableViewStyleGrouped];
}
#pragma mark -懒数据加载
- (NSArray *)groupList{
    if (_groupList == nil) {
        NSString *path = [[NSBundle mainBundle]pathForResource:self.plistName ofType:nil];
        _groupList = [NSArray arrayWithContentsOfFile:path];
    }
    return _groupList;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
}
#pragma mark - Table view data sources数据源方法
//组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groupList.count;
//    return 1;
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *group = self.groupList[section];
    NSArray *arry = group[MMItems];
    return arry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *group = self.groupList[indexPath.section];
    NSArray *arry = group[MMItems];
    NSDictionary *items = arry[indexPath.row];
    //创建cell
    MMSettingCell *cell = [MMSettingCell cellWithTableVaiew:tableView andItem:items];
    cell.items = items;
    return cell;
}
#pragma mark - tableview的里方法
//显示头部内容
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *group = self.groupList[section];
    return group[MMHeader];
}
//显示底部视图
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDictionary *group = self.groupList[section];
    return group[MMFooter];
}
//当选中某一行cell时，被调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取出内容
    NSDictionary *group = self.groupList[indexPath.section];
    NSArray *arry = group[MMItems];
    NSDictionary *items = arry[indexPath.row];
    //调用方法
    if (items[MDRCallFunction]  && [items[MDRCallFunction] length] >0) {
        NSString *str1 = items[MDRCallFunction];
        SEL selector = NSSelectorFromString(str1);
        if ([self respondsToSelector:selector]) {
#pragma clang diagnostic push
            
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            // 执行方法的代码
            [self performSelector:selector];
            
#pragma clang diagnostic pop
        }else{
            NSLog(@"没有响应");
        }
    }
    //跳转界面
     NSString *str = items[MMTargetVc];
    if (str.length == 0 ) {
        return;
    }
    Class className = NSClassFromString(str);
    UIViewController *obj = [[className alloc]init];
    obj.navigationItem.title = items[MMTitle];
   //判断,如果对象是设置vc类型的对象,需要设置加载的plist文件
    if ([obj isKindOfClass:[MMSettingController class]]) {
      // 1.强转为真实类型
        MMSettingController *setvc = (MMSettingController *)obj;
        setvc.plistName = items[MMPlistName];
        [self.navigationController pushViewController:obj animated:YES];
    }else{
    [self.navigationController pushViewController:obj animated:YES];
    }
}
//点击检查新版本
- (void)update{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
