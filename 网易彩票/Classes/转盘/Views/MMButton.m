//
//  MMButton.m
//  幸运大转盘
//
//  Created by ios on 16/6/18.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMButton.h"

@implementation MMButton
#pragma mark - 自定义按钮，设置图片框的大小
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat width = 40;
    CGFloat height = 47;
    CGFloat y = 20;
    CGFloat x = (contentRect.size.width - width) * 0.5;
    return CGRectMake(x, y, width, height);
}
#pragma mark - 重写setHighlight方法，屏蔽按钮灰色效果
- (void)setHighlighted:(BOOL)highlighted{

}
@end
