//
//  MMProductCell.m
//  网易彩票
//
//  Created by ios on 16/6/23.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "MMProductCell.h"
#import "MMProduct.h"
@interface MMProductCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation MMProductCell

- (void)setModel:(MMProduct *)model{
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.title;
}
- (void)awakeFromNib {
    //切圆角
    self.iconImageView.layer.cornerRadius = 10;
    self.iconImageView.layer.masksToBounds = YES;
}

@end
