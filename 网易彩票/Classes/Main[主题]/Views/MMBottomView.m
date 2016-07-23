//
//  MMBottomView.m
//  网易彩票
//
//  Created by ios on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMBottomView.h"
#import "MMBottomButton.h"
@interface MMBottomView()
//被选中的按钮
@property (nonatomic, weak)UIButton *selButton;
@end
@implementation MMBottomView
#pragma mark -添加按钮
- (void)addBtnWithImage:(UIImage *)nolImg andSelectImg:(UIImage *)selImg{
   //创建按钮
    MMBottomButton *button = [MMBottomButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:nolImg forState:UIControlStateNormal];
    [button setBackgroundImage:selImg forState:UIControlStateSelected];
    [self addSubview:button];
    //添加监听按钮的点击事件
    [button addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchDown];
}
#pragma mark - 当点击按钮的时候调用
- (void)bottomButtonClick:(MMBottomButton *)sender{
  //清空以前被选中的按钮
    self.selButton.selected = NO;
    sender.selected = YES;
    self.selButton = sender;
    //通过代理的方法来实现控制器的切换
    if ([self.delegate respondsToSelector:@selector(MMBottomView:didSelectIndex:)]) {
        NSUInteger idx = [self.subviews indexOfObject:sender];
        [self.delegate MMBottomView:self didSelectIndex:idx];
    }
}
#pragma mark - 设置按钮的位置和大小
- (void)layoutSubviews{
    CGFloat buttonW = self.bounds.size.width / self.subviews.count;
    CGFloat buttonH = self.bounds.size.height;
    CGFloat buttonY = 0;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof MMBottomButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat buttonX = idx * buttonW;
        obj.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //设置进入界面后，默认选中的是第一个购彩大厅
        if (idx == 0) {
            [self bottomButtonClick:obj];
        }
    }];
}
@end
