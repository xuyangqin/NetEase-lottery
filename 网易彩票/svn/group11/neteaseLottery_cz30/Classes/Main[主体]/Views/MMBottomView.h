//
//  MMBottomView.h
//  neteaseLottery_cz30
//
//  Created by apple on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

// MARK: - 1.制定协议
@class MMBottomView;
@protocol MMBottomViewDelegate <NSObject>

@optional
- (void)bottomView:(MMBottomView *)bottomView didSelectIndex:(NSUInteger)idx;

@end


@interface MMBottomView : UIView

/**
 *  给底部视图添加按钮
 *
 *  @param img    普通状态的图片
 *  @param selImg 选中状态的图片
 */
- (void)addBtnWithImage:(UIImage *)img andSelectImg:(UIImage *)selImg;

// MARK: - 2.代理属性
@property (nonatomic, weak) id<MMBottomViewDelegate> delegate;

@end
