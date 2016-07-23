//
//  MDRProductCell.m
//  NeteaseLottery
//
//  Created by 刘春牢 on 16/1/10.
//  Copyright © 2016年 M.D.R. All rights reserved.
//

#import "MDRProductCell.h"
#import "MDRProduct.h"

@interface MDRProductCell ()

// 头像
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

// 应用名称
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@end

@implementation MDRProductCell

- (void)setProduct:(MDRProduct *)product {
    
    _product = product;
    
    // 设置应用头像与名称
    self.iconView.image = [UIImage imageNamed:product.icon];
    self.nameLable.text = product.title;
    
}

- (void)awakeFromNib {
    
    self.iconView.layer.cornerRadius = 10;
    self.iconView.layer.masksToBounds = YES;
    
}

@end
