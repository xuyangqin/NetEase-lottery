//
//  MMNavigationController.m
//  网易彩票
//
//  Created by ios on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMNavigationController.h"

@interface MMNavigationController ()

@end

@implementation MMNavigationController
// 系统初始化,当前类时调用!
+ (void)initialize{
    // 统一设置导航条外观
    // 0.获取导航条的外观代理对象 proxy 代理
    // 通过appearance方法获取导航条的外观代理对象,是个单例!
    // 直接决定了导航条的外观! -> 以后其他所有此类型的对象,显示效果都一样!
    UINavigationBar *navBar = [UINavigationBar appearance];
     // MARK: - 1设置背景
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:  UIBarMetricsDefault];
     // MARK: - 2.设置标题颜色
    [navBar setTitleTextAttributes:@{
                                    NSForegroundColorAttributeName:[UIColor whiteColor]
                                    
                                    }];
    
    // MARK: - 3.修改导航栏两侧按钮的颜色
    [navBar setTintColor:[UIColor whiteColor]];

}
#pragma mark - 重写系统的push方法!隐藏底部的工具条
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
// 可以拦截pop操作!
- (UIViewController *)popViewControllerAnimated:(BOOL)animated{

    return [super popViewControllerAnimated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
