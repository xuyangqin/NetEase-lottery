//
//  MMLuckyController.m
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMLuckyController.h"

@interface MMLuckyController ()

/**
 *  彩灯的图片框
 */
@property (nonatomic, weak) IBOutlet UIImageView *lightImgView;

@end

@implementation MMLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置背景
//    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"luck_entry_background"].CGImage;
    
    // MARK: - 彩灯动画效果实现
    // 1.赋值动画图片框
    self.lightImgView.animationImages = @[
                                          [UIImage imageNamed:@"lucky_entry_light0"],
                                          [UIImage imageNamed:@"lucky_entry_light1"]
                                          ];
    
    // 2.设置动画时间
    // 1秒钟将两张图片换一边!
    self.lightImgView.animationDuration = 1.0;
    
    // 3.开始动画
    [self.lightImgView startAnimating];
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
