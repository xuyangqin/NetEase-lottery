//
//  UIView+UIView_MDRExtension.m
//  网易彩票
//
//  Created by ios on 16/6/20.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIView+UIView_MDRExtension.h"

@implementation UIView (UIView_MDRExtension)

- (void)setX:(CGFloat)x {
    
    CGRect frame = self.frame;
    
    frame.origin.x = x;
    
    self.frame = frame;
    
}


- (CGFloat)x {
    
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    
    CGRect frame = self.frame;
    
    frame.origin.y = y;
    
    self.frame = frame;
    
}


- (CGFloat)y {
    
    return self.frame.origin.y;
}


- (void)setWidth:(CGFloat)width {
    
    CGRect frame = self.frame;
    
    frame.size.width = width;
    
    self.frame = frame;
    
}


- (CGFloat)width {
    
    return self.frame.size.width;
}


- (void)setHeight:(CGFloat)height {
    
    CGRect frame = self.frame;
    
    frame.size.height = height;
    
    self.frame = frame;
    
}


- (CGFloat)height {
    
    return self.frame.size.height;
}
@end
