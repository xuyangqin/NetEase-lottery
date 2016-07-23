//
//  MMTabBarController.m
//  网易彩票
//
//  Created by ios on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMTabBarController.h"
#import "MMBottomView.h"
@interface MMTabBarController ()<MMBottomViewDelegate>

@end

@implementation MMTabBarController

- (void)viewDidLoad {
    //QXYLog(@"你好世界");
    [super viewDidLoad];
     //加载子控制器
    [self setupChildVcs];
    //添加底部的工具条
    [self setupbottomView];
}
#pragma mark - 添加底部的工具条
- (void)setupbottomView{
    //创建底部视图
    MMBottomView *bottomView = [[MMBottomView alloc]init];
    bottomView.delegate = self;
    bottomView.backgroundColor =[UIColor redColor];
    bottomView.frame = self.tabBar.bounds;
    //把创建的底部视图添加到tabBar
    [self.tabBar addSubview:bottomView];
    //在底部视图上添加按钮，遍历子控制器
    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //拼接图片名称
        NSString *nolImgName = [NSString stringWithFormat:@"TabBar%@",@(idx +1)];
        NSString *selIMgName = [NSString stringWithFormat:@"TabBar%@Sel",@(idx + 1)];
        UIImage *nolImg = [UIImage imageNamed:nolImgName];
        UIImage *selImg = [UIImage imageNamed:selIMgName];
        [bottomView addBtnWithImage:nolImg andSelectImg:selImg];
    }];
}
#pragma mark -MMBottomViewDelegate的协议方法
- (void)MMBottomView:(MMBottomView *)bottomView didSelectIndex:(NSUInteger)idx{

    self.selectedIndex = idx;
}
#pragma mark - 加载子控制器
- (void)setupChildVcs{
    //购彩大厅
    UINavigationController *navHall =[self navWithStoryboardName:@"MMHall"];
    //竞技场
    UINavigationController *navArena = [self navWithStoryboardName:@"MMArena"];
    //发现
     UINavigationController *navDiscovery= [self navWithStoryboardName:@"MMDiscover"];
    //开奖
     UINavigationController *navHistory = [self navWithStoryboardName:@"MMHistory"];
    //我的彩票
     UINavigationController *navMyLottery = [self navWithStoryboardName:@"MMMyLottery"];
    //设置标签vc的子控制器
    self.viewControllers = @[navHall,navArena,navDiscovery,navHistory,navMyLottery];
}
#pragma mark - 根据storyboard文件名称实例化其中带箭头的控制器
- (UINavigationController *)navWithStoryboardName:(NSString *)sbName {
    //获取storyboard文件
    UIStoryboard *sboard = [UIStoryboard storyboardWithName:sbName bundle:nil];
     // - 实例化文件中的初始化控制器[或者根据标记实例化控制器]
    UINavigationController *nav = [sboard instantiateInitialViewController];
     nav.topViewController.view.backgroundColor = QXYRandomColor;
    return nav;
}
@end
