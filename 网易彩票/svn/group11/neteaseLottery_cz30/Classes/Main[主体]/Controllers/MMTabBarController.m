//
//  MMTabBarController.m
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMTabBarController.h"
#import "MMBottomView.h"
                                // MARK: - 5.遵守协议
@interface MMTabBarController () <MMBottomViewDelegate>

@end

@implementation MMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.加载子控制器
    [self setupChildVcs];
    
    // MARK: - 2.添加底部的工具条
    [self setupBottomView];
    
    // 修改此属性,实现控制器的切换
//    self.selectedIndex = 1;
}

#pragma mark - 2.添加底部的工具条
- (void)setupBottomView {

    // MARK: - 1.添加底部视图
    // 1.创建
    MMBottomView *bottomView = [[MMBottomView alloc] init];
    
    // MARK: - 4.设置代理
    bottomView.delegate = self;
    
    // 2.设置背景
    bottomView.backgroundColor = MMRandomColor;
    
    // 3.设置frame信息
    // 添加给了系统的tabBar,好处:将来在隐藏底部工具条的时候,自定义的工具条也会隐藏!
    bottomView.frame = self.tabBar.bounds;
//    bottomView.frame = self.tabBar.frame;
    
    // 4.添加
    [self.tabBar addSubview:bottomView];
    
//    [self.view addSubview:bottomView];
    
    // MARK: - 2.遍历子控制器,bottomView去添加按钮
    // 1.遍历子控制器
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 拼接图片名称
        NSString *imgName = [NSString stringWithFormat:@"TabBar%@", @(idx + 1)];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar%@Sel", @(idx + 1)];
        
        // 创建两个图片
        UIImage *norImg = [UIImage imageNamed:imgName];
        UIImage *selImg = [UIImage imageNamed:selImgName];
        
        // 让bottomView添加一个按钮
        [bottomView addBtnWithImage:norImg andSelectImg:selImg];
        
    }];


}

#pragma mark - 代理方法 MMBottomViewDelegate
// MARK: - 6.实现协议方法,切换控制器!
- (void)bottomView:(MMBottomView *)bottomView didSelectIndex:(NSUInteger)idx {

    // 切换标签控制器底部选中的tabBarItem
    self.selectedIndex = idx;
}

#pragma mark - 1.加载子控制器
- (void)setupChildVcs {
    
    // 1.1 加载标签vc的子控制器
    // 大厅
    UINavigationController *navHall = [self navWithStoryboardName:@"MMHall"];
    
    // 竞技场
    UINavigationController *navArena = [self navWithStoryboardName:@"MMArena"];
    
    // 发现
    UINavigationController *navDiscovery = [self navWithStoryboardName:@"MMDiscovery"];
    
    // 历史信息
    UINavigationController *navHistory = [self navWithStoryboardName:@"MMHistory"];
    
    // 我的彩票
    UINavigationController *navMyLottery = [self navWithStoryboardName:@"MMMyLottery"];
    
    // 2.3设置标签vc的子控制器
    self.viewControllers = @[navHall, navArena, navDiscovery, navHistory, navMyLottery];
}

#pragma mark - 根据storyboard文件名称实例化其中带箭头的控制器
- (UINavigationController *)navWithStoryboardName:(NSString *)sbName {
    
    // - 获取storyboard文件
    UIStoryboard *sBoard = [UIStoryboard storyboardWithName:sbName bundle:nil];
    
    // - 实例化文件中的初始化控制器[或者根据标记实例化控制器]
    // 多态,父类的指针指向之类的对象!
    UINavigationController *nav = [sBoard instantiateInitialViewController];
    
    // - 直接修改控制器的背景
    // 获取到航控制器内栈顶控制器
    nav.topViewController.view.backgroundColor = MMRandomColor;
    
    // - 返回
    return nav;
}


@end
