//
//  MMBottomView.h
//  网易彩票
//
//  Created by ios on 16/6/19.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMBottomView;
@protocol MMBottomViewDelegate <NSObject>
//可选的方法
@optional
- (void)MMBottomView:(MMBottomView *)bottomView didSelectIndex:(NSUInteger)idx;
@end
@interface MMBottomView : UIView
@property (nonatomic, weak) id < MMBottomViewDelegate> delegate;
//用来传递按钮属性的照片
- (void)addBtnWithImage:(UIImage *)nolImg andSelectImg:(UIImage *)selImg;
@end
