//
//  MMAllCategoryButton.m
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAllCategoryButton.h"

@implementation MMAllCategoryButton

#pragma mark - 按钮内部布局子控件的方法
// 重新调整图片框和label的位置
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    // 互换位置
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5; // 间距为5

}
@end
