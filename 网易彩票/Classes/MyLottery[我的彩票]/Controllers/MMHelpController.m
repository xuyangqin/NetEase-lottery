//
//  MMHelpController.m
//  网易彩票
//
//  Created by ios on 16/6/25.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMHelpController.h"
#import "MMHelpModel.h"
#import "MMHelpCell.h"
#import "MMWebController.h"
@interface MMHelpController ()
@property (nonatomic, strong) NSArray *helpArr;
@end

@implementation MMHelpController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
#pragma mark -懒加载
- (NSArray *)helpArr{
    if (_helpArr == nil) {
        //1.加载文件路径
        NSString *path = [[NSBundle mainBundle]pathForResource:@"help.json" ofType:nil];
         // 2.转为NSData类型的数据
        NSData *data = [NSData dataWithContentsOfFile:path];
        // 3.序列化
        NSArray *array  =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //4.遍历
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict  in array) {
            MMHelpModel *model = [MMHelpModel helpWithDict:dict];
            [arrayM addObject:model];
        }
        _helpArr = arrayM.copy;
    }

    return _helpArr;
}
#pragma mark - tableView的代理方法
//选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取选中的cell
    MMHelpCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //跳转控制器
    MMWebController *web = [[MMWebController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:web];
    web.model = cell.model;
    //模态跳转
    [self presentViewController:nav animated:YES completion:nil];
}
#pragma mark - Table view data source数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {    return self.helpArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    MMHelpCell *cell = [MMHelpCell cellWithTableView:tableView];
    cell.model = self.helpArr[indexPath.row];
    return cell;    
}
@end
