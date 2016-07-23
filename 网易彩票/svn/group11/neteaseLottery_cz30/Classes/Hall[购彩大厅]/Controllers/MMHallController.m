//
//  MMHallController.m
//  网易彩票
//
//  Created by ios on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMHallController.h"

@interface MMHallController ()
@property (nonatomic, strong)UIView *cover;
@property (nonatomic, strong)UIImageView *ImgView;
@end

@implementation MMHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置左侧的活动按钮
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
     // 调整大小 -> 根据图片自适应大小!
    [button sizeToFit];
    //添加按钮监听点击事件
    [button addTarget:self action:@selector(activityButtonClick:) forControlEvents:UIControlEventTouchDown];
    //将按钮包成item
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    //添加
    self.navigationItem.leftBarButtonItem = item;
}
#pragma mark -添加按钮监听点击事件
- (void)activityButtonClick:(UIButton *)sender{
   //1.创建遮盖
    UIView *cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.5;
    [self.tabBarController.view addSubview:cover];
    self.cover = cover;
    //2.创建弹出的图片框
    UIImageView *ImgView = [[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"showActivity"]];
    //设置图片的中心点
    ImgView.center = self.tabBarController.view.center;
    //设置图片框可以和用户交互
    ImgView.userInteractionEnabled = YES;
    //添加
    [self.tabBarController.view addSubview:ImgView];
    self.ImgView = ImgView;
    //3.添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    //自适应大小，并调制位置
    [btn sizeToFit];
    btn.x = ImgView.width - btn.width;
    btn.y = 0;
    //添加
    [ImgView addSubview:btn];
    //添加监听事件
    [btn addTarget:self action:@selector(closebtnClick) forControlEvents:UIControlEventTouchUpInside];

}
//添加监听事件
- (void)closebtnClick{
   //移除
   [UIView animateWithDuration:0.5 animations:^{
       _cover.alpha =  0;
       _ImgView.alpha = 0;
   } completion:^(BOOL finished) {
       [_cover removeFromSuperview];
       [_ImgView removeFromSuperview];
   }];
}
@end
