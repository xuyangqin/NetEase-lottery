//
//  MMRotateView.h
//  幸运大转盘
//
//  Created by ios on 16/6/16.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMRotateView;
@protocol  MMRotateViewDelegate <NSObject>
@optional
- (void) MMRotateView:(MMRotateView *)rotateView didFinishChooseNumber:(NSString *)numberStr;
@end
@interface MMRotateView : UIView
@property (nonatomic, weak)id<MMRotateViewDelegate>delegate;
/** 类方法，共外界调用快速创建一个幸运转盘界面 */
+ (instancetype)rotateView;
/** 开始旋转的方法 */
- (void)startRotating;
@end
