//
//  MMGroupBuyController.m
//  网易彩票
//
//  Created by ios on 16/6/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMGroupBuyController.h"
#import "UIView+UIView_MDRExtension.h"
@interface MMGroupBuyController ()
@property(nonatomic, weak) UIView *blueView;
@end

@implementation MMGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
   //创建下拉视图
    UIView *blueView = [[UIView alloc]init];
    blueView.x = 0;
    blueView.y = 64;
    blueView.width = self.view.width;
    blueView.height = 0;
    blueView.backgroundColor= QXYRandomColor;
    [self.view addSubview:blueView];
    self.blueView = blueView;
}
#pragma mark -点击全部猜种按钮，调用事件
- (IBAction)clickAllBtn:(UIButton *)sender {
   //弹出下拉视图，或回收
    //通过判断视图高度确定是否回收
    CGFloat height = 0;
    // 记录图片框transform的变量
    CGAffineTransform transform;
    if (self.blueView.height == 0) {
        height = 200;
        transform = CGAffineTransformMakeRotation(M_PI * 0.99999999);
        
    }else{
        height = 0;
        //复位
        transform = CGAffineTransformIdentity;
    }
    //设置动画
    [UIView animateWithDuration:0.5 animations:^{
        self.blueView.height = height;
        sender.imageView.transform = transform;
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
