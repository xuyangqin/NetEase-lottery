//
//  MMLuckyController.m
//  网易彩票
//
//  Created by ios on 16/6/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMLuckyController.h"
#import "MMLuckController.h"
@interface MMLuckyController ()
@property (weak, nonatomic) IBOutlet UIImageView *lightImgView;

@end

@implementation MMLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置彩灯
    self.lightImgView.animationImages = @[
                                          [UIImage imageNamed:@"lucky_entry_light0"],
                                          [UIImage imageNamed:@"lucky_entry_light1"]
                                          ];
     //设置动画时间
    self.lightImgView.animationDuration = 1.0;
    //开始动画
    [self.lightImgView startAnimating];
    
}
- (IBAction)luckButtonclick:(UIButton *)sender {
    MMLuckController *lucky = [[MMLuckController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:lucky];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
