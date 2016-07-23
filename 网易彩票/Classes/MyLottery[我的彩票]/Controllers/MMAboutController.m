//
//  MMAboutController.m
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAboutController.h"

@interface MMAboutController ()

@end

@implementation MMAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加头部视图
    self.tableView.tableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MMAboutHeaderView" owner:nil options:nil] lastObject];
}
// //如果出现cell被盖住20的话,使用这个方法解决问题!
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 20;
//}

#pragma mark - 评分支持
- (void)scoreSupport {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/cn/app/wang-yi-cai-piao-le-ban-2016ou/id618888447?mt=8"]];
    
}

#pragma mark - 客服电话
- (void)callKFMM {
    // 真机才能打电话!
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
    
}
@end
