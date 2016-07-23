//
//  MMBottomView.m
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMBottomView.h"
#import "MMBottomButton.h"

@interface MMBottomView ()

/**
 *  记录选中的按钮
 */
@property (nonatomic, weak) MMBottomButton *selectButton;

@end


@implementation MMBottomView

#pragma mark - 添加按钮
- (void)addBtnWithImage:(UIImage *)img andSelectImg:(UIImage *)selImg {

    // 1.创建按钮
    MMBottomButton *btn = [MMBottomButton buttonWithType:UIButtonTypeCustom];
    
    // 不好使!
//    btn.adjustsImageWhenHighlighted = NO;
    // 2.设置图片
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    [btn setBackgroundImage:selImg forState:UIControlStateSelected];
    
    // 3.添加按钮
    [self addSubview:btn];
    
    // 4.监听按钮的点击事件
    [btn addTarget:self action:@selector(bottomButtonClick:) forControlEvents:UIControlEventTouchDown];
}

#pragma mark - 当点击底部按钮时调用
- (void)bottomButtonClick:(MMBottomButton *)sender {
    
    // MARK: - 1.切换按钮状态,并且只有一个按钮选中
    // 1.清除之前选中的按钮
    self.selectButton.selected = NO;
    // 2.修改当前选中的
    sender.selected = YES;
    // 3.赋值
    self.selectButton = sender;
    

    // MARK: - 2.让标签vc切换选中的控制器
    // 通过代理实现控制器切换!
    // MARK: - 3.判断并执行
    if ([self.delegate respondsToSelector:@selector(bottomView:didSelectIndex:)]) {
        
        // 3.1 获取选中按钮所在的索引
        NSUInteger idx = [self.subviews indexOfObject:sender];
        
        // 3.2 执行协议方法!
        [self.delegate bottomView:self didSelectIndex:idx];
    }
    

}

#pragma mark - 布局按钮
- (void)layoutSubviews {

    [super layoutSubviews];
    
    // 布局按钮
    // 宽/高/y
    CGFloat btnW = self.bounds.size.width / self.subviews.count;
    CGFloat btnH = self.bounds.size.height;
    
    CGFloat btnY = 0;
    
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof MMBottomButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // 设置按钮的frame
        obj.frame = CGRectMake(idx * btnW, btnY, btnW, btnH);
        
        // 设置默认的选中按钮
        if (idx == 4) {
            [self bottomButtonClick:obj];
        }
        
    }];
    

}

@end
