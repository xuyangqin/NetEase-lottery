//
//  MMRotateView.m
//  幸运大转盘
//
//  Created by ios on 16/6/16.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMRotateView.h"
#import "MMButton.h"
@interface MMRotateView()
@property (weak, nonatomic) IBOutlet UIImageView *rotateImageView;
/** 被选中的按钮 */
@property (nonatomic, weak)UIButton  *selectBtn;
//定时器
@property (nonatomic, strong)CADisplayLink *link;
@end
@implementation MMRotateView
+ (instancetype)rotateView{

    return  [[[NSBundle mainBundle] loadNibNamed:@"MMRotateView" owner:nil options:nil]lastObject];
}
#pragma mark - 设置base背景
- (void)awakeFromNib{
    // MARK: - 1.设置baseBackground背景
    self.layer.contents = (__bridge id)[UIImage imageNamed:@"LuckyBaseBackground"].CGImage;
    // MARK: - 2.添加按钮
    for (int i = 0; i < 12 ; i++) {
        MMButton *button = [MMButton buttonWithType:UIButtonTypeCustom];
//        button.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/250.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];
         // 设置背景图片
        [button setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
         // 设置按钮普通状态和选中状态的图片
        UIImage *nolImg = [self createImgWithImg:[UIImage imageNamed:@"LuckyAstrology"] andIndex:i];
         UIImage *selImg = [self createImgWithImg:[UIImage imageNamed:@"LuckyAstrologyPressed"] andIndex:i];
        [button setImage:nolImg forState:UIControlStateNormal];
         [button setImage:selImg forState:UIControlStateSelected];
        [self.rotateImageView addSubview:button];
        [button addTarget:self action:@selector(MMbuttonClick:) forControlEvents:UIControlEventTouchDown];
    }
}
- (void)MMbuttonClick:(MMButton *)sender {
    // 取消选中按钮的选中状态
    self.selectBtn.selected = NO;
    // 设置被选中的按钮的选中状态
    sender.selected = YES;
     // 保存为被选中的按钮
    self.selectBtn = sender;
}
#pragma mark -裁剪图片
- (UIImage *)createImgWithImg:(UIImage *)image andIndex:(int)idx {
    // 计算区域
    CGFloat width = image.size.width / 12;
    CGFloat height= image.size.height;
    CGFloat x = idx * width;
    CGFloat y = 0;
    // 获取屏幕的缩放因子
    CGFloat scale = [UIScreen mainScreen].scale;
    width *= scale;
    height *= scale;
    x *= scale;
    y *= scale;
     // 根据传入的范围裁切传入的图片，生成一张新的图片
    CGImageRef cgimg =  CGImageCreateWithImageInRect(image.CGImage, CGRectMake(x, y, width, height));
    //转换
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);
    return img;
}
- (void)layoutSubviews{
 // 遍历按钮进行局部
    CGSize size = self.rotateImageView.bounds.size;
    CGFloat angle = M_PI * 2/self.rotateImageView.subviews.count;
    [self.rotateImageView.subviews enumerateObjectsUsingBlock:^(__kindof MMButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.bounds = CGRectMake(0, 0, 68, 143);
        obj.center = CGPointMake(size.width/2, size.height/2);
        obj.layer.anchorPoint = CGPointMake(0.5, 1);
        obj.transform = CGAffineTransformMakeRotation(idx * angle);
    }];
}
- (IBAction)startButton:(UIButton *)sender {
    //设置不可与用户交互
    self.userInteractionEnabled = NO;

    //关闭定时器
    [self.link invalidate];
    _link = nil;
    // 1.开启核心动画
  //让rotateImageView转起来
   CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    // 设置基本信息
    // 1.2 设置代理
    anim.delegate = self;
    // 设置旋转角度
     //  获取选中按钮在父控件中的索引!
    NSUInteger idx = [self.rotateImageView.subviews indexOfObject:self.selectBtn];
    NSLog(@"%@",@(idx));
    //少转动的角度
    CGFloat shortAngle = (M_PI * 2 / 12) * idx;
    anim.toValue = @(M_PI * 2 * 4 - shortAngle);
    // 设置时间
    anim.duration = 3;
    //结束后不要移除
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    [self.rotateImageView.layer addAnimation:anim forKey:nil];
}
#pragma mark - 核心动画结束的方法
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
  // 让控件真身过去!
    NSUInteger idx = [self.rotateImageView.subviews indexOfObject:self.selectBtn];
    CGFloat shortAngle = (M_PI * 2 / 12) * idx;
    self.rotateImageView.transform = CGAffineTransformMakeRotation(-shortAngle);
     // 结束后,需要将核心动画移除
    [self.rotateImageView.layer removeAllAnimations];
    // MARK: - 让控制器给用户提示
    // MARK: - 判断并执行
    if ([self.delegate respondsToSelector:@selector(MMRotateView:didFinishChooseNumber:)]) {
        [self.delegate MMRotateView:self didFinishChooseNumber:@"1,3,123,12321"];
    }
}
//设置定时器开始转动
- (void)startRotating{
       // 1.开启定时器
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(beginRotating)];
     // 2.将定时器添加到运行循环中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    _link = link;
}
- (void)beginRotating{
    // 让转盘开始转动
    self.rotateImageView.transform = CGAffineTransformRotate(self.rotateImageView.transform, M_PI_4 * 0.015 );
}
@end
