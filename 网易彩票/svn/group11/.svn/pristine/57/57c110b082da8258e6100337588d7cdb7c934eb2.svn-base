//
//  MDRMyLotteryController.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/9.
//  Copyright © 2016年 M.D.R. All rights reserved.
//  我的彩票控制

#import "MDRMyLotteryController.h"
#import "MDRSettingController.h"
#import "MDRHelpListController.h"

@interface MDRMyLotteryController ()

@end

@implementation MDRMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img;


}

#pragma mark - 点击设置按钮跳转到设置控制器
- (IBAction)settingItemClick:(UIBarButtonItem *)sender {

    // 1.创建设置控制器
    MDRSettingController *settingVc = [[MDRSettingController alloc] init];
    
    // 1.2 设置标题
    settingVc.navigationItem.title = @"设置";
    
    // 1.3 设置要加载的plist文件名称
    settingVc.plistName = @"MDRSetting";
    
    // 设置常见问题按钮
    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(gotoHelpVc)];
    
    settingVc.navigationItem.rightBarButtonItem = helpItem;
    
    [self.navigationController pushViewController:settingVc animated:YES];
}

- (void)gotoHelpVc {
    
    // 跳转到常见问题控制器
    MDRHelpListController *helpVc = [[MDRHelpListController alloc] init];
    helpVc.navigationItem.title = @"常见问题";
    
    [self.navigationController pushViewController:helpVc animated:YES];
    
}
@end
