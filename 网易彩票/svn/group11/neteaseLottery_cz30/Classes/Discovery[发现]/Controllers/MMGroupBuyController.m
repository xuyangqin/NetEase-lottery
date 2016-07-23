//
//  MMGroupBuyController.m
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGroupBuyController.h"
#import "MMAllCategoryButton.h"

@interface MMGroupBuyController ()

/**
 *  下拉的随机色的视图
 */
@property (nonatomic, weak) UIView *blueView;

@end

@implementation MMGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // MARK: - 1.下拉视图
    UIView *blueV = [[UIView alloc] init];
    
    blueV.x = 0;
    blueV.y = 64;
    blueV.width = self.view.width;
    blueV.height = 0;
    
    blueV.backgroundColor = MMRandomColor;
    
    [self.view addSubview:blueV];
    
    // 赋值
    _blueView = blueV;
}

// 点击全部彩种按钮调用!
- (IBAction)allCategoryBtnClick:(MMAllCategoryButton *)sender {
    // - 弹出下拉视图
    // - 按钮的图片框旋转!

    // MARK: - 1.根据下拉视图的高度进行判断
    CGFloat height = 0;
    // 记录图片框transform的变量
    CGAffineTransform transform;
    
    if (self.blueView.height == 0) {
        
        height = 200;
        
        transform = CGAffineTransformMakeRotation(M_PI * 0.999);
        
    } else {
        
        height = 0;
        
        // 没有任何的形变
        transform = CGAffineTransformIdentity;
    }
    
    
    // 赋值
    // 通过动画进行改变!
    [UIView animateWithDuration:0.5 animations:^{
        
        self.blueView.height = height;
        sender.imageView.transform = transform;
    }];
    
}

@end
