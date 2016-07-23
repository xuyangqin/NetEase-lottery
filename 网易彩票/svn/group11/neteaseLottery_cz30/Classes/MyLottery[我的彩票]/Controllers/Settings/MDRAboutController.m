//
//  MDRAboutController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRAboutController.h"

@interface MDRAboutController ()

@end

@implementation MDRAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置headerView
    UIView *headerV = [[[NSBundle mainBundle] loadNibNamed:@"MDRAboutHeaderView" owner:nil options:nil] lastObject];
    
    self.tableView.tableHeaderView = headerV;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

#pragma mark - 评分支持
- (void)scoreSupport {

    // 1.获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    
    // 2.打开网易彩票在AppStore的界面
    [app openURL:[NSURL URLWithString:@"http://itunes.apple.com/cn/app/id411654863?mt=8"]];
    
}

#pragma mark - 给客服打电话
- (void)callCustomerService {

    // 1.获取应用程序对象
    UIApplication *app = [UIApplication sharedApplication];
    
    // 2.打电话
    [app openURL:[NSURL URLWithString:@"tel://10086"]];
    
}

@end
