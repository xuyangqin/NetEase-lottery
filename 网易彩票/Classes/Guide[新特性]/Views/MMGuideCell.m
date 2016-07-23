//
//  MMGuideCell.m
//  网易彩票
//
//  Created by ios on 16/6/24.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGuideCell.h"
#import "MMTabBarController.h"
@implementation MMGuideCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       //创建按钮
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [button sizeToFit];
        button.x = (self.width - button.width) * 0.5;
        button.y = self.height * 0.85;
        [self.contentView addSubview:button];
        self.button = button;
        //添加监听事件
        [button addTarget:self action:@selector(buttonStartClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)buttonStartClick{
 // 切换应用程序主窗口的根控制器
    [UIApplication sharedApplication].keyWindow.rootViewController = [[MMTabBarController alloc]init];
}
@end
