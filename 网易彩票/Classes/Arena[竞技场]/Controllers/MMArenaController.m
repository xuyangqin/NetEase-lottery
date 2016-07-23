//
//  MMArenaController.m
//  网易彩票
//
//  Created by ios on 16/6/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMArenaController.h"

@interface MMArenaController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation MMArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    // MARK: - 1.设置控制器的背景
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    // MARK: - 2.设置导航条的背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics: UIBarMetricsDefault];
     // MARK: - 3.设置导航栏上面的segment控件!
    //3.1 设置普通状态下的图片
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //3.2设置选中状态下的图片
    [self.segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    // MARK: -4:设置标题文字颜色
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName: [UIColor whiteColor]
                           };
    [self.segment setTitleTextAttributes:dict forState:UIControlStateNormal];
    [self.segment setTitleTextAttributes:dict forState:UIControlStateSelected];
    // 通过设置tintColor取消中间的线
    [self.segment setTintColor:[UIColor clearColor]];
}
@end
