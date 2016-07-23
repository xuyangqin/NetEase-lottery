//
//  MMAllCategoryButton.m
//  网易彩票
//
//  Created by ios on 16/6/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMAllCategoryButton.h"

@implementation MMAllCategoryButton
//调整图片框和label的位置
- (void)layoutSubviews{
    [super layoutSubviews];
    //互换位置
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5;
}
@end
