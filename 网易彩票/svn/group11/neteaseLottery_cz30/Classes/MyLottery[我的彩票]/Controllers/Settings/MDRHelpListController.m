//
//  MDRHelpListController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRHelpListController.h"
#import "MDRHelp.h"
#import "MDRHelpCell.h"
#import "MDRNavgationController.h"
#import "MDRWebViewController.h"

@interface MDRHelpListController ()
// 常见问题 模型数组
@property (nonatomic, strong) NSArray *helps;

@end

@implementation MDRHelpListController

#pragma mark - 懒加载
- (NSArray *)helps {
    if (!_helps) {
        
        // 加载help.json文件
        // 获取文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        // 转为二进制数据
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // 转为字典数组
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 转为模型数组
        NSMutableArray *arrM = [NSMutableArray array];
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            MDRHelp *help = [MDRHelp helpWithDict:obj];
            [arrM addObject:help];
            
        }];
        _helps = arrM;
    }
    return _helps;
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.helps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 1.创建cell
    MDRHelpCell *cell = [MDRHelpCell cellWithTableView:tableView];
    
    // 2.设置模型数据
    cell.help = self.helps[indexPath.row];
    
    // 3.返回cell
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 0.取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 1.选中cell，modal出网页控制器
    MDRHelpCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // 2.跳转到详情控制器
    MDRWebViewController *webVc = [[MDRWebViewController alloc] init];
    MDRNavgationController *nav = [[MDRNavgationController alloc] initWithRootViewController:webVc];
    
    // 3.设置模型
    webVc.help = cell.help;
    
    // 4.显示控制器
    [self presentViewController:nav animated:YES completion:nil];
    
}

@end
