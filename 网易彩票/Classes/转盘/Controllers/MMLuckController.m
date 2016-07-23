//
//  MMLuckyController.m
//  幸运大转盘
//
//  Created by ios on 16/6/16.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMLuckController.h"
#import "MMRotateView.h"
@interface MMLuckController ()<MMRotateViewDelegate>
@property (nonatomic, weak) MMRotateView *rotateView;
@end

@implementation MMLuckController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置标题
    self.navigationItem.title = @"幸运大转盘";
    //设置左边关闭按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"LuckyBackground"].CGImage;
    MMRotateView *rotateView = [MMRotateView rotateView];
    rotateView.delegate = self;
    [self.view addSubview:rotateView];
    self.rotateView = rotateView;
    [rotateView startRotating];
}
- (void)close{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 布局子控件
// 控制器的视图布局子控件调用的方法!
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.rotateView.bounds = CGRectMake(0, 0, 286, 286);
    self.rotateView.center = self.view.center;

}
// MARK: -实现协议方法
- (void)MMRotateView:(MMRotateView *)rotateView didFinishChooseNumber:(NSString *)numberStr{
 //创建弹框
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:numberStr preferredStyle: UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //设置可以交互
        rotateView.userInteractionEnabled = YES;
      //让转盘接着转
        [rotateView startRotating];
    }];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}
#pragma mark - 状态栏白色
- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}
@end
