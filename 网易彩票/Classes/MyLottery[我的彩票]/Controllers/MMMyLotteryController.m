//
//  MMMyLotteryController.m
//  网易彩票
//
//  Created by ios on 16/6/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMMyLotteryController.h"
#import "MMSettingController.h"
#import "MMHelpController.h"
@interface MMMyLotteryController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registButton;

@end

@implementation MMMyLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取图片
    UIImage *nolImg = [UIImage imageNamed:@"RedButton"];
    UIImage *pressImg = [UIImage imageNamed:@"RedButtonPressed"];
    //拉伸
    nolImg = [nolImg stretchableImageWithLeftCapWidth:nolImg.size.width * 0.5  topCapHeight:nolImg.size.height * 0.5];
    pressImg = [pressImg stretchableImageWithLeftCapWidth:pressImg.size.width * 0.5  topCapHeight:pressImg.size.height * 0.5];
    //设置
    [self.loginButton setBackgroundImage:nolImg forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:pressImg forState:UIControlStateHighlighted];
    [self.registButton setBackgroundImage:nolImg forState:UIControlStateNormal];
    [self.registButton setBackgroundImage:pressImg forState:UIControlStateHighlighted];
   }
//点击设置按钮跳转界面
- (IBAction)SettingView:(UIBarButtonItem *)sender {
  //创建控制器
    MMSettingController *setView = [[MMSettingController alloc]init];
    
    setView.title = @"设置";
   setView.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(gotohelp)];
    //加载首页的plistName
     setView.plistName =@"MMSettingHome.plist";
    [self.navigationController pushViewController:setView animated:YES];
}
- (void)gotohelp{
    MMHelpController *help = [[MMHelpController alloc]init];
    help.title = @"常见问题";
    [self.navigationController pushViewController:help animated:YES];
    
}
@end
